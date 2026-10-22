/// <summary>
/// fastTelega ftPassportData
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftPassportData;

interface

uses
  {Delphi}
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},
  fastTelega.AvailableTypes.ftEncryptedCredentials,
  fastTelega.AvailableTypes.ftEncryptedPassportElement;

type

  /// <summary>
  /// Contains information about Telegram Passport data shared with the bot by the user.
  /// </summary>
  TftPassportData = class
  private
    FData: TList<TftEncryptedPassportElement>;
    FCredentials: TftEncryptedCredentials;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Array with information about documents and other Telegram Passport elements that was shared with the bot
    /// </summary>
    property Data: TList<TftEncryptedPassportElement> read FData write FData;

    /// <summary>
    /// Encrypted credentials required to decrypt the data
    /// </summary>
    property Credentials: TftEncryptedCredentials read FCredentials
      write FCredentials;
  end;

implementation

{ TftPassportData }

constructor TftPassportData.Create;
begin
  FData:= TList<TftEncryptedPassportElement>.Create;
end;

destructor TftPassportData.Destroy;
begin
  FData.Free;
  inherited;
end;

end.
