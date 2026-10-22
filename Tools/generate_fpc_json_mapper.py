#!/usr/bin/env python3
"""Generate an FPC JSON-to-object mapper for the fastTelega model.

The generator reads class and property declarations from Source/AvailableTypes
and emits public-property based Fill/FromJson functions. It is used by the
Free Pascal compatibility layer; Delphi keeps using Rest.JSON.
"""
import os, re

SRC = os.path.join(os.path.dirname(__file__), '..', 'Source', 'AvailableTypes')
OUT = os.path.join(os.path.dirname(__file__), '..', 'Source', 'Compat', 'FPC', 'fastTelega.JsonMapper.pas')

PRIM = {'string':'String', 'ansistring':'String', 'integer':'Integer', 'int64':'Int64',
        'boolean':'Boolean', 'double':'Double', 'single':'Single', 'byte':'Byte',
        'cardinal':'Cardinal', 'word':'Word'}

def snake(name):
    if name.endswith('_S'):
        name = name[:-2]
    s = re.sub(r'([A-Z]+)([A-Z][a-z])', r'\1_\2', name)
    s = re.sub(r'([a-z0-9])([A-Z])', r'\1_\2', s)
    return s.lower()

def read_units():
    units=[]
    classes={}
    enums=set()
    files=sorted(os.listdir(SRC))
    files.sort(key=lambda f: (f!='fastTelega.AvailableTypes.pas', f))
    for fn in files:
        if not fn.endswith('.pas'): continue
        path=os.path.join(SRC,fn)
        text=open(path,encoding='utf-8-sig').read()
        m=re.search(r'^unit\s+([\w.]+)', text, re.M)
        if not m:
            continue
        uname=m.group(1)
        if not uname.startswith('fastTelega.AvailableTypes'):
            continue
        units.append(uname)
        # enums (simple)
        for em in re.finditer(r'^\s{2}(\w+)\s*=\s*\(([^;]*?)\);', text, re.M|re.S):
            if em.group(1).startswith('T'):
                enums.add(em.group(1))
        lines=text.splitlines()
        i=0
        while i < len(lines):
            m=re.match(r'^  (Tft\w+)\s*=\s*class(?:\s*\((\w+)\))?\s*$', lines[i])
            if not m:
                i+=1; continue
            name=m.group(1); base=m.group(2)
            j=i+1; block=[]
            while j < len(lines):
                if re.match(r'^  end;\s*$', lines[j]): break
                block.append(lines[j]); j+=1
            btxt='\n'.join(block)
            props=[]
            for pm in re.finditer(r'property\s+(\w+)\s*:\s*([^;]+?)\s+read\s+\w+(?:\s+write\s+\w+)?;', btxt, re.S):
                pname=pm.group(1); ptype=' '.join(pm.group(2).split())
                if re.search(r'\bwrite\b', pm.group(0)):
                    props.append((pname,ptype))
            ctors=re.findall(r'constructor\s+Create\s*\(([^)]*)\)', btxt, re.S)
            param_ctor=any(c.strip() for c in ctors)
            if name in classes:
                # Duplicate class in a legacy unit: skip this unit entirely.
                units.pop()
                break
            classes[name]={'base':base,'props':props,'param_ctor':param_ctor}
            i=j+1
    return units, classes, enums

def split_generic(t):
    t=t.strip()
    for prefix in ('TArray<','TList<','TObjectList<'):
        if t.startswith(prefix) and t.endswith('>'):
            return prefix[:-1], t[len(prefix):-1].strip()
    return None, None

def ctor_expr(cls):
    if cls in ('TftInlineKeyboardButton','TftKeyboardButton','TftInputMessageContent'):
        return f'{cls}.Create(\'\')'
    return f'{cls}.Create'

def is_array_type(p):
    k, inner = split_generic(p)
    if k is not None:
        return True, inner
    if p in ('TftMessageEntityList','TftPhotoSizeList','TftMessageList','TftUserList'):
        return True, {'TftMessageEntityList':'TftMessageEntity','TftPhotoSizeList':'TftPhotoSize','TftMessageList':'TftMessage','TftUserList':'TftUser'}[p]
    return False, None

def emit_fill(name, info, classes, enums, out):
    base=info['base']
    if base and base in classes:
        out.append(f'  if Assigned(AObj) then Fill{base}(AJSON, {base}(AObj));')
    for pname,ptype in info['props']:
        key=snake(pname)
        if pname == 'UserName': key='username'
        elif pname.startswith('Type'): key='type'
        # skip unsupported
        p=ptype
        is_arr, inner = split_generic(p)
        if p.lower() in PRIM:
            pass
        elif is_arr and inner in classes:
            pass
        elif is_arr and inner.lower() in PRIM:
            pass
        elif is_arr and inner in ('Integer','String','Boolean','Int64'):
            pass
        elif p in classes:
            pass
        elif p in ('TftMessageEntityList','TftPhotoSizeList','TftMessageList','TftUserList'):
            is_arr='TArray'; inner={'TftMessageEntityList':'TftMessageEntity','TftPhotoSizeList':'TftPhotoSize','TftMessageList':'TftMessage','TftUserList':'TftUser'}[p]
        elif p in enums:
            pass
        else:
            out.append(f'  // skipped unsupported property {name}.{pname}: {p}')
            continue
        v=f'LValue'
        out.append(f'  LValue := AJSON.GetValue(\'{key}\');')
        out.append('  if LValue <> nil then')
        out.append('  begin')
        if p.lower() in PRIM:
            conv={'string':'LValue.AsString','ansistring':'LValue.AsString','integer':'LValue.AsInt64',
                  'int64':'LValue.AsInt64','boolean':'LValue.AsBoolean','double':'LValue.AsFloat',
                  'single':'LValue.AsFloat','byte':'LValue.AsInt64','cardinal':'LValue.AsInt64','word':'LValue.AsInt64'}[p.lower()]
            out.append(f'    AObj.{pname} := {conv};')
        elif is_arr:
            out.append('    if LValue.JSONType = jtArray then')
            out.append('    begin')
            kind, _ = split_generic(p)
            if kind in ('TList','TObjectList'):
                out.append(f'      if AObj.{pname} = nil then AObj.{pname} := {kind}<{inner}>.Create;')
                out.append(f'      AObj.{pname}.Clear;')
                out.append('      for LI := 0 to TJSONArray(LValue).Count - 1 do')
                if inner in classes:
                    out.append(f'        AObj.{pname}.Add({inner}FromJson(TJSONArray(LValue).Items[LI]));')
                elif inner.lower() in ('string',):
                    out.append(f'        AObj.{pname}.Add(TJSONArray(LValue).Items[LI].AsString);')
                elif inner.lower() in ('boolean',):
                    out.append(f'        AObj.{pname}.Add(TJSONArray(LValue).Items[LI].AsBoolean);')
                else:
                    out.append(f'        AObj.{pname}.Add(TJSONArray(LValue).Items[LI].AsInt64);')
            else:
                larr=f'LArr_{pname}'
                out.append(f'      {larr} := AObj.{pname};')
                out.append(f'      SetLength({larr}, TJSONArray(LValue).Count);')
                out.append('      for LI := 0 to TJSONArray(LValue).Count - 1 do')
                if inner in classes:
                    out.append(f'        {larr}[LI] := {inner}FromJson(TJSONArray(LValue).Items[LI]);')
                elif inner.lower() in ('string',):
                    out.append(f'        {larr}[LI] := TJSONArray(LValue).Items[LI].AsString;')
                elif inner.lower() in ('boolean',):
                    out.append(f'        {larr}[LI] := TJSONArray(LValue).Items[LI].AsBoolean;')
                else:
                    out.append(f'        {larr}[LI] := TJSONArray(LValue).Items[LI].AsInt64;')
                out.append(f'      AObj.{pname} := {larr};')
            out.append('    end;')
        elif p in classes:
            out.append('    if LValue.JSONType = jtObject then')
            out.append('    begin')
            out.append(f'      if AObj.{pname} = nil then AObj.{pname} := {ctor_expr(p)};')
            out.append(f'      Fill{p}(LValue, AObj.{pname});')
            out.append('    end;')
        elif p in enums:
            out.append(f'    AObj.{pname} := {p}(GetEnumValue(TypeInfo({p}), LValue.AsString));')
        out.append('  end;')

def main():
    units, classes, enums = read_units()
    out=[]
    out.append('unit fastTelega.JsonMapper;')
    out.append('')
    out.append('{$IFDEF FPC}')
    out.append('{$MODE DELPHI}{$H+}')
    out.append('{$ENDIF}')
    out.append('')
    out.append('interface')
    out.append('')
    out.append('uses')
    out.append('  SysUtils, TypInfo, Generics.Collections, System.JSON, fpjson,')
    for u in units:
        out.append(f'  {u},')
    out[-1]=out[-1].rstrip(',')+';'
    out.append('')
    for n in sorted(classes):
        out.append(f'procedure Fill{n}(const AJSON: TJSONData; const AObj: {n});')
        out.append(f'function {n}FromJson(const AJSON: TJSONData): {n};')
    out.append('')
    out.append('implementation')
    out.append('')
    for n in sorted(classes):
        out.append(f'procedure Fill{n}(const AJSON: TJSONData; const AObj: {n});')
        out.append('var')
        out.append('  LValue: TJSONData;')
        out.append('  LI: Integer;')
        for pn,pt in classes[n]['props']:
            isarr,inner=is_array_type(pt)
            kind,_=split_generic(pt)
            if isarr and kind not in ('TList','TObjectList'):
                out.append(f'  LArr_{pn}: {pt};')
        out.append('begin')
        out.append('  if (AJSON = nil) or (AObj = nil) then Exit;')
        emit_fill(n, classes[n], classes, enums, out)
        out.append('end;')
        out.append('')
        out.append(f'function {n}FromJson(const AJSON: TJSONData): {n};')
        out.append('begin')
        out.append(f'  Result := {ctor_expr(n)};')
        out.append(f'  Fill{n}(AJSON, Result);')
        out.append('end;')
        out.append('')
    out.append('end.')
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    open(OUT,'w',encoding='utf-8').write('\n'.join(out)+'\n')
    print(f'generated {len(classes)} classes, {len(enums)} enums')

if __name__=='__main__':
    main()
