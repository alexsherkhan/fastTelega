/// <summary>
/// fastTelega ftMessage
/// Alexander Syrykh
/// </summary>
unit fastTelega.ftMessage;

interface

uses
  {Delphi}
  System.Generics.Collections,
  System.SysUtils,
  System.Classes,
  fastTelega.ftUser,
  fastTelega.ftChat;

type

  /// <summary>
  /// This object represents a message.
  /// </summary>
  TftMessage = class
  private
    Fmessage_id: Integer;
    Ffrom: TftUser;
    Fsender_chat: TftChat;
    Fdate: Integer;
    Fchat: TftChat;
    Fforward_from: TftUser;
    Fforward_from_chat: TftChat;
    Fforward_from_message_id: Integer;
    Fforward_signature: String;
    Fforward_sender_name: String;
    Fforward_date: Integer;
    Freply_to_message: TftMessage;
    Fvia_bot: TftUser;
    Fedit_date: Integer;
    Fmedia_group_id: String;
    Fauthor_signature: String;
    Ftext: String;
    Fentities: TftMessageEntityList;
    FcaptionEntities: TftMessageEntityList;
    Fanimation: TftAnimation;
    Faudio: TftAudio;
    Fdocument: TftDocument;
    Fphoto: TftPhotoSizeList;
    Fsticker: TftSticker;
    Fvideo: TftVideo;
    Fvideo_note: TftVideoNote;
    Fvoice: TftVoice;
    Fcaption: String;
    Fcaption_entities: TftMessageEntityList;
    Fcontact: TftContact;
    Fdice: TftDice;
    Fgame: TftGame;
    Fpoll: TftPoll;
    Fvenue: TftVenue;
    Flocation: TftLocation;
    Fnew_chat_member: TftUser;
    Fnew_chat_members: TftUserList;
    Fleft_chat_member: TftUser;
    Fnew_chat_title: String;
    Fnew_chat_photo: TftPhotoSizeList;
    Fdelete_chat_photo: Boolean;
    Fgroup_chat_created: Boolean;
    Fsupergroup_chat_created: Boolean;
    Fchannel_chat_created: Boolean;
    // Fmessage_auto_delete_timer_changed
    // : TftMessageAutoDeleteTimerChanged;
    Fmigrate_to_chat_id: Integer;
    Fmigrate_from_chat_id: Integer;
    Fpinned_message: TftMessage;
    Finvoice: TftInvoice;
    Fsuccessful_payment: TftSuccessfulPayment;
    Fconnected_website: String;
    // Fpassport_data: TftPassportData;
    // Fproximity_alert_triggered: TftProximityAlertTriggered;
    // Fvoice_chat_scheduled: TftVoiceChatScheduled;
    // Fvoice_chat_started: TftVoiceChatStarted;
    // Fvoice_chat_ended: TftVoiceChatEnded;
    // Fvoice_chat_participants_invited: TftVoiceChatParticipantsInvited;
    Freply_markup: TftInlineKeyboardMarkup;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Unique message identifier inside this chat
    /// </summary>
    property MessageId: Integer read Fmessage_id write Fmessage_id;
    /// <summary>
    /// Optional. Sender, empty for messages sent to channels
    /// </summary>
    property From: TftUser read Ffrom write Ffrom;
    /// <summary>
    /// Optional. Sender of the message, sent on behalf of a chat. The channel
    /// itself for channel messages. The supergroup itself for messages
    /// from anonymous group administrators. The linked channel for
    /// messages automatically forwarded to the discussion group
    /// </summary>
    property SenderChat: TftChat read Fsender_chat write Fsender_chat;
    /// <summary>
    /// Date the message was sent in Unix time
    /// </summary>
    property Date: Integer read Fdate write Fdate;
    /// <summary>
    /// Conversation the message belongs to
    /// </summary>
    property Chat: TftChat read Fchat write Fchat;
    /// <summary>
    /// Optional. For forwarded messages, sender of the original message
    /// </summary>
    property ForwardFrom: TftUser read Fforward_from write Fforward_from;
    /// <summary>
    /// Optional. For messages forwarded from channels or from anonymous administrators, information about the original sender chat
    /// </summary>
    property ForwardFromChat: TftChat read Fforward_from_chat
      write Fforward_from_chat;
    /// <summary>
    /// Optional. For messages forwarded from channels, identifier of the original message in the channel
    /// </summary>
    property ForwardFromMessageId: Integer read Fforward_from_message_id
      write Fforward_from_message_id;
    /// <summary>
    /// Optional. For messages forwarded from channels, signature of the post author if present
    /// </summary>
    property ForwardSignature: String read Fforward_signature
      write Fforward_signature;
    /// <summary>
    /// Optional. Sender's name for messages forwarded from users who disallow adding a link to their account in forwarded messages
    /// </summary>
    property ForwardSenderName: String read Fforward_sender_name
      write Fforward_sender_name;
    /// <summary>
    /// Optional. For forwarded messages, date the original message was sent in Unix time
    /// </summary>
    property ForwardDate: Integer read Fforward_date write Fforward_date;
    /// <summary>
    /// Optional. For replies, the original message. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply.
    /// </summary>
    property ReplyToMessage: TftMessage read Freply_to_message
      write Freply_to_message;
    /// <summary>
    /// Optional. Bot through which the message was sent
    /// </summary>
    property ViaBot: TftUser read Fvia_bot write Fvia_bot;
    /// <summary>
    /// Optional. Date the message was last edited in Unix time
    /// </summary>
    property EditDate: Integer read Fedit_date write Fedit_date;
    /// <summary>
    /// Optional. The unique identifier of a media message group this message belongs to
    /// </summary>
    property MediaGroupId: String read Fmedia_group_id write Fmedia_group_id;
    /// <summary>
    /// Optional.Signature of the post author for messages in channels, or the custom Title of an anonymous group administrator
    /// </summary>
    property AuthorSignature: String read Fauthor_signature
      write Fauthor_signature;
    /// <summary>
    /// Optional. For text messages, the actual UTF-8 text of the message, 0-4096 characters
    /// </summary>
    property Text: String read Ftext write Ftext;
    /// <summary>
    /// Optional. For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text
    /// </summary>
    property Entities: TftMessageEntityList read Fentities write Fentities;
    /// <summary>
    /// Optional.For messages with a caption, special entities like usernames, URLs, bot commands etc.that appear in the caption
    /// </summary>
    property CaptionEntities: TftMessageEntityList read Fcaption_entities
      write Fcaption_entities;
    /// <summary>
    /// Optional. Message is an animation, information about the animation. For backward compatibility, when this field is set, the document field will also be set
    /// </summary>
    property Animation: TftAnimation read Fanimation write Fanimation;
    /// <summary>
    /// Optional. Message is an audio file, information about the file
    /// </summary>
    property Audio: TftAudio read Faudio write Faudio;
    /// <summary>
    /// Optional. Message is a general file, information about the file
    /// </summary>
    property Document: TftDocument read Fdocument write Fdocument;
    /// <summary>
    /// Optional. Message is a photo, available sizes of the photo
    /// </summary>
    property Photo: TftPhotoSizeList read Fphoto write Fphoto;
    /// Optional. Message is a sticker, information about the sticker
    /// </summary>
    property Sticker: TftSticker read Fsticker write Fsticker;
    /// <summary>
    /// Optional. Message is a video, information about the video
    /// </summary>
    property Video: TftVideo read Fvideo write Fvideo;
    /// <summary>
    /// Optional. Message is a video note, information about the video message
    /// </summary>
    property VideoNote: TftVideoNote read Fvideo_note write Fvideo_note;
    /// <summary>
    /// Optional. Message is a voice message, information about the file
    /// </summary>
    property Voice: TftVoice read Fvoice write Fvoice;
    /// <summary>
    /// Optional. Caption for the animation, audio, document, photo, video or voice, 0-1024 characters
    /// </summary>
    property Caption: String read Fcaption write Fcaption;
    /// <summary>
    /// Optional. Message is a shared contact, information about the contact
    /// </summary>
    property Contact: TftContact read Fcontact write Fcontact;
    /// <summary>
    /// Optional. Message is a dice with random value
    /// </summary>
    property Dice: TftDice read Fdice write Fdice;
    /// <summary>
    /// Optional. Message is a game, information about the game. More about games »
    /// </summary>
    property Game: TftGame read Fgame write Fgame;
    /// <summary>
    /// Optional. Message is a native poll, information about the poll
    /// </summary>
    property Poll: TftPoll read Fpoll write Fpoll;
    /// <summary>
    /// Optional. Message is a venue, information about the venue. For backward compatibility, when this field is set, the location field will also be set
    /// </summary>
    property Venue: TftVenue read Fvenue write Fvenue;
    /// <summary>
    /// Optional. Message is a shared location, information about the location
    property Location: TftLocation read Flocation write Flocation;
    /// <summary>
    /// Optional. A member was removed from the group, information about them (this member may be bot itself).
    /// </summary>
    property NewChatMember: TftUser read Fnew_chat_member
      write Fnew_chat_member;
    /// <summary>
    /// Optional. New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)
    /// </summary>
    property NewChatMembers: TftUserList read Fnew_chat_members
      write Fnew_chat_members;
    /// <summary>
    /// Optional. A member was removed from the group, information about them (this member may be the bot itself)
    /// </summary>
    property LeftChatMember: TftUser read Fleft_chat_member
      write Fleft_chat_member;
    /// <summary>
    /// Optional. A chat title was changed to this value
    /// </summary>
    property NewChatTitle: String read Fnew_chat_title write Fnew_chat_title;
    /// <summary>
    /// Optional. A chat photo was change to this value
    /// </summary>
    property NewChatPhoto: TftPhotoSizeList read Fnew_chat_photo
      write Fnew_chat_photo;
    /// <summary>
    /// Optional. Service message: the chat photo was deleted
    /// </summary>
    property DeleteChatPhoto: Boolean read Fdelete_chat_photo
      write Fdelete_chat_photo default True;
    /// <summary>
    /// Optional. Service message: the group has been created
    /// </summary>
    property GroupChatCreated: Boolean read Fgroup_chat_created
      write Fgroup_chat_created default True;
    /// <summary>
    /// Optional. Service message: the supergroup has been created. This field can't be received in a message coming through updates, because bot can't be a member of a supergroup when it is created. It can only be found in reply_to_message if someone replies to a very first message in a directly created supergroup.
    /// </summary>
    property SupergroupChatCreated: Boolean read Fsupergroup_chat_created
      write Fsupergroup_chat_created default True;
    /// <summary>
    /// Optional. Service message: the channel has been created. This field can't be received in a message coming through updates, because bot can't be a member of a channel when it is created. It can only be found in reply_to_message if someone replies to a very first message in a channel.
    /// </summary>
    property ChannelChatCreated: Boolean read Fchannel_chat_created
      write Fchannel_chat_created default True;
    // /// <summary>
    // /// Optional. Service message: auto-delete timer settings changed in the chat
    // /// </summary>
    // property message_auto_delete_timer_changed
    // : TftMessageAutoDeleteTimerChanged
    // read Fmessage_auto_delete_timer_changed
    // write Fmessage_auto_delete_timer_changed;
    /// <summary>
    /// Optional. The group has been migrated to a supergroup with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    /// </summary>
    property MigrateToChatId: Integer read Fmigrate_to_chat_id
      write Fmigrate_to_chat_id;
    /// <summary>
    /// Optional. The supergroup has been migrated from a group with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    /// </summary>
    property MigrateFromChatId: Integer read Fmigrate_from_chat_id
      write Fmigrate_from_chat_id;
    /// <summary>
    /// Optional. Specified message was pinned. Note that the Message object in this field will not contain further reply_to_message fields even if it is itself a reply.
    /// </summary>
    property PinnedMessage: TftMessage read Fpinned_message
      write Fpinned_message;
    // /// <summary>
    // /// Optional. Message is an invoice for a payment, information about the invoice. More about payments »
    // /// </summary>
    property Invoice: TftInvoice read Finvoice write Finvoice;
    // /// <summary>
    // /// Optional. Message is a service message about a successful payment, information about the payment. More about payments »
    // /// </summary>
    property SuccessfulPayment: TftSuccessfulPayment read Fsuccessful_payment
      write Fsuccessful_payment;
    // /// <summary>
    // /// Optional. The domain name of the website on which the user has logged in. More about Telegram Login »
    // /// </summary>
    property ConnectedWebsite: String read Fconnected_website
      write Fconnected_website;
    // /// <summary>
    // /// Optional. Telegram Passport data
    // /// </summary>
    // property passport_data: PassportData read Fpassport_data
    // write Fpassport_data;
    // /// <summary>
    // /// Optional. Service message. A user in the chat triggered another user's proximity alert while sharing Live Location.
    // /// </summary>
    // property proximity_alert_triggered: ProximityAlertTriggered
    // read Fproximity_alert_triggered write Fproximity_alert_triggered;
    // /// <summary>
    // /// Optional. Service message: voice chat scheduled
    // /// </summary>
    // property voice_chat_scheduled: VoiceChatScheduled read Fvoice_chat_scheduled
    // write Fvoice_chat_scheduled;
    // /// <summary>
    // /// Optional. Service message: voice chat started
    // /// </summary>
    // property voice_chat_started: VoiceChatStarted read Fvoice_chat_started
    // write Fvoice_chat_started;
    // /// <summary>
    // /// Optional. Service message: voice chat ended
    // /// </summary>
    // property voice_chat_ended: VoiceChatEnded read Fvoice_chat_ended
    // write Fvoice_chat_ended;
    // /// <summary>
    // /// Optional. Service message: new participants invited to a voice chat
    // /// </summary>
    // property voice_chat_participants_invited: VoiceChatParticipantsInvited
    // read Fvoice_chat_participants_invited
    // write Fvoice_chat_participants_invited;
    // /// <summary>
    // /// Optional. Inline keyboard attached to the message. login_url buttons are represented as ordinary url buttons.
    // /// </summary>
    property ReplyMarkup: TftInlineKeyboardMarkup read Freply_markup
      write Freply_markup;
  end;

implementation

{ TftMessage }

constructor TftMessage.Create;
begin
  Ffrom := TftUser.Create;
  Fsender_chat := TftChat.Create;
  Fchat := TftChat.Create;
  Fforward_from := TftUser.Create;
  Fforward_from_chat := TftChat.Create;
  // Freply_to_message := TftMessage.Create;
  Fvia_bot := TftUser.Create;
  // Fentities := TftMessageEntityList.Create;
  Fanimation := TftAnimation.Create;
  Faudio := TftAudio.Create;
  Fdocument := TftDocument.Create;
  // Fphoto := TftPhotoSizeList.Create;
  Fsticker := TftSticker.Create;
  Fvideo := TftVideo.Create;
  Fvideo_note := TftVideoNote.Create;
  Fvoice := TftVoice.Create;
  // Fcaption_entities := TftMessageEntityList.Create;
  Fcontact := TftContact.Create;
  Fdice := TftDice.Create;
  Fgame := TftGame.Create;
  Fpoll := TftPoll.Create;
  Fvenue := TftVenue.Create;
  Flocation := TftLocation.Create;
  // Fnew_chat_members := TftUserList.Create;
  Fleft_chat_member := TftUser.Create;
  // Fnew_chat_photo := TftPhotoSizeList.Create;
end;

destructor TftMessage.Destroy;
begin
  FreeAndNil(Ffrom);
  FreeAndNil(Fsender_chat);
  FreeAndNil(Fchat);
  FreeAndNil(Fforward_from);
  FreeAndNil(Fforward_from_chat);
  FreeAndNil(Freply_to_message);
  FreeAndNil(Fvia_bot);
  // FreeAndNil(Fentities);
  FreeAndNil(Fanimation);
  FreeAndNil(Faudio);
  FreeAndNil(Fdocument);
  // FreeAndNil(Fphoto);
  FreeAndNil(Fsticker);
  FreeAndNil(Fvideo);
  FreeAndNil(Fvideo_note);
  FreeAndNil(Fvoice);
  // FreeAndNil(Fcaption_entities);
  FreeAndNil(Fcontact);
  FreeAndNil(Fdice);
  FreeAndNil(Fgame);
  FreeAndNil(Fpoll);
  FreeAndNil(Fvenue);
  FreeAndNil(Flocation);
  // FreeAndNil(Fnew_chat_members);
  FreeAndNil(Fleft_chat_member);
  // FreeAndNil(Fnew_chat_photo);
  inherited;
end;

end.
