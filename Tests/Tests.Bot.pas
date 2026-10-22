unit Tests.Bot;

{$mode delphi}{$H+}

interface

uses
  SysUtils, fpcunit, testregistry,
  fastTelega.Bot,
  fastTelega.Net.LongPoll,
  fastTelega.Events.EventBroadcaster;

type
  TBotTests = class(TTestCase)
  published
    procedure TestBotCreate;
    procedure TestLongPollCreateAndFree;
    procedure TestEventRegistration;
  end;

implementation

procedure TBotTests.TestBotCreate;
var
  LBot: TftBot;
begin
  LBot := TftBot.Create('', 'https://api.telegram.org');
  try
    AssertNotNull('api', LBot.API);
    AssertNotNull('events', LBot.Events);
    AssertNotNull('handler', LBot.EventHandler);
  finally
    LBot.Free;
  end;
end;

procedure TBotTests.TestLongPollCreateAndFree;
var
  LBot: TftBot;
  LLongPoll: TftLongPoll;
begin
  LBot := TftBot.Create('', 'https://api.telegram.org');
  try
    LLongPoll := TftLongPoll.Create(LBot, 100, 3);
    LLongPoll.Free;
  finally
    LBot.Free;
  end;
  AssertTrue(True);
end;

procedure TBotTests.TestEventRegistration;
var
  LBot: TftBot;
begin
  LBot := TftBot.Create('', 'https://api.telegram.org');
  try
    LBot.Events.OnAnyMessage(nil);
    LBot.Events.OnCommand('start', nil);
    AssertTrue(True);
  finally
    LBot.Free;
  end;
end;

initialization
  RegisterTest(TBotTests);

end.
