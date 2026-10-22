unit fastTelega.ftViewBase;

interface

uses System.Classes, System.Types, Vcl.Controls, Vcl.Forms;

type

  IftView = interface
    ['{B498A65C-B308-4E77-BBA8-961221B6DD15}']
  end;

  TftViewBase = class(TCustomTransparentControl, IftView)
  end;

  TftViewScrollBoxBase = class(TScrollBox, IftView)
  end;

 TftGraphicViewBase = class(TGraphicControl,IftView)
 end;

implementation

end.
