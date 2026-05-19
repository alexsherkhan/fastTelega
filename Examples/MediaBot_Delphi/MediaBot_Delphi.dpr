/// <summary>
/// MediaBot - FastTelega Demo
///
/// Bot que demuestra el envío de diferentes tipos de multimedia
/// con la librería FastTelega:
///
///   - Envío de ubicación (sendLocation)
///   - Envío de contacto (sendContact)
///   - Envío de dado/emoji animado (sendDice)
///   - Indicador de actividad (sendChatAction)
///   - Envío de foto, video, audio, voz, animación, documento y sticker
///     desde archivos locales con TftInputFile
///   - Teclado inline para navegación de menú
///   - Manejo de CallbackQuery
///
/// USO:
///   1. Reemplaza BOT_TOKEN con el token de tu bot (@BotFather)
///   2. Para los comandos de archivo (/photo, /video, /audio, /voice,
///      /animation, /document), ajusta las rutas en la sección
///      MEDIA FILE PATHS antes de compilar.
///   3. Compila y ejecuta como aplicación de consola.
///   4. Envía /start a tu bot en Telegram.
/// </summary>
program MediaBot_Delphi;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  fastTelega.AvailableTypes,
  fastTelega.Bot,
  fastTelega.EventBroadcaster,
  fastTelega.LongPoll;

// ===========================================================================
//  CONFIGURACIÓN
// ===========================================================================
const
  BOT_TOKEN = 'YOUR_BOT_TOKEN_HERE';

  // --------------------------------------------------------------------------
  //  MEDIA FILE PATHS
  //  Ajusta estas rutas a archivos reales en tu sistema antes de compilar.
  //  Puedes obtener muestras gratuitas en:
  //    Fotos:      cualquier archivo .jpg / .png
  //    Video:      cualquier archivo .mp4
  //    Audio:      cualquier archivo .mp3
  //    Voz:        archivo .ogg codificado con OPUS
  //    Animación:  archivo .gif o .mp4 sin sonido
  //    Documento:  cualquier archivo (pdf, zip, txt…)
  //    Sticker:    archivo .webp
  // --------------------------------------------------------------------------
  PHOTO_PATH     = 'C:\Media\sample_photo.jpg';
  VIDEO_PATH     = 'C:\Media\sample_video.mp4';
  AUDIO_PATH     = 'C:\Media\sample_audio.mp3';
  VOICE_PATH     = 'C:\Media\sample_voice.ogg';
  ANIMATION_PATH = 'C:\Media\sample_animation.gif';
  DOCUMENT_PATH  = 'C:\Media\sample_document.pdf';
  STICKER_PATH   = 'C:\Media\sample_sticker.webp';

  // --------------------------------------------------------------------------
  //  UBICACIÓN DE DEMO: Plaza Mayor, Madrid
  // --------------------------------------------------------------------------
  DEMO_LATITUDE  = 40.4153;
  DEMO_LONGITUDE = -3.7074;

// ===========================================================================

var
  Bot: TftBot;
  LongPoll: TftLongPoll;
  Token: String;

// ---------------------------------------------------------------------------
// Construye el menú principal como teclado inline
// ---------------------------------------------------------------------------
function BuildMainMenu: TftInlineKeyboardMarkup;
var
  Keyboard: TftInlineKeyboardMarkup;
  Row1, Row2, Row3, Row4: TList<TftInlineKeyboardButton>;

  function Btn(AText, AData: String): TftInlineKeyboardButton;
  begin
    Result := TftInlineKeyboardButton.Create(AText);
    Result.callbackData := AData;
  end;

begin
  Keyboard := TftInlineKeyboardMarkup.Create;

  Row1 := TList<TftInlineKeyboardButton>.Create;
  Row1.Add(Btn('📷 Foto',     'media:photo'));
  Row1.Add(Btn('🎬 Video',    'media:video'));

  Row2 := TList<TftInlineKeyboardButton>.Create;
  Row2.Add(Btn('🎵 Audio',    'media:audio'));
  Row2.Add(Btn('🎙 Voz',      'media:voice'));

  Row3 := TList<TftInlineKeyboardButton>.Create;
  Row3.Add(Btn('🎞 Animación','media:animation'));
  Row3.Add(Btn('📄 Documento','media:document'));

  Row4 := TList<TftInlineKeyboardButton>.Create;
  Row4.Add(Btn('📍 Ubicación','media:location'));
  Row4.Add(Btn('📱 Contacto', 'media:contact'));
  Row4.Add(Btn('🎲 Dado',     'media:dice'));

  Keyboard.inlineKeyboard.Add(Row1);
  Keyboard.inlineKeyboard.Add(Row2);
  Keyboard.inlineKeyboard.Add(Row3);
  Keyboard.inlineKeyboard.Add(Row4);

  Result := Keyboard;
end;

// ---------------------------------------------------------------------------
// Envía el tipo de media solicitado a un chatId
// ---------------------------------------------------------------------------
procedure SendMedia(ChatId: Integer; const MediaType: String);
var
  InputFile: TftInputFile;
begin
  // Para todos los tipos de archivo, señalizamos que estamos "subiendo"
  if MediaType = 'photo' then
  begin
    Bot.API.sendChatAction(ChatId, 'upload_photo');
    InputFile := TftInputFile.fromFile(PHOTO_PATH, 'image/jpeg');
    try
      Bot.API.sendPhoto(ChatId, InputFile, '📷 Foto enviada con <b>sendPhoto</b>',
        0, nil, 'HTML');
    finally
      InputFile.Free;
    end;
  end

  else if MediaType = 'video' then
  begin
    Bot.API.sendChatAction(ChatId, 'upload_video');
    InputFile := TftInputFile.fromFile(VIDEO_PATH, 'video/mp4');
    try
      Bot.API.sendVideo(ChatId, InputFile, 0, 0, 0, nil,
        '🎬 Video enviado con <b>sendVideo</b>', 'HTML', True);
    finally
      InputFile.Free;
    end;
  end

  else if MediaType = 'audio' then
  begin
    Bot.API.sendChatAction(ChatId, 'upload_voice');
    InputFile := TftInputFile.fromFile(AUDIO_PATH, 'audio/mpeg');
    try
      Bot.API.sendAudio(ChatId, InputFile,
        '🎵 Audio enviado con <b>sendAudio</b>', 0, nil, 'HTML');
    finally
      InputFile.Free;
    end;
  end

  else if MediaType = 'voice' then
  begin
    Bot.API.sendChatAction(ChatId, 'record_voice');
    InputFile := TftInputFile.fromFile(VOICE_PATH, 'audio/ogg');
    try
      Bot.API.sendVoice(ChatId, InputFile,
        '🎙 Nota de voz enviada con <b>sendVoice</b>', 'HTML');
    finally
      InputFile.Free;
    end;
  end

  else if MediaType = 'animation' then
  begin
    Bot.API.sendChatAction(ChatId, 'upload_document');
    InputFile := TftInputFile.fromFile(ANIMATION_PATH, 'image/gif');
    try
      Bot.API.sendAnimation(ChatId, InputFile, 0, 0, 0, nil,
        '🎞 Animación enviada con <b>sendAnimation</b>', 'HTML');
    finally
      InputFile.Free;
    end;
  end

  else if MediaType = 'document' then
  begin
    Bot.API.sendChatAction(ChatId, 'upload_document');
    InputFile := TftInputFile.fromFile(DOCUMENT_PATH, 'application/pdf');
    try
      Bot.API.sendDocument(ChatId, InputFile, nil,
        '📄 Documento enviado con <b>sendDocument</b>', 0, nil, 'HTML');
    finally
      InputFile.Free;
    end;
  end

  else if MediaType = 'location' then
  begin
    // sendLocation no requiere archivos
    Bot.API.sendLocation(ChatId, DEMO_LATITUDE, DEMO_LONGITUDE);
    Bot.API.sendMessage(ChatId,
      Format('📍 Ubicación enviada con <b>sendLocation</b>' + #10 +
             'Lat: <code>%.4f</code>  Lon: <code>%.4f</code>' + #10 +
             '(Plaza Mayor, Madrid)',
        [DEMO_LATITUDE, DEMO_LONGITUDE]),
      False, 0, nil, 'HTML');
  end

  else if MediaType = 'contact' then
  begin
    // sendContact no requiere archivos
    Bot.API.sendContact(ChatId, '+34 600 000 000', 'FastTelega', 'Demo');
    Bot.API.sendMessage(ChatId,
      '📱 Contacto enviado con <b>sendContact</b>',
      False, 0, nil, 'HTML');
  end

  else if MediaType = 'dice' then
  begin
    // sendDice no requiere archivos — prueba los distintos emojis
    Bot.API.sendDice(ChatId, '🎲');
    Bot.API.sendDice(ChatId, '🎯');
    Bot.API.sendDice(ChatId, '🎰');
    Bot.API.sendMessage(ChatId,
      '🎲 Dados enviados con <b>sendDice</b>' + #10 +
      'Emojis soportados: 🎲 🎯 🏀 ⚽ 🎳 🎰',
      False, 0, nil, 'HTML');
  end;
end;

// ---------------------------------------------------------------------------
// Registra todos los manejadores de eventos
// ---------------------------------------------------------------------------
procedure RegisterHandlers;
begin

  // --- /start ---------------------------------------------------------------
  Bot.Events.OnCommand('start',
    procedure(const FTMessage: TObject)
    var
      Msg: TftMessage;
      Menu: TftInlineKeyboardMarkup;
    begin
      Msg := TftMessage(FTMessage);
      Menu := BuildMainMenu;
      try
        Bot.API.sendMessage(Msg.Chat.Id,
          '<b>🎬 MediaBot — FastTelega Demo</b>' + #10 +
          #10 +
          'Este bot demuestra el envío de diferentes tipos de media.' + #10 +
          'Selecciona un tipo del menú o usa los comandos directos:' + #10 +
          #10 +
          '/photo      — Enviar una foto' + #10 +
          '/video      — Enviar un video' + #10 +
          '/audio      — Enviar un audio' + #10 +
          '/voice      — Enviar una nota de voz' + #10 +
          '/animation  — Enviar una animación (GIF)' + #10 +
          '/document   — Enviar un documento' + #10 +
          '/location   — Enviar una ubicación' + #10 +
          '/contact    — Enviar un contacto' + #10 +
          '/dice       — Enviar un dado animado',
          False, 0, Menu, 'HTML');
      finally
        Menu.Free;
      end;
    end);

  // --- Comandos de media directos -------------------------------------------
  Bot.Events.OnCommand('photo',
    procedure(const FTMessage: TObject)
    begin
      SendMedia(TftMessage(FTMessage).Chat.Id, 'photo');
    end);

  Bot.Events.OnCommand('video',
    procedure(const FTMessage: TObject)
    begin
      SendMedia(TftMessage(FTMessage).Chat.Id, 'video');
    end);

  Bot.Events.OnCommand('audio',
    procedure(const FTMessage: TObject)
    begin
      SendMedia(TftMessage(FTMessage).Chat.Id, 'audio');
    end);

  Bot.Events.OnCommand('voice',
    procedure(const FTMessage: TObject)
    begin
      SendMedia(TftMessage(FTMessage).Chat.Id, 'voice');
    end);

  Bot.Events.OnCommand('animation',
    procedure(const FTMessage: TObject)
    begin
      SendMedia(TftMessage(FTMessage).Chat.Id, 'animation');
    end);

  Bot.Events.OnCommand('document',
    procedure(const FTMessage: TObject)
    begin
      SendMedia(TftMessage(FTMessage).Chat.Id, 'document');
    end);

  Bot.Events.OnCommand('location',
    procedure(const FTMessage: TObject)
    begin
      SendMedia(TftMessage(FTMessage).Chat.Id, 'location');
    end);

  Bot.Events.OnCommand('contact',
    procedure(const FTMessage: TObject)
    begin
      SendMedia(TftMessage(FTMessage).Chat.Id, 'contact');
    end);

  Bot.Events.OnCommand('dice',
    procedure(const FTMessage: TObject)
    begin
      SendMedia(TftMessage(FTMessage).Chat.Id, 'dice');
    end);

  // --- Callback del teclado inline ------------------------------------------
  // Se dispara cuando el usuario pulsa un botón del menú
  Bot.Events.OnCallbackQuery(
    procedure(const Query: TObject)
    var
      Q: TftCallbackQuery;
      MediaType: String;
    begin
      Q := TftCallbackQuery(Query);

      // Responder al callback (quita el "reloj" del botón en Telegram)
      Bot.API.answerCallbackQuery(Q.Id);

      // El callback_data tiene formato "media:tipo"
      if Pos('media:', Q.Data) = 1 then
      begin
        MediaType := Copy(Q.Data, Length('media:') + 1, MaxInt);
        Writeln('  >> CallbackQuery: media:' + MediaType);
        SendMedia(Q.Message.Chat.Id, MediaType);
      end;
    end);

  // --- Comando desconocido --------------------------------------------------
  Bot.Events.OnUnknownCommand(
    procedure(const FTMessage: TObject)
    var
      Msg: TftMessage;
    begin
      Msg := TftMessage(FTMessage);
      Bot.API.sendMessage(Msg.Chat.Id,
        '❓ Comando no reconocido.' + #10 +
        'Usa /start para ver el menú.',
        False, Msg.MessageId);
    end);

end;

// ===========================================================================
//  Programa principal
// ===========================================================================
begin
  Writeln('╔══════════════════════════════╗');
  Writeln('║   MediaBot - FastTelega Demo ║');
  Writeln('╚══════════════════════════════╝');
  Writeln('');

  // Resolución del token: si empieza con '@', leer de variable de entorno
  if (Length(BOT_TOKEN) > 1) and (BOT_TOKEN[1] = '@') then
    Token := GetEnvironmentVariable(Copy(BOT_TOKEN, 2, MaxInt))
  else
    Token := BOT_TOKEN;

  if (Token = '') or (Token = 'YOUR_BOT_TOKEN_HERE') then
  begin
    if (Length(BOT_TOKEN) > 1) and (BOT_TOKEN[1] = '@') then
      Writeln('ERROR: La variable de entorno "' +
        Copy(BOT_TOKEN, 2, MaxInt) + '" no está definida o está vacía.')
    else
      Writeln('ERROR: Configura BOT_TOKEN con el token de tu bot.');
    Writeln('Obtén uno hablando con @BotFather en Telegram.');
    ExitCode := 1;
    Exit;
  end;

  try
    Writeln('Conectando...');
    Bot := TftBot.Create(Token, 'https://api.telegram.org');
    try
      RegisterHandlers;

      Writeln('Bot activo: @' + Bot.API.getMe.UserName);
      Writeln('');
      Writeln('NOTA: Los comandos de archivo (/photo, /video, etc.) requieren');
      Writeln('      que configures las rutas en la sección MEDIA FILE PATHS');
      Writeln('      del código fuente antes de compilar.');
      Writeln('');
      Writeln('Los comandos /location, /contact y /dice funcionan sin archivos.');
      Writeln('');

      Bot.API.deleteWebhook();
      Writeln('Long polling iniciado. Presiona Ctrl+C para detener.');
      Writeln('');

      LongPoll := TftLongPoll.Create(Bot);
      try
        while True do
        begin
          Writeln('[' + FormatDateTime('hh:nn:ss', Now) + '] Esperando mensajes...');
          LongPoll.start();
        end;
      finally
        LongPoll.Free;
      end;
    finally
      Bot.Free;
    end;
  except
    on E: Exception do
    begin
      Writeln('ERROR: ' + E.ClassName + ': ' + E.Message);
      ExitCode := 1;
    end;
  end;
end.
