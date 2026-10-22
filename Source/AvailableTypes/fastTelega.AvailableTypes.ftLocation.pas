/// <summary>
/// fastTelega ftLocation
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftLocation;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes;

type

  /// <summary>
  /// This object represents a point on the map.
  /// </summary>
  TftLocation = class
  private
    FLongitude: Double;
    FLatitude: Double;
    FHorizontalAccuracy: Double;
    FLivePeriod: Integer;
    FHeading: Integer;
    FProximityAlertRadius: Integer;
  public
    /// <summary>
    /// Longitude as defined by sender
    /// </summary>
    property Longitude: Double read FLongitude write FLongitude;
    /// <summary>
    /// Latitude as defined by sender
    /// </summary>
    property Latitude: Double read FLatitude write FLatitude;
    /// <summary>
    /// number 	//Optional. The radius of uncertainty for the location,
    /// measured in meters; 0-1500
    /// </summary>
    property HorizontalAccuracy: Double read FHorizontalAccuracy
      write FHorizontalAccuracy;
    /// <summary>
    /// Optional. Time relative to the message sending date, during which
    /// the location can be updated, in seconds. For active live locations only.
    /// </summary>
    property LivePeriod: Integer read FLivePeriod write FLivePeriod;
    /// <summary>/// Optional. The direction in which user is moving, in
    /// degrees; 1-360. For active live locations only.
    /// </summary>
    property Heading: Integer read FHeading write FHeading;
    /// <summary>
    /// Optional. Maximum distance for proximity alerts about approaching
    /// another chat member, in meters. For sent live locations only.
    /// </summary>
    property ProximityAlertRadius: Integer read FProximityAlertRadius
      write FProximityAlertRadius;
  end;

implementation

end.
