unit IWStrat_charts;

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
  TISFCharts = class(TIWAppForm)
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
    FDMemTable1: TFDMemTable;
    FDMemTable1ChartID: TIntegerField;
    FDMemTable1Chart: TStringField;
    FDMemTable1ChartOffset_mm: TIntegerField;
    FDMemTable1DefaultDomainOffset_mm: TIntegerField;
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
  ServerController, DBClient, IWStrat_dmC, IWStrat_uMain, IWStrat_constants,
  IWStrat_chartedit;




procedure TISFCharts.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStratC.qCharts.Close;
  dmStratC.qCharts.ParamByName('USERID').AsString := UserSession.UserID;
  dmStratC.cdsCharts.Close;
  dmStratC.cdsCharts.Open;
end;

procedure TISFCharts.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwbAddNew.Visible := (UserSession.CanModify and (dmStratC.cdsCharts.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStratC.cdsCharts.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStratC.cdsCharts.State in [dsEdit]));
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmStratC.cdsCharts.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmStratC.cdsCharts.RecordCount > iwDBg.RowLimit);
end;

procedure TISFCharts.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStratC.cdsCharts.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFCharts.iwlPrevPageClick(Sender: TObject);
begin
  dmStratC.cdsCharts.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFCharts.iwlNextPageClick(Sender: TObject);
begin
  dmStratC.cdsCharts.MoveBy(iwDBg.RowLimit);
end;

procedure TISFCharts.iwbAddNewClick(Sender: TObject);
var
  MaxChartID : integer;
  tmpChartOffset, tmpDomainOffset : integer;
  WasSuccessful : boolean;
  tmpUser : string;
begin
  tmpUser := UserSession.UserID;
  dmStratC.qMaxChart.Close;
  dmStratC.cdsMaxChart.Close;
  dmStratC.cdsMaxChart.Open;
  MaxChartID := dmStratC.cdsMaxChartMAX.AsInteger;
  dmStratC.cdsMaxChart.Close;
  tmpChartOffset := 10;
  tmpDomainOffset := 100;
  try
    dmStratC.qChartsList.Close;
    dmStratC.qChartsList.ParamByName('OwnerID').AsString := tmpUser;
    dmStratC.cdsChartsList.Close;
    dmStratC.cdsChartsList.Open;
    dmStratC.cdsChartsList.Append;
    dmStratC.cdsChartsListCHARTID.AsInteger := MaxChartID + 1;
    dmStratC.cdsChartsListCHART.AsString := 'NEW'+tmpUser;
    dmStratC.cdsChartsListOWNERID.AsString := tmpUser;
    dmStratC.cdsChartsListCHARTOFFSET_MM.AsInteger := tmpChartOffset;
    dmStratC.cdsChartsListDEFAULTDOMAINOFFSET.AsInteger := tmpDomainOffset;
    dmStratC.cdsChartsListXMIN.AsInteger := 0;
    dmStratC.cdsChartsListXMAX.AsInteger := 1000;
    dmStratC.cdsChartsListYMIN.AsInteger := -2600;
    dmStratC.cdsChartsListYMAX.AsInteger := -1500;
    dmStratC.cdsChartsListDEFAULTMINAGE.AsFloat := 0.0;
    dmStratC.cdsChartsListDEFAULTMAXAGE.AsFloat := 4500.0;
    dmStratC.cdsChartsList.Post;
    dmStratC.cdsChartsList.ApplyUpdates(0);
    dmStratC.cdsChartsList.Close;
    dmStratC.cdsChartsList.Open;
    dmStratC.cdsChartsList.Last;
    dmStratC.AddChartUser(MaxChartID+1,tmpUser,WasSuccessful);
    dmStratC.cdsCharts.Close;
    dmStratC.cdsCharts.Open;
  except
    WebApplication.ShowMessage('Not able to add new chart',smAlert);
  end;
  try
    UserSession.ParameterChosen := IntToStr(MaxChartID+1);
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFChartEdit.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to edit new chart record',smAlert);
  end;
end;

procedure TISFCharts.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStratC.cdsCharts.ApplyUpdates(0);
  except
  end;
end;

procedure TISFCharts.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmStratC.cdsCharts.CancelUpdates;
  except
  end;
end;

procedure TISFCharts.iwbCloseClick(Sender: TObject);
begin
  dmStratC.cdsCharts.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFCharts.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  dmStratC.cdsCharts.First;
  repeat
    FDMemTable1.InsertRecord([dmStratC.cdsChartsCHARTID.AsVariant,dmStratC.cdsChartsCHART.AsVariant,dmStratC.cdsChartsCHARTOFFSET_MM.AsVariant,dmStratC.cdsChartsDEFAULTDOMAINOFFSET.AsVariant]);
    dmStratC.cdsCharts.Next;
  until dmStratC.cdsCharts.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxStratDBCharts.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBCharts.xlsx';
  frFileNameStr := 'Charts.xlsx';
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

procedure TISFCharts.iwDBgColumns1Click(ASender: TObject; const AValue: string);
begin
  if UserSession.CanModify then
  begin
    UserSession.ParameterChosen := AValue;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFChartEdit.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('Edit rights are required to change these values');
  end;
end;

end.
