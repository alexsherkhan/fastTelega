/// <summary>
/// fastTelega ftEncryptedCredentials
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftEncryptedCredentials;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes;

type

  /// <summary>
  /// Contains data required for decrypting and authenticating EncryptedPassportElement.
  /// See https://core.telegram.org/passport#receiving-information for a complete description of the data decryption and authentication
  /// </summary>
  TftEncryptedCredentials = class
  private
    FData: String;
    FHash: String;
    FSecret: String;
  public
    /// <summary>
    /// Base64-encoded encrypted JSON-serialized data with unique user's payload, data hashes and secrets required for @ref EncryptedPassportElement decryption and authentication
    /// </summary>
    property Data: String read FData write FData;

    /// <summary>
    /// Base64-encoded data hash for data authentication
    /// </summary>
    property Hash: String read FHash write FHash;

    /// <summary>
    /// Base64-encoded secret, encrypted with the bot's public RSA key, required for data decryption
    /// </summary>
    property Secret: String read FSecret write FSecret;
  end;

implementation

end.
