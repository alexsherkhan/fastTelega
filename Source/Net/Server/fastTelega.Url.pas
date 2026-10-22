/// <summary>
/// fastTelega Url
/// Alexander Syrykh
/// </summary>
unit fastTelega.Url;

interface

uses
  System.SysUtils,
  System.Classes;

type
  /// <summary>
  /// This class parses a string with the url
  /// </summary>
  TftUrl = class
  private
    /// Protocol part of an url. Example: https://
    FProtocol: String;

    /// Host part of an url. Example: www.example.com
    FHost: String;

    /// Path part of an url including preceding '/' char. Example: /index.html
    FPath: String;

    /// Query part of an url without '?' char. Example: a=1&b=2&c=3
    FQuery: String;

    /// Fragment part of an url without '#' char. Example: section1
    FFragment: String;
  public
    constructor Create(const AUrl: String);
  end;

implementation

{ TftUrl }

constructor TftUrl.Create(const AUrl: String);
var
  I: Integer;
  C: Char;
  LIsProtocolParsed, LIsHostParsed, LIsPathParsed, LIsQueryParsed: Boolean;
begin
  LIsProtocolParsed := False;
  LIsHostParsed := False;
  LIsPathParsed := False;
  LIsQueryParsed := False;

  while I < Length(AUrl) - 1 do
  begin
    C := AUrl[I];

    if not(LIsProtocolParsed) then
    begin
      if (C = ':') then
      begin
        LIsProtocolParsed := True;
        I := I + 2;
      end
      else
      begin
        FProtocol := FProtocol + C;
      end
    end
    else if not(LIsHostParsed) then
    begin
      if (C = '/') then
      begin
        LIsHostParsed := True;
        FPath := FPath + '/';
      end
      else if (C = '?') then
      begin
        LIsHostParsed := True;
        LIsPathParsed := True;
        FPath := FPath + '/';
      end
      else if (C = '#') then
      begin
        LIsHostParsed := True;
        LIsPathParsed := True;
        LIsQueryParsed := True;
        FPath := FPath + '/';
      end
      else
      begin
        FHost := FHost + C;
      end;
    end
    else if not(LIsPathParsed) then
    begin
      if (C = '?') then
      begin
        LIsPathParsed := True;
      end
      else if (C = '#') then
      begin
        LIsPathParsed := True;
        LIsQueryParsed := True;
      end
      else
      begin
        FPath := FPath + C;
      end;
    end
    else if not(LIsQueryParsed) then
    begin
      if (C = '#') then
      begin
        LIsQueryParsed := True;
      end
      else
      begin
        FQuery := FQuery + C;
      end
    end
    else
    begin
      FFragment := FFragment + C;
    end;
    I := I + 1;
  end;

end;

end.
