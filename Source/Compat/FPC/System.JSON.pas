unit System.JSON;

{$IFDEF FPC}
{$MODE DELPHI}
{$ENDIF}

interface

uses
  SysUtils,
  Classes,
  fpjson, jsonparser;

type
  TJSONValue = TJSONData;
  TJSONObject = fpjson.TJSONObject;
  TJSONArray = fpjson.TJSONArray;

  TJSONDataHelper = class helper for TJSONData
  public
    function ToJSON: String;
    function GetValue(const AName: String): TJSONData;
    function GetValueString: String;
    property Value: String read GetValueString;
  end;

  TJSON = class
  public
    class function ParseJSONValue(const AData: String): TJSONValue;
  end;

function JsonToString(const AValue: TJSONData): String;
function JsonToBool(const AValue: TJSONData): Boolean;
function JsonToInt(const AValue: TJSONData): Int64;

implementation

function TJSONDataHelper.ToJSON: String;
begin
  if Self = nil then
    Result := ''
  else
    Result := Self.AsJSON;
end;

function TJSONDataHelper.GetValue(const AName: String): TJSONData;
begin
  Result := nil;
  if (Self <> nil) and (Self.JSONType = jtObject) then
    Result := TJSONObject(Self).Find(AName);
end;

function TJSONDataHelper.GetValueString: String;
begin
  if Self = nil then
    Result := ''
  else if Self.JSONType in [jtString, jtNumber, jtBoolean] then
    Result := Self.AsString
  else
    Result := Self.AsJSON;
end;

class function TJSON.ParseJSONValue(const AData: String): TJSONValue;
begin
  Result := nil;
  try
    Result := GetJSON(AData);
  except
    Result := nil;
  end;
end;

function JsonToString(const AValue: TJSONData): String;
begin
  if AValue = nil then
    Result := ''
  else
    Result := AValue.AsString;
end;

function JsonToBool(const AValue: TJSONData): Boolean;
begin
  if AValue = nil then
    Result := False
  else
    Result := AValue.AsBoolean;
end;

function JsonToInt(const AValue: TJSONData): Int64;
begin
  if AValue = nil then
    Result := 0
  else
    Result := AValue.AsInt64;
end;

end.
