/// <summary>
/// fastTelega ftVenue
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftVenue;

interface

uses
  {Delphi}
  System.Generics.Collections,
  System.SysUtils,
  System.Classes,

  {fastTelega}
  fastTelega.AvailableTypes.ftLocation;

type

  /// <summary>
  /// This object represents a venue.
  /// </summary>
  TftVenue = class
  private
    FLocation: TftLocation;
    FTitle: String;
    FAddress: String;
    FFoursquareId: String;
    FFoursquareType: String;
    FGooglePlaceId: String;
    FGooglePlaceType: String;
  public
    /// <summary>
    /// Venue location. Can't be a live location
    /// </summary>
    property Location: TftLocation read FLocation write FLocation;
    /// <summary>
    /// Name of the venue
    /// </summary>
    property Title: String read FTitle write FTitle;
    /// <summary>
    /// Address of the venue
    /// </summary>
    property Address: String read FAddress write FAddress;
    /// <summary>
    /// Optional. Foursquare identifier of the venue
    /// </summary>
    property FoursquareId: String read FFoursquareId write FFoursquareId;
    /// <summary>
    /// Optional. Foursquare type of the venue. (For example,
    /// “arts_entertainment/default”, “arts_entertainment/aquarium”
    /// or “food/icecream”.)
    /// </summary>
    property FoursquareType: String read FFoursquareType write FFoursquareType;
    /// <summary>
    /// Optional. Google Places identifier of the venue
    /// </summary>
    property GooglePlaceId: String read FGooglePlaceId write FGooglePlaceId;
    /// <summary>
    /// Optional. Google Places type of the venue. (See supported types.)
    /// </summary>
    property GooglePlaceType: String read FGooglePlaceType
      write FGooglePlaceType;
  end;

implementation

end.
