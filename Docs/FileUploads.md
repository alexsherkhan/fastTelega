# File uploads

## TftInputFile

`TftInputFile` describes a file to upload:

```pascal
var
  Photo: TftInputFile;
begin
  Photo := TftInputFile.FromFile('C:\images\photo.jpg', 'image/jpeg');
  try
    Bot.API.SendPhoto(ChatId, Photo, 'Caption').Free;
  finally
    Photo.Free;
  end;
end;
```

`FromFile` fills `FilePath`, `FileName` and `MimeType`. It does **not** read the
file into `Data`; multipart requests use `FilePath`, so this is sufficient for
the built-in upload methods.

## Methods that support multipart uploads

| Method | File parameters |
|---|---|
| `SendPhoto` | `APhoto` |
| `SendAudio` | `AAudio`, `AThumb` |
| `SendDocument` | `ADocument`, `AThumb` |
| `SendVideo` | `AVideo`, `AThumb` |
| `SendAnimation` | `AAnimation`, `AThumb` |
| `SendVoice` | `AVoice` |
| `SendVideoNote` | `AVideoNote`, `AThumb` |
| `SendSticker` | `ASticker` |
| `SendLivePhoto` | `ALivePhoto`, `APhoto` |
| `UploadStickerFile` | `APngSticker` |
| `SetStickerSetThumbnail` | `AThumbnail` |
| `SetMyProfilePhoto` | `APhoto.PhotoFile` / `APhoto.AnimationFile` |
| `SetBusinessAccountProfilePhoto` | `APhoto.PhotoFile` / `APhoto.AnimationFile` |
| `PostStory` / `EditStory` | `AContent.PhotoFile` / `AContent.VideoFile` |

## Send a document

```pascal
var
  Doc: TftInputFile;
  Sent: TftMessage;
begin
  Doc := TftInputFile.FromFile('C:\files\report.pdf', 'application/pdf');
  try
    Sent := Bot.API.SendDocument(ChatId, Doc, nil, 'Monthly report');
    try
      WriteLn('Sent message ', Sent.MessageId);
    finally
      Sent.Free;
    end;
  finally
    Doc.Free;
  end;
end;
```

## Profile photo

Profile photos cannot be reused by `file_id`, so upload a file:

```pascal
var
  Photo: TftInputProfilePhoto;
begin
  Photo := TftInputProfilePhoto.Create;
  try
    Photo.Type_S := 'static';
    Photo.PhotoFile := TftInputFile.FromFile('C:\images\avatar.jpg', 'image/jpeg');
    try
      Bot.API.SetMyProfilePhoto(Photo);
    finally
      Photo.PhotoFile.Free;
    end;
  finally
    Photo.Free;
  end;
end;
```

For an animated profile photo, set `Type_S := 'animated'` and assign
`AnimationFile`.

## Stories

`PostStory` and `EditStory` use multipart when `PhotoFile` or `VideoFile` is
assigned:

```pascal
var
  Content: TftInputStoryContent;
  Story: TftStory;
begin
  Content := TftInputStoryContent.Create;
  try
    Content.Type_S := 'photo';
    Content.PhotoFile := TftInputFile.FromFile('C:\images\story.jpg', 'image/jpeg');
    try
      Story := Bot.API.PostStory(BusinessConnectionId, Content, 86400, 'New story');
      try
        WriteLn('Story ', Story.Id);
      finally
        Story.Free;
      end;
    finally
      Content.PhotoFile.Free;
    end;
  finally
    Content.Free;
  end;
end;
```

## Attach references and media groups

`SendMediaGroup` supports multipart uploads through `TftInputMedia.MediaFile`.
When at least one media item has `MediaFile` assigned, the method switches to
multipart, assigns `AttachName` (`file0`, `file1`, ...) when empty, and uploads
all files with the group. Without files, the media array is sent as JSON and can
use `file_id`, HTTP URLs or `attach://` references.

Telegram also accepts `attach://<name>` references for paid media and stickers;
those methods still require the caller to provide the attach name and a
separate upload mechanism.

For single-file methods, prefer `TftInputFile` over manually constructing
`attach://` strings.

## File ownership

`TftInputFile` and the input model objects (`TftInputProfilePhoto`,
`TftInputStoryContent`, `TftInputSticker`, `TftInputPaidMedia`) are not owned by
the API. Free them after the request returns.
