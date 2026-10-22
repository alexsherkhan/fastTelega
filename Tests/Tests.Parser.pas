unit Tests.Parser;

{$mode delphi}{$H+}

interface

uses
  SysUtils, fpcunit, testregistry,
  System.JSON, fpjson,
  fastTelega.AvailableTypes,
  fastTelega.Parser.TypeParser;

type
  TParserTests = class(TTestCase)
  published
    procedure TestParseJsonValid;
    procedure TestParseJsonInvalid;
    procedure TestParseUser;
    procedure TestParseMessage;
    procedure TestSerializeUser;
  end;

implementation

procedure TParserTests.TestParseJsonValid;
var
  LParser: TftTypeParser;
  LJSON: TJSONObject;
begin
  LParser := TftTypeParser.Create;
  try
    LJSON := LParser.ParseJson('{"ok":true,"result":{"id":1}}');
    try
      AssertNotNull('root', LJSON);
      AssertNotNull('result', LJSON.GetValue('result'));
    finally
      LJSON.Free;
    end;
  finally
    LParser.Free;
  end;
end;

procedure TParserTests.TestParseJsonInvalid;
var
  LParser: TftTypeParser;
begin
  LParser := TftTypeParser.Create;
  try
    AssertNull('invalid JSON', LParser.ParseJson('not json'));
  finally
    LParser.Free;
  end;
end;

procedure TParserTests.TestParseUser;
var
  LParser: TftTypeParser;
  LJSON: TJSONObject;
  LUser: TftUser;
begin
  LParser := TftTypeParser.Create;
  try
    LJSON := LParser.ParseJson
      ('{"ok":true,"result":{"id":9,"is_bot":true,"first_name":"Bot",' +
       '"username":"my_bot"}}');
    try
      LUser := LParser.ParseJsonAndGetUser(LJSON);
      try
        AssertEquals(9, LUser.Id);
        AssertTrue(LUser.IsBot);
        AssertEquals('Bot', LUser.FirstName);
        AssertEquals('my_bot', LUser.UserName);
      finally
        LUser.Free;
      end;
    finally
      LJSON.Free;
    end;
  finally
    LParser.Free;
  end;
end;

procedure TParserTests.TestParseMessage;
var
  LParser: TftTypeParser;
  LJSON: TJSONObject;
  LMessage: TftMessage;
begin
  LParser := TftTypeParser.Create;
  try
    LJSON := LParser.ParseJson(
      '{"ok":true,"result":{"message_id":3,' +
      '"from":{"id":1,"is_bot":false,"first_name":"A"},' +
      '"chat":{"id":2,"type":"private"},' +
      '"date":1,"text":"text"}}');
    try
      LMessage := LParser.ParseJsonAndGetMessage(LJSON);
      try
        AssertEquals(3, LMessage.MessageId);
        AssertEquals('text', LMessage.Text);
        AssertEquals(2, LMessage.Chat.Id);
        AssertEquals('A', LMessage.From.FirstName);
      finally
        LMessage.Free;
      end;
    finally
      LJSON.Free;
    end;
  finally
    LParser.Free;
  end;
end;

procedure TParserTests.TestSerializeUser;
var
  LParser: TftTypeParser;
  LUser: TftUser;
  LJSON: String;
begin
  LParser := TftTypeParser.Create;
  LUser := TftUser.Create;
  try
    LUser.Id := 1;
    LUser.FirstName := 'A';
    LJSON := LParser.ParseUser(LUser);
    AssertTrue('first_name', Pos('"first_name":"A"', LJSON) > 0);
  finally
    LUser.Free;
    LParser.Free;
  end;
end;

initialization
  RegisterTest(TParserTests);

end.
