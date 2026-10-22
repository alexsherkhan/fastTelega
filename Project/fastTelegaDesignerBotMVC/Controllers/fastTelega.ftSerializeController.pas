unit fastTelega.ftSerializeController;

interface

uses
  JSON,
  fastTelega.ftDesignerBotController,
  Data.DBXJSONReflect;

type
  TftSerializeController = class(TObject)
  public
    class procedure Serialize(const AFileName: string;
      const ADiagramm: TftDesignerBotController);
    class function DeSerialize(const AFileName: string)
      : TftDesignerBotController;
  end;

implementation

uses
  System.Classes,
  // msShape,
  // FMX.Dialogs,
  System.SysUtils;

{ TftSerializeController }

class function TftSerializeController.DeSerialize(const AFileName: string)
  : TftDesignerBotController;
var
  LUnMarshal: TJSONUnMarshal;
  LStringList: TStringList;
begin
//  try
//    LUnMarshal := TJSONUnMarshal.Create;
//
//    LUnMarshal.RegisterReverter(TftDiagrammBotController, 'FCardList',
//      procedure(Data: TObject; Field: String; Args: TListOfObjects)
//      var
//        LObject: TObject;
//        LDiagramm: TftDiagrammBotController;
//        LmsShape: TmsShape;
//      begin
//        LDiagramm := TftDiagrammBotController(Data);
//        LDiagramm.ShapeList := TmsShapeList.Create;
//        assert(LDiagramm <> nil);
//
//        for LObject in Args do
//        begin
//          LmsShape := LObject as TmsShape;
//          LDiagramm.ShapeList.Add(LmsShape);
//        end
//      end);
//
//    LStringList := TStringList.Create;
//    LStringList.LoadFromFile(AFileName);
//
//    Result := LUnMarshal.Unmarshal
//      (TJSONObject.ParseJSONValue(LStringList.Text)) as TftDiagrammBotController;
//
//  finally
//    FreeAndNil(LUnMarshal);
//    FreeAndNil(LStringList);
//  end;

end;

class procedure TftSerializeController.Serialize(const AFileName: string;
const ADiagramm: TftDesignerBotController);
var
  LMarshal: TJSONMarshal; // Serializer
  LJson: TJSONObject;
  LStringList: TStringList;
begin
//  try
//    LMarshal := TJSONMarshal.Create;
//
//    LMarshal.RegisterConverter(TftDiagrammBotController, 'FShapeList',
//      function(Data: TObject; Field: string): TListOfObjects
//      var
//        l_Shape: ImsShape;
//        l_Index: Integer;
//      begin
//        assert(Field = 'FShapeList');
//        SetLength(Result, (Data As TftDiagrammBotController).ShapeList.Count);
//        LIndex := 0;
//        for l_Shape in (Data As TftDiagrammBotController).ShapeList do
//        begin
//          Result[l_Index] := l_Shape.HackInstance;
//          Inc(l_Index);
//        end; // for LShape
//      end);
//
//    LStringList := TStringList.Create;
//    try
//      LJson := LMarshal.Marshal(ADiagramm) as TJSONObject;
//    except
//      on E: Exception do
//        ShowMessage(E.ClassName + ' поднята ошибка с сообщением : ' +
//          E.Message);
//    end;
//
//    LStringList.Add(l_Json.tostring);
//    LStringList.SaveToFile(AFileName);
//  finally
//    FreeAndNil(LJson);
//    FreeAndNil(LStringList);
//    FreeAndNil(LMarshal);
//  end;

end;

end.
