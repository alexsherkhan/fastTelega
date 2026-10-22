unit fastTelega.ftPluginAPI;

interface

type
  IPluginInfo = interface
    ['{3C41DF88-4D2F-49B1-9F33-37CD026F22D3}']
    // private
    function GetID: TGUID; safecall;
    function GetName: WideString; safecall;
    function GetVersion: WideString; safecall;
    // public
    property ID: TGUID read GetID;
    property Name: WideString read GetName;
    property Version: WideString read GetVersion;
  end;

  ICoreInfo = interface
    ['{731D3E83-9BE0-4396-A99E-F74512D6409E}']
    // private
    function GetVersion: Integer; safecall;
    // public
    property Version: Integer read GetVersion;
  end;

  TftInitPluginFunc = function(const ACore: IUnknown): IUnknown; safecall;
  TftDonePluginFunc = procedure; safecall;

const
  SPluginInitFuncName = '8D6191CC144D45B28DEAF1506C344CFB';
  SPluginDoneFuncName = SPluginInitFuncName + '_done';
  SPluginExt = '.FtPlugin';

implementation

end.
