unit IWStrat_specialfeatures;

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
  TISFSpecialFeatures = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbReturn: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNew: TIWButton;
    TopBar: TISFTopBarStrat;
    FDMemTable1: TFDMemTable;
    FDMemTable1FeatureID: TIntegerField;
    FDMemTable1SpecialFeature: TStringField;
    FDMemTable1LegendOrder: TIntegerField;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
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
  ServerController, DBClient, IWStrat_uMain, IWStrat_constants, IWStrat_dm;




procedure TISFSpecialFeatures.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStrat.qSpecialFeatures.Close;
  dmStrat.cdsSpecialFeatures.Close;
  dmStrat.cdsSpecialFeatures.Open;
end;

procedure TISFSpecialFeatures.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwbAddNew.Visible := (UserSession.CanModify and (dmStrat.cdsSpecialFeatures.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsSpecialFeatures.State in [dsEdit,dsInsert]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsSpecialFeatures.State in [dsEdit,dsInsert]));
  iwbReturn.Visible := (dmStrat.cdsSpecialFeatures.State in [dsBrowse]);
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmStrat.cdsSpecialFeatures.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmStrat.cdsSpecialFeatures.RecordCount > iwDBg.RowLimit);
end;

procedure TISFSpecialFeatures.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsSpecialFeatures.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFSpecialFeatures.iwlPrevPageClick(Sender: TObject);
begin
  dmStrat.cdsSpecialFeatures.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFSpecialFeatures.iwlNextPageClick(Sender: TObject);
begin
  dmStrat.cdsSpecialFeatures.MoveBy(iwDBg.RowLimit);
end;

procedure TISFSpecialFeatures.iwbAddNewClick(Sender: TObject);
begin
  try
    dmStrat.cdsSpecialFeatures.Append;
    dmStrat.cdsSpecialFeaturesSPECIALFEATUREID.AsInteger := 999;
    dmStrat.cdsSpecialFeaturesSPECIALFEATURE.AsString := 'NEW'+UserSession.UserID;
    dmStrat.cdsSpecialFeaturesLEGENDORDER.AsInteger := 0;
    dmStrat.cdsSpecialFeatures.Post;
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

procedure TISFSpecialFeatures.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsSpecialFeatures.ApplyUpdates(0);
  except
  end;
end;

procedure TISFSpecialFeatures.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsSpecialFeatures.CancelUpdates;
  except
  end;
end;

procedure TISFSpecialFeatures.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsSpecialFeatures.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFSpecialFeatures.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  dmStrat.cdsSpecialFeatures.First;
  repeat
    FDMemTable1.InsertRecord([dmStrat.cdsSpecialFeaturesSPECIALFEATUREID.AsVariant,dmStrat.cdsSpecialFeaturesSPECIALFEATURE.AsVariant,dmStrat.cdsSpecialFeaturesLEGENDORDER.AsVariant]);
    dmStrat.cdsSpecialFeatures.Next;
  until dmStrat.cdsSpecialFeatures.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxStratDBSpecialFeatures.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBSpecialFeatures.xlsx';
  frFileNameStr := 'SpecialFeatures.xlsx';
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
      end;
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFSpecialFeatures.iwDBgColumns1Click(ASender: TObject; const AValue: string);
begin
  if UserSession.CanModify then
  begin
    UserSession.ParameterChosen := AValue;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    //TIWAppForm(WebApplication.ActiveForm).Release;
    //TISFProvinceEdit.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('Edit rights are required to change these values');
  end;
end;

end.
