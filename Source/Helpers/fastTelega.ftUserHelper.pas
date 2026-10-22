/// <summary>
/// fastTelega ftUserHelper
/// Alexander Syrykh
/// </summary>
unit fastTelega.ftUserHelper

interface

uses
  {Delphi}
  System.Generics.Collections,
  System.SysUtils,
  System.Classes,

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
