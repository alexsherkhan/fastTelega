/// <summary>
/// fastTelega ftPreCheckoutQueryHelper
/// Alexander Syrykh
/// </summary>
unit fastTelega.ftPreCheckoutQueryHelper;

interface

uses
  {Delphi}
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  {fastTelega}
  fastTelega.ftPreCheckoutQuery,
  fastTelega.AvailableTypes;

type

  TftPreCheckoutQueryHelper = class helper for TftPreCheckoutQuery
  private
    function GetFrom: TftUser;
    procedure SetFrom(AObject: TftUser);
  public
    /// <summary>
    /// User who sent the query.
    /// </summary>
    property From: TftUser read GetFrom write SetFrom;
  end;

implementation


{ TftPreCheckoutQueryHelper }

function TftPreCheckoutQueryHelper.GetFrom: TftUser;
begin
  Result := Self.From as TftUser;
end;

procedure TftPreCheckoutQueryHelper.SetFrom(AObject: TftUser);
begin
  Self.From := AObject;
end;

end.
