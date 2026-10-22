/// <summary>
/// fastTelega ftEncryptedPassportElement
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftEncryptedPassportElement;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},

  {fastTelega}
  fastTelega.AvailableTypes.ftPassportFile;

type

  /// <summary>
  /// Contains information about documents or other Telegram Passport elements shared with the bot by the user.
  /// </summary>
  TftEncryptedPassportElement = class
  private
    FType: String;
    FData: String;
    FPhoneNumber: String;
    FEmail: String;
    FFiles: TList<TftPassportFile>;
    FFrontSide: TftPassportFile;
    FReverseSide: TftPassportFile;
    FSelfie: TftPassportFile;
    FTranslation: TList<TftPassportFile>;
    FHash: String;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Element type.
    /// One of “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport”, “address”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”, “phone_number”, “email”.
    /// </summary>
    property TypeS: String read FType write FType;

    /// <summary>
    /// Optional. Base64-encoded encrypted Telegram Passport element data provided by the user, available for “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport” and “address” types.
    /// Can be decrypted and verified using the accompanying @ref EncryptedCredentials.
    /// </summary>
    property Data: String read FData write FData;

    /// <summary>
    /// Optional. User's verified phone number, available only for “phone_number” type
    /// </summary>
    property PhoneNumber: String read FPhoneNumber write FPhoneNumber;

    /// <summary>
    /// Optional. User's verified email address, available only for “email” type
    /// </summary>
    property Email: String read FEmail write FEmail;

    /// <summary>
    /// Optional. Array of encrypted files with documents provided by the user, available for “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration” and “temporary_registration” types.
    /// Files can be decrypted and verified using the accompanying @ref EncryptedCredentials.
    /// </summary>
    property Files: TList<TftPassportFile> read FFiles write FFiles;

    /// <summary>
    /// Optional. Encrypted file with the front side of the document, provided by the user.
    /// Available for “passport”, “driver_license”, “identity_card” and “internal_passport”.
    /// The file can be decrypted and verified using the accompanying @ref EncryptedCredentials.
    /// </summary>
    property FrontSide: TftPassportFile read FFrontSide write FFrontSide;

    /// <summary>
    /// Optional. Encrypted file with the reverse side of the document, provided by the user.
    /// Available for “driver_license” and “identity_card”.
    /// The file can be decrypted and verified using the accompanying @ref EncryptedCredentials.
    /// </summary>
    property ReverseSide: TftPassportFile read FReverseSide write FReverseSide;

    /// <summary>
    /// Optional. Encrypted file with the selfie of the user holding a document, provided by the user; available for “passport”, “driver_license”, “identity_card” and “internal_passport”.
    /// The file can be decrypted and verified using the accompanying @ref EncryptedCredentials.
    /// </summary>
    property Selfie: TftPassportFile read FSelfie write FSelfie;

    /// <summary>
    /// Optional. Array of encrypted files with translated versions of documents provided by the user.
    /// Available if requested for “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration” and “temporary_registration” types.
    /// Files can be decrypted and verified using the accompanying @ref EncryptedCredentials.
    /// </summary>
    property Translation: TList<TftPassportFile> read FTranslation
      write FTranslation;

    /// <summary>
    /// Base64-encoded element hash for using in @ref PassportElementErrorUnspecified
    /// </summary>
    property Hash: String read FHash write FHash;
  end;

implementation

{ TftEncryptedPassportElement }

constructor TftEncryptedPassportElement.Create;
begin
    FFiles:= TList<TftPassportFile>.Create;
//    FFrontSide: TftPassportFile;
//    FReverseSide: TftPassportFile;
//    FSelfie: TftPassportFile;
    FTranslation:= TList<TftPassportFile>.Create;
end;

destructor TftEncryptedPassportElement.Destroy;
begin
  FFiles.Free;
  FTranslation.Free;
  inherited;
end;

end.
