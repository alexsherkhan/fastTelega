/// <summary>
/// fastTelega ftMaskPosition
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftMaskPosition;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes;

type

  /// <summary>
  /// This object represents a sticker.
  /// </summary>
  TftMaskPosition = class
  private
    FPoint: String;
    /// The part of the face relative to which the mask should be placed. One of “forehead”, “eyes”, “mouth”, or “chin”.
    FXShift: Double;
    /// Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. For example, choosing -1.0 will place mask just to the left of the default mask position.
    FYShift: Double;
    /// Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. For example, 1.0 will place the mask just below the default mask position.
    FScale: Double;
    /// Mask scaling coefficient. For example, 2.0 means double size.
  public
    /// <summary>
    /// The part of the face relative to which the mask should be placed. One of “forehead”, “eyes”, “mouth”, or “chin”.
    /// </summary>
    property Point: String read FPoint write FPoint;
    /// <summary>
    /// Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. For example, choosing -1.0 will place mask just to the left of the default mask position.
    /// </summary>
    property XShift: Double read FXShift write FXShift;
    /// <summary>
    /// Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. For example, 1.0 will place the mask just below the default mask position.
    /// </summary>
    property YShift: Double read FYShift write FYShift;
    /// <summary>
    /// Mask scaling coefficient. For example, 2.0 means double size.
    /// </summary>
    property Scale: Double read FScale write FScale;
  end;

implementation

end.
