unit IWStrat_continents3;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, Vcl.Controls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompRectangle,
  IWCompButton, IWCompGrids, IWDBGrids, IWCompLabel, IWHTMLControls,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWDBStdCtrls, IWCompEdit, Vcl.Forms, IWStrat_frTopBar, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, DbxDevartInterBase, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr;

type
  TISFContinents = class(TIWAppForm)
    rectLeft: TIWRectangle;
    iwbClose: TIWButton;
    iwbDownload: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNew: TIWButton;
    iwlNextPage: TIWLink;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwDBg: TIWDBGrid;
    IWDBEdit1: TIWDBEdit;
    IWDBEdit2: TIWDBEdit;
    IWDBNavigator1: TIWDBNavigator;
    FDMemTable1: TFDMemTable;
    FDMemTable1ContinentID: TStringField;
    FDMemTable1Continent: TStringField;
    TopBar: TISFTopBarStrat;
    IWButton1: TIWButton;
    sqlcStrat: TSQLConnection;
    SQLMonitor1: TSQLMonitor;
    qContinents: TSQLQuery;
    dspContinents: TDataSetProvider;
    cdsContinents: TClientDataSet;
    dsContinents: TDataSource;
    cdsContinentsCONTINENTID: TWideStringField;
    cdsContinentsCONTINENT: TWideStringField;
    cdsContinentsLANGUAGEID: TWideStringField;
    cdsContinentsHASDATA: TWideStringField;
    cdsContinentsDEFAULTDOMAINID: TIntegerField;
    IWButton2: TIWButton;
    IWButton3: TIWButton;
    //procedure iwbAddNewClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWButton1Click(Sender: TObject);
    procedure IWButton2Click(Sender: TObject);
    procedure IWButton3Click(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_uMain, IWStrat_constants, IWStrat_dm;



procedure TISFContinents.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  TopBar.lblWelcome.Caption := 'Create ' + UserSession.UserDisplayName;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    dmStrat.cdsContinents.Close;
    dmStrat.qContinents.Close;
    dmStrat.sqlcStrat.Connected := false;
    iwDBg.DataSource := dmStrat.dsContinents;
    iwDBnavigator1.DataSource := dmStrat.dsContinents;
    iwDBedit1.DataSource := dmStrat.dsContinents;
    iwDBedit2.DataSource := dmStrat.dsContinents;
    dmStrat.sqlcStrat.Connected := true;
    dmStrat.cdsContinents.Open;
  end;
end;

procedure TISFContinents.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  TopBar.lblWelcome.Caption := 'Render ' + UserSession.UserDisplayName;
  //iwbAddNew.Visible := (UserSession.IsDeveloper and (dmStrat.cdsContinents.State in [dsBrowse]));
  //iwbApplyUpdates.Visible := (UserSession.IsDeveloper and (dmStrat.cdsContinents.State in [dsEdit]));
  //iwbCancelUpdates.Visible := (UserSession.IsDeveloper and (dmStrat.cdsContinents.State in [dsEdit]));
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
    iwlPrevPage.Visible := (dmStrat.cdsContinents.RecordCount > iwDBg.RowLimit);
    iwlNextPage.Visible := (dmStrat.cdsContinents.RecordCount > iwDBg.RowLimit);
end;

{
procedure TISFContinents.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsContinents.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;
}

procedure TISFContinents.iwlPrevPageClick(Sender: TObject);
begin
  dmStrat.cdsContinents.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFContinents.iwlNextPageClick(Sender: TObject);
begin
  dmStrat.cdsContinents.MoveBy(iwDBg.RowLimit);
end;

procedure TISFContinents.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsContinents.ApplyUpdates(0);
  except
  end;
end;

procedure TISFContinents.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsContinents.CancelUpdates;
  except
  end;
end;

procedure TISFContinents.iwbCloseClick(Sender: TObject);
begin
  cdsContinents.Close;
  dmStrat.cdsContinents.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFContinents.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  dmStrat.cdsContinents.First;
  repeat
    FDMemTable1.InsertRecord([dmStrat.cdsContinentsCONTINENTID.AsVariant,dmStrat.cdsContinentsCONTINENT.AsVariant]);
    dmStrat.cdsContinents.Next;
  until dmStrat.cdsContinents.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxStratDBContinents.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBContinents.xlsx';
  frFileNameStr := 'Continents.xlsx';
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

procedure TISFContinents.IWButton1Click(Sender: TObject);
begin
  iwDBg.DataSource := dsContinents;
  iwDBnavigator1.DataSource := dsContinents;
  iwDBedit1.DataSource := dsContinents;
  iwDBedit2.DataSource := dsContinents;
  WebApplication.ShowMessage('datasources changed to this form');
  sqlcStrat.Connected := true;
  cdsContinents.Close;
  iwdbg.Visible := true;
  cdsContinents.Open;
  cdsContinents.First;
  //WebApplication.ShowMessage(IntToStr(cdsContinents.RecordCount));
end;

procedure TISFContinents.IWButton2Click(Sender: TObject);
begin
  {
  cdsContinents.Close;
  WebApplication.ShowMessage('cdsContinents closed');
  iwDBg.DataSource := nil;
  iwDBnavigator1.DataSource := nil;
  iwDBedit1.DataSource := nil;
  iwDBedit2.DataSource := nil;
  sqlcStrat.Connected := false;
  WebApplication.ShowMessage('datasource nil');
  }
  iwDBg.DataSource := dmStrat.dsContinents;
  iwDBnavigator1.DataSource := dmStrat.dsContinents;
  iwDBedit1.DataSource := dmStrat.dsContinents;
  iwDBedit2.DataSource := dmStrat.dsContinents;
  dmStrat.sqlcStrat.Connected := false;
  WebApplication.ShowMessage('datasources changed to datamodule');
  dmStrat.sqlcStrat.Connected := true;
  WebApplication.ShowMessage('sqlcStrat connected');
  dmStrat.cdsContinents.Close;
  WebApplication.ShowMessage('cdsContinents closed');
  dmStrat.qContinents.Close;
  WebApplication.ShowMessage('qContinents closed');
  dmStrat.cdsContinents.Open;
  WebApplication.ShowMessage('cdsContinents opened');
end;

procedure TISFContinents.IWButton3Click(Sender: TObject);
begin
  cdsContinents.Close;
  WebApplication.ShowMessage('cdsContinents closed');
  iwDBg.DataSource := nil;
  iwDBnavigator1.DataSource := nil;
  iwDBedit1.DataSource := nil;
  iwDBedit2.DataSource := nil;
  sqlcStrat.Connected := false;
  WebApplication.ShowMessage('datasource nil');
end;

 {
procedure TISFContinents.iwDBgColumns1Click(ASender: TObject; const AValue: string);
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
}

end.
