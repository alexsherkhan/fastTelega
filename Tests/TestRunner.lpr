program TestRunner;

{$mode delphi}{$H+}

uses
  cthreads,
  consoletestrunner,
  Tests.Json,
  Tests.Parser,
  Tests.Bot,
  Tests.Webhook;

var
  Runner: TTestRunner;
begin
  Runner := TTestRunner.Create(nil);
  try
    Runner.Run;
  finally
    Runner.Free;
  end;
end.
