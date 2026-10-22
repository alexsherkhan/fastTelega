/// <summary>
/// fastTelega ftInputMessageContent
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftInputMessageContent;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF};

type

  /// <summary>
  /// This object represents the content of a media message to be sent.
  /// </summary>
  TftInputMessageContent = class
  private
    FTypeMessageContent: String;
  public
    constructor Create(ATypeMessageContent: String);
    /// <summary>
    /// May be
    /// InputTextMessageContent
    /// InputLocationMessageContent
    /// InputVenueMessageContent
    /// InputContactMessageContent
    /// </summary>
    property TypeMessageContent: String read FTypeMessageContent
      write FTypeMessageContent;
  end;

  /// <summary>
  /// Represents the content of a text message to be sent as the result of an inline query.
  /// </summary>
  TftInputTextMessageContent = class(TftInputMessageContent)
  private
    FMessageText: String;
    FParseMode: String;
    FDisableWebPagePreview: Boolean;
  public
    constructor Create();
    /// <summary>
    /// Text of the message to be sent, 1-4096 characters
    /// </summary>
    property MessageText: String read FMessageText write FMessageText;
    /// <summary>
    /// Text of the message to be sent, 1-4096 characters
    /// </summary>
    property ParseMode: String read FParseMode write FParseMode;
    /// <summary>
    /// Text of the message to be sent, 1-4096 characters
    /// </summary>
    property DisableWebPagePreview: Boolean read FDisableWebPagePreview
      write FDisableWebPagePreview;
  end;

  /// <summary>
  /// Represents the content of a location message to be sent as the result of an inline query.
  /// </summary>
  TftInputLocationMessageContent = class(TftInputMessageContent)
  private
    FLatitude: Double;
    FLongitude: Double;
    FHorizontalAccuracy: Double;
    FLivePeriod: Integer;
    FHeading: Integer;
    FProximityAlertRadius: Integer;
  public
    constructor Create();
    /// <summary>
    /// Latitude of the location in degrees
    /// </summary>
    property Latitude: Double read FLatitude write FLatitude;
    /// <summary>
    /// Longitude of the location in degrees
    /// </summary>
    property Longitude: Double read FLongitude write FLongitude;
    /// <summary>
    /// Optional. The radius of uncertainty for the location, measured in meters; 0-1500
    /// </summary>
    property HorizontalAccuracy: Double read FHorizontalAccuracy
      write FHorizontalAccuracy;
    /// <summary>
    /// Optional. Period in seconds for which the location can be updated, should be between 60 and 86400.
    /// </summary>
    property LivePeriod: Integer read FLivePeriod write FLivePeriod;
    /// <summary>
    /// Optional. For live locations, a direction in which the user is moving, in degrees.
    /// Must be between 1 and 360 if specified.
    /// </summary>
    property Heading: Integer read FHeading write FHeading;
    /// <summary>
    /// Optional. For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters.
    /// Must be between 1 and 100000 if specified.
    /// </summary>
    property ProximityAlertRadius: Integer read FProximityAlertRadius
      write FProximityAlertRadius;
  end;

  /// <summary>
  /// Represents the content of a venue message to be sent as the result of an inline query.
  /// </summary>
  TftInputVenueMessageContent = class(TftInputMessageContent)
  private
    FLatitude: Double;
    FLongitude: Double;
    FTitle: String;
    FAddress: String;
    FFoursquareId: String;
    FFoursquareType: String;
    FGooglePlaceId: String;
    FGooglePlaceType: String;
  public
    constructor Create();
    /// <summary>
    /// Latitude of the location in degrees
    /// </summary>
    property Latitude: Double read FLatitude write FLatitude;
    /// <summary>
    /// Longitude of the location in degrees
    /// </summary>
    property Longitude: Double read FLongitude write FLongitude;
    /// <summary>
    /// Name of the venue
    /// </summary>
    property Title: String read FTitle write FTitle;
    /// <summary>
    /// Address of the venue
    /// </summary>
    property Address: String read FAddress write FAddress;
    /// <summary>
    /// Optional. Foursquare identifier of the venue, if known
    /// </summary>
    property FoursquareId: String read FFoursquareId write FFoursquareId;
    /// <summary>
    /// Optional. Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    /// </summary>
    property FoursquareType: String read FFoursquareType write FFoursquareType;
    /// <summary>
    /// Optional. Google Places identifier of the venue
    /// </summary>
    property GooglePlaceId: String read FGooglePlaceId write FGooglePlaceId;
    /// <summary>
    /// Optional. Google Places type of the venue.
    /// (See https://developers.google.com/places/web-service/supported_types)
    /// </summary>
    property GooglePlaceType: String read FGooglePlaceType
      write FGooglePlaceType;
  end;

  /// <summary>
  /// Represents the content of a contact message to be sent as the result of an inline query.
  /// </summary>
  TftInputContactMessageContent = class(TftInputMessageContent)
  private
    FPhoneNumber: String;
    FFirstName: String;
    FLastName: String;
    FVcard: String;
  public
    constructor Create();
    /// <summary>
    /// Name of the venue
    /// </summary>
    property PhoneNumber: String read FPhoneNumber write FPhoneNumber;
    /// <summary>
    /// Address of the venue
    /// </summary>
    property FirstName: String read FFirstName write FFirstName;
    /// <summary>
    /// Optional. Foursquare identifier of the venue, if known
    /// </summary>
    property LastName: String read FLastName write FLastName;
    /// <summary>
    /// Optional. Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    /// </summary>
    property Vcard: String read FVcard write FVcard;
  end;

implementation

{ TftInputMessageContent }

constructor TftInputMessageContent.Create(ATypeMessageContent: String);
begin
  FTypeMessageContent := ATypeMessageContent;
end;

{ TftInputTextMessageContent }

constructor TftInputTextMessageContent.Create;
begin
  inherited Create('InputTextMessageContent');
end;

{ TftInputLocationMessageContent }

constructor TftInputLocationMessageContent.Create;
begin
  inherited Create('InputLocationMessageContent');
end;

{ TftInputVenueMessageContent }

constructor TftInputVenueMessageContent.Create;
begin
  inherited Create('InputVenueMessageContent');
end;

{ TftInputContactMessageContent }

constructor TftInputContactMessageContent.Create;
begin
  inherited Create('InputContactMessageContent');
end;

end.
