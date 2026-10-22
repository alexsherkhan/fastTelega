unit Tests.Json;

{$mode delphi}{$H+}

interface

uses
  SysUtils, fpcunit, testregistry,
  System.JSON, fpjson,
  fastTelega.AvailableTypes,
  fastTelega.JsonMapper;

type
  TJsonMapperTests = class(TTestCase)
  published
    procedure TestUserFromJson;
    procedure TestNestedMessageFromJson;
    procedure TestMissingFieldsKeepDefaults;
    procedure TestArrayOfObjects;
  end;

implementation

procedure TJsonMapperTests.TestUserFromJson;
var
  LJSON: TJSONData;
  LUser: TftUser;
begin
  LJSON := TJSON.ParseJSONValue
    ('{"id":42,"is_bot":false,"first_name":"Alice","username":"alice"}');
  try
    LUser := TftUserFromJson(LJSON);
    try
      AssertEquals(42, LUser.Id);
      AssertFalse(LUser.IsBot);
      AssertEquals('Alice', LUser.FirstName);
      AssertEquals('alice', LUser.UserName);
    finally
      LUser.Free;
    end;
  finally
    LJSON.Free;
  end;
end;

procedure TJsonMapperTests.TestNestedMessageFromJson;
var
  LJSON: TJSONData;
  LMessage: TftMessage;
begin
  LJSON := TJSON.ParseJSONValue(
    '{"message_id":10,' +
    '"from":{"id":1,"is_bot":false,"first_name":"Bob","username":"bob"},' +
    '"chat":{"id":5,"type":"private","first_name":"Bob"},' +
    '"date":123,"text":"hello"}');
  try
    LMessage := TftMessageFromJson(LJSON);
    try
      AssertEquals(10, LMessage.MessageId);
      AssertNotNull('from', LMessage.From);
      AssertEquals('Bob', LMessage.From.FirstName);
      AssertEquals('bob', LMessage.From.UserName);
      AssertNotNull('chat', LMessage.Chat);
      AssertEquals(5, LMessage.Chat.Id);
      AssertEquals('hello', LMessage.Text);
    finally
      LMessage.Free;
    end;
  finally
    LJSON.Free;
  end;
end;

procedure TJsonMapperTests.TestMissingFieldsKeepDefaults;
var
  LJSON: TJSONData;
  LUser: TftUser;
begin
  LJSON := TJSON.ParseJSONValue('{"id":7}');
  try
    LUser := TftUserFromJson(LJSON);
    try
      AssertEquals(7, LUser.Id);
      AssertEquals('', LUser.FirstName);
      AssertFalse(LUser.IsBot);
    finally
      LUser.Free;
    end;
  finally
    LJSON.Free;
  end;
end;

procedure TJsonMapperTests.TestArrayOfObjects;
var
  LJSON: TJSONData;
  LMessage: TftMessage;
begin
  LJSON := TJSON.ParseJSONValue(
    '{"message_id":1,"chat":{"id":1,"type":"private"},' +
    '"photo":[{"file_id":"p1","file_unique_id":"u1","width":100,"height":50},' +
    '{"file_id":"p2","file_unique_id":"u2","width":200,"height":100}]}');
  try
    LMessage := TftMessageFromJson(LJSON);
    try
      AssertEquals(2, Length(LMessage.Photo));
      AssertEquals('p1', LMessage.Photo[0].FileId);
      AssertEquals(200, LMessage.Photo[1].Width);
    finally
      LMessage.Free;
    end;
  finally
    LJSON.Free;
  end;
end;

initialization
  RegisterTest(TJsonMapperTests);

end.
