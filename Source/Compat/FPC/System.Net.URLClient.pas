unit System.Net.URLClient;

{$IFDEF FPC}
{$MODE DELPHI}{$H+}
{$ENDIF}

interface

type
  TNameValuePair = record
    Name: String;
    Value: String;
    constructor Create(const AName, AValue: String);
  end;

  TNetHeader = TNameValuePair;
  TNetHeaders = array of TNameValuePair;

implementation

constructor TNameValuePair.Create(const AName, AValue: String);
begin
  Name := AName;
  Value := AValue;
end;

end.
