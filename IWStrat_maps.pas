unit IWStrat_maps;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton, DB,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWStrat_frTopBar, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TISFMaps = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNew: TIWButton;
    TopBar: TISFTopBarStrat;
    IWLabel1: TIWLabel;
    FDMemTable1: TFDMemTable;
    FDMemTable1MapID: TStringField;
    FDMemTable1MapName: TStringField;
    FDMemTable1ShapeFileName: TStringField;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbAddNewClick(Sender: TObject);
    procedure iwDBgColumns1Click(ASender: TObject; const AValue: string);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, IWStrat_uMain, IWStrat_constants, IWStrat_dm,
  IWStrat_dmC;




procedure TISFMaps.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStrat.qMaps.Close;
  dmStrat.cdsMaps.Close;
  dmStrat.cdsMaps.Open;
end;

procedure TISFMaps.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  //iwbAddNew.Visible := (UserSession.CanModify and (dmStrat.cdsMaps.State in [dsBrowse]));
  //iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsMaps.State in [dsEdit]));
  //iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsMaps.State in [dsEdit]));
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmStrat.cdsMaps.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmStrat.cdsMaps.RecordCount > iwDBg.RowLimit);
end;

procedure TISFMaps.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsMaps.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFMaps.iwlPrevPageClick(Sender: TObject);
begin
  dmStrat.cdsMaps.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFMaps.iwlNextPageClick(Sender: TObject);
begin
  dmStrat.cdsMaps.MoveBy(iwDBg.RowLimit);
end;

procedure TISFMaps.iwbAddNewClick(Sender: TObject);
begin
  try
    dmStrat.cdsMaps.Append;
    dmStrat.cdsMapsMAPID2.AsString := 'NEW'+UserSession.UserID;
    dmStrat.cdsMapsMAPNAME.AsString := 'NEW'+UserSession.UserID;
    dmStrat.cdsMapsSHAPEFILENAME.AsString := 'nd';
    dmStrat.cdsMaps.Post;
  except
    WebApplication.ShowMessage('Not able to add new record',smAlert);
  end;
  {
  try
    UserSession.ParameterChosen := 'NEW'+UserSession.UserID;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    //TIWAppForm(WebApplication.ActiveForm).Release;
    //TISFProvinceEdit.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to edit new chart record',smAlert);
  end;
  }
end;

procedure TISFMaps.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsMaps.ApplyUpdates(0);
  except
  end;
end;

procedure TISFMaps.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsMaps.CancelUpdates;
  except
  end;
end;

procedure TISFMaps.iwbCloseClick(Sender: TObject);
begin
  dmStrat.cdsMaps.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFMaps.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
begin
  FDMemTable1.Open;
  dmStrat.cdsMaps.First;
  repeat
    FDMemTable1.InsertRecord([dmStrat.cdsMapsMAPID2.AsVariant,dmStrat.cdsMapsMAPNAME.AsVariant,dmStrat.cdsMapsSHAPEFILENAME.AsVariant]);
    dmStrat.cdsMaps.Next;
  until dmStrat.cdsMaps.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxStratDBMaps.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBMaps.xlsx';
  frFileNameStr := 'Maps.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('FDMemTable1',FDMemTable1);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFMaps.iwDBgColumns1Click(ASender: TObject; const AValue: string);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  tmpStr : string;
begin
  UserSession.ParameterChosen := AValue;
  dmStratC.qMapUnitsGIS.Close;
  dmStratC.qMapUnitsGIS.ParamByName('MapID').AsString := UserSession.ParameterChosen;
  dmStratC.cdsMapUnitsGIS.Close;
  dmStratC.cdsMapUnitsGIS.Open;
  //tmpStr := 'MapUnitGIS_'+UserSession.ParameterChosen+'.xlsx';
  //dmStratC.FlexCelReportMapUnitsGIS.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBMapUnitsGIS.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBMapUnitsGIS.xlsx';
  frFileNameStr := 'MapUnitGIS_'+UserSession.ParameterChosen+'.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsMapUnitsGIS',dmStratC.cdsMapUnitsGIS);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsMapUnitsGIS.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

end.
