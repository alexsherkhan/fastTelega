unit fastTelega.ftMessageChainCardModel;

interface

uses
  System.Classes, System.Types, System.SysUtils, fastTelega.ftModelBase;

type

  TftCardCommandBaseModel = class(TftModelBase)
  private
    FID: Integer;
    FTitle: String;

    FNextCardCommand: TObject;
    FPreviousCardCommand: TObject;
    procedure SetPreviousCardCommand(const Value: TObject);
    procedure SetTitle(const Value: String);
    procedure SetID(const Value: Integer);
  protected

  public

  published
    property ID: Integer read FID write SetID;
    property Title: String read FTitle write SetTitle;
    property PreviousCardCommand: TObject read FPreviousCardCommand
      write SetPreviousCardCommand;

  end;

  TftStartCardCommandModel = class(TftCardCommandBaseModel)
  private

  protected

  public

  published
    property ID;
    property Title;
    property PreviousCardCommand;
  end;

  TftSimpleMessageCardCommandModel = class(TftCardCommandBaseModel)
  private
    FMenuList: TList;
  protected

  public

  published
    property ID;
    property Title;
  end;

  TftMessageChainCardCommandModel = class(TftCardCommandBaseModel)
  private

  protected

  public

  published
    property ID;
    property Title;
    // property PreviousCardCommand;
  end;

implementation

{ TftCardCommandBaseModel }

procedure TftCardCommandBaseModel.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TftCardCommandBaseModel.SetPreviousCardCommand(const Value: TObject);
begin
  FPreviousCardCommand := Value;
end;

procedure TftCardCommandBaseModel.SetTitle(const Value: String);
begin
  FTitle := Value;
end;

end.
