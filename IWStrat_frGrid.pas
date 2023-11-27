unit IWStrat_frGrid;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompLabel, IWCompGrids, IWDBGrids, IWDBStdCtrls,
  Forms, IWHTMLControls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompButton,
  IWStrat_frTopBar, jpeg, IWCompExtCtrls,
  IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWRegion, IWCompRectangle, IWStrat_framemenu,
  IWHTML40Container, FMTBcd, WideStrings, DB, SqlExpr,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  DBClient, Provider;

type
  TISFGrid = class(TIWAppForm)
    lblRecordCount: TIWLabel;
    iwDBgResults: TIWDBGrid;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwlSortedBy: TIWLabel;
    iwlPageNum: TIWLabel;
    iwlOf: TIWLabel;
    iwlPageNumTotal: TIWLabel;
    iwlFirstPage: TIWLink;
    iwlLastPage: TIWLink;
    iwbDownload: TIWButton;
    IWRegion2: TIWRegion;
    IWRegion3: TIWRegion;
    TopBar: TISFTopBarStrat;
    IWRegion1: TIWRegion;
    FrameMenu: TISFFrameMenu;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0Click(ASender: TObject;
      const AValue: String);
    procedure IWDBGrid1ColumnsTitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwlFirstPageClick(Sender: TObject);
    procedure iwlLastPageClick(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
    procedure iwlDefineQueryClick(Sender: TObject);
    procedure iwlNewRecordClick(Sender: TObject);
    procedure iwlReferencesClick(Sender: TObject);
    procedure iwlUnitsClick(Sender: TObject);
    procedure iwlMainPageClick(Sender: TObject);
    procedure iwlOptionsClick(Sender: TObject);
    procedure iwlOtherLookupsClick(Sender: TObject);
    procedure LeftTreeiwlDefineQueryClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_dm, IWStrat_details,
  IWStrat_uMain, IWStrat_constants, usrIW_dm;




procedure TISFGrid.IWAppFormRender(Sender: TObject);
begin
  iwlPageNum.Caption := IntToStr(UserSession.PageNum);
end;

procedure TISFGrid.IWDBGrid1Columns0Click(ASender: TObject;
  const AValue: String);
var
  tmpUser : string;
begin
  UserSession.RecordChosen := AValue;
  tmpUser := UserSession.UserID;
  //WebApplication.ShowMessage(AValue);
  dmStrat.qUnitQ.Close;
  dmStrat.cdsUnitQ.Close;
  dmStrat.qUnitQ.ParamByName('UNITID').AsString := UserSession.RecordChosen;
  dmStrat.qUnitQ.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qParent.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qSubUnits.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qSucceeding.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qPreceeding.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qSynonyms.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qCorrelatives.ParamByName('USERID').AsString := tmpUser;
  dmStrat.cdsUnitQ.Open;
  UserSession.UnitSender := usDetails;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  if UserSession.CanModify then
  begin
    TISFDetails.Create(WebApplication).Show;
  end else
  begin
    TISFDetails.Create(WebApplication).Show;
  end;
end;

procedure TISFGrid.IWDBGrid1ColumnsTitleClick(Sender: TObject);
begin
  dmStrat.cdsQuery1.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFGrid.iwlPrevPageClick(Sender: TObject);
begin
  dmStrat.cdsQuery1.MoveBy(-1*iwDBgResults.RowLimit);
  UserSession.PageNum := UserSession.PageNum - 1;
  if (UserSession.PageNum < 1) then UserSession.PageNum := 1;
end;

procedure TISFGrid.iwlNextPageClick(Sender: TObject);
begin
  dmStrat.cdsQuery1.MoveBy(iwDBgResults.RowLimit);
  UserSession.PageNum := UserSession.PageNum + 1;
  if (UserSession.PageNum > UserSession.PageNumTotal) then UserSession.PageNum := UserSession.PageNumTotal;
end;

procedure TISFGrid.IWAppFormCreate(Sender: TObject);
var
  i, nRec : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := UserSession.UserDisplayName;
    iwlPageNum.Caption := IntToStr(UserSession.PageNum);
  end;
  iwlPrevPage.Visible := false;
  iwlNextPage.Visible := false;
  iwlFirstPage.Visible := false;
  iwlLastPage.Visible := false;
  UserSession.PageNum := 1;
  UserSession.PageNumTotal := 1;
  if UserSession.LoggedIn then
  begin
    //iwbDownload.Visible := UserSession.CanModifyPlus;
    //iwbDownload.Visible := UserSession.IsDeveloper;
    {
    dmUser.qThisProgram.Close;
    dmUser.qThisProgram.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsThisProgram.Close;
    dmUser.cdsThisProgram.Open;
    }
    if (UserSession.ThisProgram = 'StratDB') then
    begin
      //TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
      //TopBar.lblProgTitle.Text := dmUser.cdsThisProgramSOFTWARENAME.AsString;
      TopBar.lblProgTitle.Text := UserSession.ThisProgramName;
      FrameMenu.IWImageIGCP509.Visible := false;
      FrameMenu.IWImageStratDB.Visible := true;
    end;
    if (UserSession.ThisProgram = 'IGCP509') then
    begin
      TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
      FrameMenu.IWImageIGCP509.Visible := true;
      FrameMenu.IWImageStratDB.Visible := false;
    end;
    dmStrat.Query1.Close;
    dmStrat.cdsQuery1.Close;
    dmStrat.Query1.ParamByName('USERID').AsString := UserSession.UserID;
    dmStrat.cdsQuery1.Open;
    UserSession.NumRecordsFound := 0;
    dmStrat.Query1RecordCount;
    {
    if (UserSession.UserID = 'guest') then
    begin
      nRec := UserSession.NumRecordsFound;
      if (nRec > MaxGuestRecords) then
      begin
        dmStrat.cdsQuery1.Last;
        for i := nRec downto MaxGuestRecords+1 do
        begin
          dmStrat.cdsQuery1.Delete;
        end;
      end;
    end;
    }
    iwlPrevPage.Visible := (UserSession.NumRecordsFound > iwDBgResults.RowLimit);
    iwlNextPage.Visible := (UserSession.NumRecordsFound > iwDBgResults.RowLimit);
    iwlFirstPage.Visible := (UserSession.NumRecordsFound > iwDBgResults.RowLimit);
    iwlLastPage.Visible := (UserSession.NumRecordsFound > iwDBgResults.RowLimit);
    UserSession.PageNum := 1;
    UserSession.PageNumTotal := UserSession.NumRecordsFound div iwDBgResults.RowLimit;
    if ((UserSession.NumRecordsFound mod iwDBgResults.RowLimit) <> 0) then UserSession.PageNumTotal := UserSession.PageNumTotal +1;
    iwlPageNum.Caption := IntToStr(UserSession.PageNum);
    iwlPageNumTotal.Caption := IntToStr(UserSession.PageNumTotal);
    lblRecordCount.Text := IntToStr(UserSession.NumRecordsFound)+' matching records found';
    //if (UserSession.UserID = 'guest') then lblRecordCount.Text := lblRecordCount.Text + ' (guest is limited to 10 records)';
  end;
  FrameMenu.New1.Visible := false;
  FrameMenu.NewDeposit1.Enabled := false;
  if UserSession.CanInsert then
  begin
    FrameMenu.New1.Visible := true;
    FrameMenu.New1.Enabled := true;
    FrameMenu.NewUnit1.Enabled := true;
    FrameMenu.NewDomain1.Enabled := true;
    FrameMenu.NewLargeIgneousProvince1.Enabled := true;
    FrameMenu.NewDeposit1.Enabled := false;
  end
  else begin
    FrameMenu.New1.Visible := false;
    FrameMenu.New1.Enabled := false;
  end;
  FrameMenu.SelectGraph1.Visible := UserSession.IsDeveloper;
end;

procedure TISFGrid.iwlFirstPageClick(Sender: TObject);
begin
  dmStrat.cdsQuery1.First;
  UserSession.PageNum := 1;
end;

procedure TISFGrid.iwlLastPageClick(Sender: TObject);
begin
  dmStrat.cdsQuery1.Last;
  UserSession.PageNum := UserSession.PageNumTotal;
end;

procedure TISFGrid.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
  tmpUser : string;
begin
  tmpUser := UserSession.UserID;
  dmStrat.qRep1.Close;
  dmStrat.qRep1.SQL.Clear;
  dmStrat.qRep1.SQL.Text := dmStrat.Query1.SQL.Text;
  dmStrat.qRep1.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qRep2.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qRep3.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qRep4.ParamByName('USERID').AsString := tmpUser;
  dmStrat.cdsRep1.Close;
  dmStrat.cdsRep1.Open;
  dmStrat.cdsRep1.First;
  //dmUser.SetDeveloperData(dmStrat.qRep1.SQL.Text);
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratUnits.xlsx';
  frFileNameStr := 'Strat_Units.xlsx';
  //dmStrat.FlexCelReport1.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratUnits.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsRep1',dmStrat.cdsRep1);
    fr.AddTable('cdsRep2',dmStrat.cdsRep2);
    fr.AddTable('cdsRep3',dmStrat.cdsRep3);
    fr.AddTable('cdsRep4',dmStrat.cdsRep4);
    fr.SetValue('CurrentDate',Now);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStrat.cdsRep1.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFGrid.iwlDefineQueryClick(Sender: TObject);
begin
  //iwlDefineQueryClick(Sender);
end;

procedure TISFGrid.iwlNewRecordClick(Sender: TObject);
begin
  //iwlNewRecordClick(Sender);
end;

procedure TISFGrid.iwlReferencesClick(Sender: TObject);
begin
  //iwlReferencesClick(Sender);
end;

procedure TISFGrid.iwlUnitsClick(Sender: TObject);
begin
  //iwlUnitsClick(Sender);
end;

procedure TISFGrid.iwlMainPageClick(Sender: TObject);
begin
  //iwlMainPageClick(Sender);
end;

procedure TISFGrid.iwlOptionsClick(Sender: TObject);
begin
  //iwlOptionsClick(Sender);
end;

procedure TISFGrid.iwlOtherLookupsClick(Sender: TObject);
begin
  //iwlOtherLookupsClick(Sender);
end;

procedure TISFGrid.LeftTreeiwlDefineQueryClick(Sender: TObject);
begin
  //LeftTree.iwlDefineQueryClick(Sender);

end;

end.
