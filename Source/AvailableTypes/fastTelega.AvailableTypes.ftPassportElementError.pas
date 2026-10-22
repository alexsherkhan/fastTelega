/// <summary>
/// fastTelega ftPassportElementError
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftPassportElementError;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes;

const
  PassportElementErrorDataFieldSOURCE = 'data';
  PassportElementErrorFrontSideSOURCE = 'front_side';
  PassportElementErrorReverseSideSOURCE = 'reverse_side';
  PassportElementErrorSelfieSOURCE = 'selfie';
  PassportElementErrorFileSOURCE = 'file';
  PassportElementErrorFilesSOURCE = 'files';
  PassportElementErrorTranslationFileSOURCE = 'translation_file';
  PassportElementErrorTranslationFilesSOURCE = 'translation_files';
  PassportElementErrorUnspecifiedSOURCE = 'unspecified';

type

  /// <summary>
  /// This abstract class is base of all passport element errors.
  ///
  /// This object represents an error in the Telegram Passport element which was submitted that should be resolved by the user.
  /// </summary>
  TftPassportElementError = class
  private
    FSource: String;
    FType: String;
    FMessage: String;
  public
    /// <summary>
    /// Error source
    /// </summary>
    property Source: String read FSource write FSource;

    /// <summary>
    /// See description of derived classes.
    /// Type of element of the user's Telegram Passport which has the issue
    /// </summary>
    property TypeS: String read FType write FType;

    /// <summary>
    /// Error message
    /// </summary>
    property Message: String read FMessage write FMessage;
  end;

implementation

end.
