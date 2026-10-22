/// <summary>
/// fastTelega ftInlineQuery
/// Alexander Syrykh
/// </summary>
unit fastTelega.ftInlineQuery;

interface

uses
  {Delphi}
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},
  fastTelega.AvailableTypes.ftLocation;

type

  /// <summary>
  /// This object represents an incoming inline query. When the user sends
  /// an empty query, your bot could return some default or trending results.
  /// </summary>
  TftInlineQuery = class
  private
    Fid: String;
    Ffrom: TftUser;
    Fquery: String;
    Foffset: String;
    Fchat_type: String;
    Flocation: TftLocation;
  public
    /// <summary>
    /// Unique identifier for this query
    /// </summary>
    property Id: String read Fid write Fid;
    /// <summary>
    /// Sender
    /// </summary>
    property From: TftUser read Ffrom write Ffrom;
    /// <summary>
    /// Text of the query (up to 256 characters)
    /// </summary>
    property Query: String read Fquery write Fquery;
    /// <summary>
    /// Offset of the results to be returned, can be controlled by the bot
    /// </summary>
    property Offset: String read Foffset write Foffset;
    /// <summary>
    /// Optional. Type of the chat, from which the inline query was sent.
    /// Can be either “sender” for a private chat with the inline query
    /// sender, “private”, “group”, “supergroup”, or “channel”. The chat
    /// type should be always known for requests sent from official clients
    /// and most third-party clients, unless the request was sent from
    /// a secret chat
    /// </summary>
    property chat_type: String read Fchat_type write Fchat_type;
    /// <summary>
    /// Optional. Sender location, only for bots that request user location
    /// </summary>
    property Location: TftLocation read Flocation write Flocation;
  end;

implementation

end.
