/// <summary>
/// fastTelega ftContact
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftContact;

interface

uses
  {Delphi}
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF};

type

  /// <summary>
  /// This object represents a general file (as opposed to photos, voice messages and audio files).
  /// </summary>
  TftContact = class
  private
    FPhoneNumber: String;
    FFirstName: String;
    FLastName: String;
    FUserId: Integer;
    FVcard: String;
  public
    /// <summary>
    /// Contact's phone number
    /// </summary>
    property PhoneNumber: String read FPhoneNumber write FPhoneNumber;
    /// <summary>
    /// Contact's first name
    /// </summary>
    property FirstName: String read FFirstName write FFirstName;
    /// <summary>
    /// Optional. Contact's last name
    /// </summary>
    property LastName: String read FLastName write FLastName;
    /// <summary>
    /// Optional. Contact's user identifier in . This number may
    /// have more than 32 significant bits and some programming languages
    /// may have difficulty/silent defects in interpreting it. But it has at
    /// most 52 significant bits, so a 64-bit integer or double-precision float
    /// type are safe for storing this identifier.
    /// </summary>
    property UserId: Integer read FUserId write FUserId;
    /// <summary>
    /// Optional. Additional data about the contact in the form of a vCard
    /// </summary>
    property Vcard: String read FVcard write FVcard;
  end;

implementation

end.
