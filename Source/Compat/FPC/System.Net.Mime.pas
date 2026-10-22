unit System.Net.Mime;

{$IFDEF FPC}
{$MODE DELPHI}{$H+}
{$ENDIF}

interface

uses
  SysUtils, Classes;

type
  TMultipartFormData = class
  private
    FFields: TStringList;
    FFiles: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddField(const AName, AValue: String);
    procedure AddFile(const AFieldName, AFilePath: String);
    function BuildBody(const ABoundary: String; AStream: TStream): Boolean;
    property Fields: TStringList read FFields;
    property Files: TStringList read FFiles;
  end;

implementation

constructor TMultipartFormData.Create;
begin
  inherited Create;
  FFields := TStringList.Create;
  FFiles := TStringList.Create;
end;

destructor TMultipartFormData.Destroy;
begin
  FFields.Free;
  FFiles.Free;
  inherited;
end;

procedure TMultipartFormData.AddField(const AName, AValue: String);
begin
  FFields.Add(AName + '=' + AValue);
end;

procedure TMultipartFormData.AddFile(const AFieldName, AFilePath: String);
begin
  FFiles.Add(AFieldName + '=' + AFilePath);
end;

function TMultipartFormData.BuildBody(const ABoundary: String;
  AStream: TStream): Boolean;
var
  I: Integer;
  LName, LValue, LData: String;
  LFile: TFileStream;
  LBuf: array[0..8191] of Byte;
  LRead: Integer;
  procedure WriteStr(const S: String);
  begin
    if S <> '' then
      AStream.WriteBuffer(S[1], Length(S));
  end;
begin
  Result := False;
  for I := 0 to FFields.Count - 1 do
  begin
    LName := FFields.Names[I];
    LValue := FFields.ValueFromIndex[I];
    WriteStr('--' + ABoundary + #13#10);
    WriteStr('Content-Disposition: form-data; name="' + LName + '"' + #13#10#13#10);
    WriteStr(LValue + #13#10);
  end;
  for I := 0 to FFiles.Count - 1 do
  begin
    LName := FFiles.Names[I];
    LValue := FFiles.ValueFromIndex[I];
    if not FileExists(LValue) then
      Exit;
    WriteStr('--' + ABoundary + #13#10);
    WriteStr('Content-Disposition: form-data; name="' + LName +
      '"; filename="' + ExtractFileName(LValue) + '"' + #13#10);
    WriteStr('Content-Type: application/octet-stream' + #13#10#13#10);
    LFile := TFileStream.Create(LValue, fmOpenRead or fmShareDenyWrite);
    try
      repeat
        LRead := LFile.Read(LBuf, SizeOf(LBuf));
        if LRead > 0 then
          AStream.WriteBuffer(LBuf, LRead);
      until LRead = 0;
    finally
      LFile.Free;
    end;
    WriteStr(#13#10);
  end;
  WriteStr('--' + ABoundary + '--' + #13#10);
  Result := True;
end;

end.
