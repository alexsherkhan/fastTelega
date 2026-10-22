/// <summary>
/// fastTelega HttpParser
/// Alexander Syrykh
/// </summary>
unit fastTelega.HttpParser;

interface

uses
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
  System.Net.URLClient,
  System.Net.HttpClientComponent,
  System.Net.Mime,
  System.Net.Socket,
  fastTelega.Url;

type
  /// <summary>
  /// HttpParser
  /// </summary>
  TftHttpParser = class
  private
  public
    constructor Create;
    destructor Destroy; override;
    function generateRequest(const Aurl: TftUrl; AArgs: TList<HttpReqArg>,
      AisKeepAlive: Boolean = false): String;
    function generateMultipartFormData(const std: : vector<HttpReqArg> & args,
      const std: : string & boundary): String;
    function generateMultipartBoundary(const std:
      : vector<HttpReqArg> & args): String;
    function generateWwwFormUrlencoded(const std:
      : vector<HttpReqArg> & args): String;
    function generateResponse(const std: : string & data,
      const std: : string & mimeType, unsigned short statusCode,
      const std: : string & statusStr, bool isKeepAlive)const;
    function parseHeader(const std: : string & data, bool isRequest): String;
    function extractBody(const AData: String): String;
  end;

implementation

end.
