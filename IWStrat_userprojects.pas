unit IWStrat_userprojects;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton, UCustomFlexCelReport, UFlexCelReport,
  DB,
  UExcelAdapter, UFlxMemTable, IWStrat_frTopBar, XLSXAdapter;

type
  TISFUserProjects = class(TIWAppForm)
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    Report1: TFlexCelReport;
    FlxMemTable1: TFlxMemTable;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNew: TIWButton;
    iwDBg: TIWDBGrid;
    TopBar: TISFTopBarStrat;
    XLSXAdapter1: TXLSXAdapter;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwDBgColumns1Click(ASender: TObject; const AValue: string);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, IWStrat_uMain, IWStrat_constants, IWStrat_dm;




procedure TISFUserProjects.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStrat.qUserProjects.Close;
  dmStrat.cdsUserProjects.Close;
  dmStrat.qUserProjects.ParamByName('UserID').AsString := UserSession.UserID;
  dmStrat.cdsUserProjects.Open;
end;

procedure TISFUserProjects.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  //iwbAddNew.Visible := (UserSession.IsDeveloper and (dmStrat.cdsUserProjects.State in [dsBrowse]));
  //iwbApplyUpdates.Visible := (UserSession.IsDeveloper and (dmStrat.cdsUserProjects.State in [dsEdit]));
  //iwbCancelUpdates.Visible := (UserSession.IsDeveloper and (dmStrat.cdsUserProjects.State in [dsEdit]));
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmStrat.cdsUserProjects.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmStrat.cdsUserProjects.RecordCount > iwDBg.RowLimit);
end;

procedure TISFUserProjects.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsUserProjects.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFUserProjects.iwlPrevPageClick(Sender: TObject);
begin
  dmStrat.cdsUserProjects.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFUserProjects.iwlNextPageClick(Sender: TObject);
begin
  dmStrat.cdsUserProjects.MoveBy(iwDBg.RowLimit);
end;

procedure TISFUserProjects.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsUserProjects.ApplyUpdates(0);
  except
  end;
end;

procedure TISFUserProjects.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsUserProjects.CancelUpdates;
  except
  end;
end;

procedure TISFUserProjects.iwbCloseClick(Sender: TObject);
begin
  dmStrat.cdsUserProjects.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFUserProjects.iwbDownloadClick(Sender: TObject);
var
  {
  tmpPath : string;
  tmpFileName : string;
  }
  MemStream: TMemoryStream;
begin
  {
  tmpPath := WebApplication.UserCacheDir; // by putting the file in the cache folder, it will
                                         // automatically be deleted when the session terminates
  tmpFileName := 'Approaches.xml';
  try
    dmStrat.cdsUserProjects.SaveToFile(tmpPath+tmpFileName,dfXML);
    WebApplication.SendFile(tmpPath+tmpFileName,true, '', tmpFileName);
  except
  end;
  }
  FlxMemTable1.Open;
  Report1.Template := DefaultFlexCellFolder+'FlxStratDBUserProjects.xls';
  dmStrat.cdsUserProjects.First;
  repeat
    FlxMemTable1.AddRecord([dmStrat.cdsUserProjectsUSERPROJECTID.AsVariant,dmStrat.cdsUserProjectsUSERPROJECTNAME.AsVariant]);
    dmStrat.cdsUserProjects.Next;
  until dmStrat.cdsUserProjects.Eof;
  FlxMemTable1.First;
  MemStream:=TMemoryStream.Create;
  try
    Report1.SavetoStream(MemStream);
    WebApplication.SendStream(MemStream,true,'','User Projects.xls'); //save as an attachment
    MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
  finally
    FreeAndNil(MemStream);
  end; //finally
end;

procedure TISFUserProjects.iwDBgColumns1Click(ASender: TObject; const AValue: string);
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
