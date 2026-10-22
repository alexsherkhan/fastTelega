program TestRunner;

{$mode delphi}{$H+}

uses
  consoletestrunner,
  Tests.Json,
  Tests.Parser,
  Tests.Bot;

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
