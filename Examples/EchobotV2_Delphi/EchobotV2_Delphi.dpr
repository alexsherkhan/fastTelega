/// <summary>
/// EchobotV2 - FastTelega Demo
///
/// Un bot de eco mejorado que demuestra las características fundamentales
/// de la librería FastTelega:
///
///   - Comandos con /start, /help, /me, /info
///   - sendChatAction para indicar actividad al usuario
///   - Detección del tipo de mensaje entrante
///   - Manejo de comandos desconocidos
///   - Eco de mensajes de texto con respuesta al mensaje original
///
/// USO:
///   1. Reemplaza BOT_TOKEN con el token de tu bot (@BotFather)
///   2. Compila y ejecuta como aplicación de consola
///   3. Abre Telegram y envía /start a tu bot
/// </summary>
program EchobotV2_Delphi;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  fastTelega.AvailableTypes,
  fastTelega.Bot,
  fastTelega.EventBroadcaster,
  fastTelega.LongPoll;

const
  BOT_TOKEN = 'YOUR_BOT_TOKEN_HERE';

var
  Bot: TftBot;
  LongPoll: TftLongPoll;
  Token: String;

// ---------------------------------------------------------------------------
// Registra todos los manejadores de eventos del bot
// ---------------------------------------------------------------------------
procedure RegisterHandlers;
begin

  // --- /start ---------------------------------------------------------------
  Bot.Events.OnCommand('start',
    procedure(const FTMessage: TObject)
    var
      Msg: TftMessage;
      Text: String;
    begin
      Msg := TftMessage(FTMessage);
      Text :=
        '<b>👋 Hola, ' + Msg.From.FirstName + '!</b>' + #10 +
        #10 +
        'Soy un bot de demostración de <b>FastTelega</b>.' + #10 +
        'Te hago eco de todo lo que me escribas.' + #10 +
        #10 +
        '<b>Comandos disponibles:</b>' + #10 +
        '/start — Este mensaje' + #10 +
        '/help  — Ayuda detallada' + #10 +
        '/me    — Tu información de usuario' + #10 +
        '/info  — Información de este chat';
      Bot.API.sendMessage(Msg.Chat.Id, Text, False, 0, nil, 'HTML');
    end);

  // --- /help ----------------------------------------------------------------
  Bot.Events.OnCommand('help',
    procedure(const FTMessage: TObject)
    var
      Msg: TftMessage;
      Text: String;
    begin
      Msg := TftMessage(FTMessage);
      Text :=
        '<b>📖 Ayuda de EchobotV2</b>' + #10 +
        #10 +
        '<b>Comandos:</b>' + #10 +
        '/start — Saludo inicial con lista de comandos' + #10 +
        '/help  — Esta pantalla de ayuda' + #10 +
        '/me    — Muestra tu ID, nombre y username' + #10 +
        '/info  — Muestra el ID y nombre de este chat' + #10 +
        #10 +
        '<b>Tipos de mensaje reconocidos:</b>' + #10 +
        '💬 Texto → Te hago eco con referencia al mensaje' + #10 +
        '📷 Foto  → Te confirmo que la recibí' + #10 +
        '🎬 Video → Te confirmo que lo recibí' + #10 +
        '🎵 Audio → Te confirmo que lo recibí' + #10 +
        '🎙 Voz   → Te confirmo que la recibí' + #10 +
        '😊 Sticker → Te confirmo que lo recibí' + #10 +
        '📄 Documento → Te indico el nombre del archivo' + #10 +
        '📍 Ubicación → Te devuelvo las coordenadas' + #10 +
        '📱 Contacto → Te devuelvo el nombre';
      Bot.API.sendMessage(Msg.Chat.Id, Text, False, 0, nil, 'HTML');
    end);

  // --- /me ------------------------------------------------------------------
  Bot.Events.OnCommand('me',
    procedure(const FTMessage: TObject)
    var
      Msg: TftMessage;
      Text: String;
    begin
      Msg := TftMessage(FTMessage);
      Text :=
        '<b>👤 Tu información:</b>' + #10 +
        '🆔 ID: <code>' + IntToStr(Msg.From.Id) + '</code>' + #10 +
        '📛 Nombre: ' + Msg.From.FirstName;
      if Msg.From.LastName <> '' then
        Text := Text + ' ' + Msg.From.LastName;
      if Msg.From.UserName <> '' then
        Text := Text + #10 + '🔖 Username: @' + Msg.From.UserName;
      if Msg.From.LanguageCode <> '' then
        Text := Text + #10 + '🌐 Idioma: ' + Msg.From.LanguageCode;
      if Msg.From.IsBot then
        Text := Text + #10 + '🤖 Es un bot';
      Bot.API.sendMessage(Msg.Chat.Id, Text, False, 0, nil, 'HTML');
    end);

  // --- /info ----------------------------------------------------------------
  Bot.Events.OnCommand('info',
    procedure(const FTMessage: TObject)
    var
      Msg: TftMessage;
      Text: String;
    begin
      Msg := TftMessage(FTMessage);
      Text :=
        '<b>💬 Información del chat:</b>' + #10 +
        '🆔 Chat ID: <code>' + IntToStr(Msg.Chat.Id) + '</code>';
      if Msg.Chat.Title <> '' then
        Text := Text + #10 + '📌 Título: ' + Msg.Chat.Title;
      if Msg.Chat.UserName <> '' then
        Text := Text + #10 + '🔖 Username: @' + Msg.Chat.UserName;
      Bot.API.sendMessage(Msg.Chat.Id, Text, False, 0, nil, 'HTML');
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
        'Usa /help para ver los comandos disponibles.',
        False, Msg.MessageId);
    end);

  // --- Mensajes sin comando (eco) -------------------------------------------
  Bot.Events.OnNonCommandMessage(
    procedure(const FTMessage: TObject)
    var
      Msg: TftMessage;
      Reply: String;
    begin
      Msg := TftMessage(FTMessage);

      // Indicar al usuario que el bot está procesando
      Bot.API.sendChatAction(Msg.Chat.Id, 'typing');

      // Detectar el tipo de contenido y responder apropiadamente
      if Msg.Text <> '' then
      begin
        // Eco del texto con referencia al mensaje original
        Reply := '🔁 <b>Eco:</b> ' + Msg.Text;
        Bot.API.sendMessage(Msg.Chat.Id, Reply, False, Msg.MessageId,
          nil, 'HTML');
      end
      else if Length(Msg.Photo) > 0 then
        Bot.API.sendMessage(Msg.Chat.Id,
          '📷 Recibí una foto.', False, Msg.MessageId)
      else if Msg.Video <> nil then
        Bot.API.sendMessage(Msg.Chat.Id,
          '🎬 Recibí un video.', False, Msg.MessageId)
      else if Msg.Audio <> nil then
        Bot.API.sendMessage(Msg.Chat.Id,
          '🎵 Recibí un audio.', False, Msg.MessageId)
      else if Msg.Voice <> nil then
        Bot.API.sendMessage(Msg.Chat.Id,
          '🎙 Recibí una nota de voz.', False, Msg.MessageId)
      else if Msg.Sticker <> nil then
        Bot.API.sendMessage(Msg.Chat.Id,
          '😊 Recibí un sticker.', False, Msg.MessageId)
      else if Msg.Animation <> nil then
        Bot.API.sendMessage(Msg.Chat.Id,
          '🎞 Recibí una animación.', False, Msg.MessageId)
      else if Msg.Document <> nil then
        Bot.API.sendMessage(Msg.Chat.Id,
          '📄 Recibí un documento: <code>' + Msg.Document.fileName + '</code>',
          False, Msg.MessageId, nil, 'HTML')
      else if Msg.Location <> nil then
        Bot.API.sendMessage(Msg.Chat.Id,
          Format('📍 Recibí una ubicación:' + #10 +
                 'Lat: <code>%.6f</code>' + #10 +
                 'Lon: <code>%.6f</code>',
            [Msg.Location.Latitude, Msg.Location.Longitude]),
          False, Msg.MessageId, nil, 'HTML')
      else if Msg.Contact <> nil then
        Bot.API.sendMessage(Msg.Chat.Id,
          '📱 Recibí un contacto: ' +
          Msg.Contact.FirstName + ' ' + Msg.Contact.LastName,
          False, Msg.MessageId)
      else if Msg.Dice <> nil then
        Bot.API.sendMessage(Msg.Chat.Id,
          '🎲 Recibí un dado con valor: ' + IntToStr(Msg.Dice.Value),
          False, Msg.MessageId)
      else
        Bot.API.sendMessage(Msg.Chat.Id,
          '📨 Recibí un mensaje.', False, Msg.MessageId);
    end);

end;

// ---------------------------------------------------------------------------
// Programa principal
// ---------------------------------------------------------------------------
begin
  Writeln('╔══════════════════════════════╗');
  Writeln('║  EchobotV2 - FastTelega Demo ║');
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
      Bot.API.deleteWebhook();
      Writeln('Long polling iniciado. Presiona Ctrl+C para detener.');
      Writeln('');

      LongPoll := TftLongPoll.Create(Bot);
      try
        while True do
          LongPoll.start();
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
