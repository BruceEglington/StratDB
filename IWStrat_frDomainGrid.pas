unit IWStrat_frDomainGrid;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompLabel, IWCompGrids, IWDBGrids, IWDBStdCtrls,
  Forms, IWHTMLControls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompButton,
  IWStrat_frTopBar, jpeg, IWCompExtCtrls,
  IWVCLBaseContainer, IWContainer,DBClient,
  IWHTMLContainer, IWRegion, IWCompRectangle, IWStrat_framemenu,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWHTML40Container;

type
  TISFDomainGrid = class(TIWAppForm)
    iwDBgResults: TIWDBGrid;
    rectRight: TIWRectangle;
    IWRectangle1: TIWRectangle;
    IWRegion1: TIWRegion;
    FrameMenu: TISFFrameMenu;
    IWRegion2: TIWRegion;
    IWRegion3: TIWRegion;
    iwbDownload: TIWButton;
    iwlFirstPage: TIWLink;
    iwlLastPage: TIWLink;
    iwlNextPage: TIWLink;
    iwlPrevPage: TIWLink;
    iwlPageNumTotal: TIWLabel;
    iwlSortedBy: TIWLabel;
    iwlPageNum: TIWLabel;
    lblRecordCount: TIWLabel;
    iwlOf: TIWLabel;
    TopBar: TISFTopBarStrat;
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
    procedure iwlMainPageClick(Sender: TObject);
    procedure iwlOptionsClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_dm, IWStrat_domaindetails,
  IWStrat_uMain, IWStrat_constants, usrIW_dm;




procedure TISFDomainGrid.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    iwlPageNum.Caption := IntToStr(UserSession.PageNum);
  end;
end;

procedure TISFDomainGrid.IWDBGrid1Columns0Click(ASender: TObject;
  const AValue: String);
var
  tmpUser : string;
begin
  tmpUser := UserSession.UserID;
  UserSession.RecordChosen := AValue;
  dmStrat.qDomainQ.Close;
  dmStrat.qDomainQ.ParamByName('DOMAINID').AsString := UserSession.RecordChosen;
  dmStrat.qDomainQ.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qDomainParent.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qSubDomains.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qDomainUnits.ParamByName('USERID').AsString := tmpUser;
  dmStrat.cdsDomainQ.Close;
  dmStrat.cdsDomainQ.Open;
  UserSession.UnitSender := 'DomainGrid';
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  if UserSession.CanModify then
  begin
    TISFDomainDetails.Create(WebApplication).Show;
  end else
  begin
    TISFDomainDetails.Create(WebApplication).Show;
  end;
end;

procedure TISFDomainGrid.IWDBGrid1ColumnsTitleClick(Sender: TObject);
begin
  dmStrat.cdsDomainQuery.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDomainGrid.iwlPrevPageClick(Sender: TObject);
begin
  dmStrat.cdsDomainQuery.MoveBy(-1*iwDBgResults.RowLimit);
  UserSession.PageNum := UserSession.PageNum - 1;
  if (UserSession.PageNum < 1) then UserSession.PageNum := 1;
end;

procedure TISFDomainGrid.iwlNextPageClick(Sender: TObject);
begin
  dmStrat.cdsDomainQuery.MoveBy(iwDBgResults.RowLimit);
  UserSession.PageNum := UserSession.PageNum + 1;
  if (UserSession.PageNum > UserSession.PageNumTotal) then UserSession.PageNum := UserSession.PageNumTotal;
end;

procedure TISFDomainGrid.IWAppFormCreate(Sender: TObject);
var
  i, nRec : integer;
begin
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
      //TopBar.lblProgTitle.Text := 'StratDB Database';
      TopBar.lblProgTitle.Text := UserSession.ThisProgramName;
      FrameMenu.IWImageIGCP509.Visible := false;
      FrameMenu.IWImageStratDB.Visible := true;
    end;
    if (UserSession.ThisProgram = 'IGCP509') then
    begin
      TopBar.lblProgTitle.Text := 'IGCP509 Database';
      FrameMenu.IWImageIGCP509.Visible := true;
      FrameMenu.IWImageStratDB.Visible := false;
    end;
    dmStrat.DomainQuery.Close;
    dmStrat.cdsDomainQuery.Close;
    dmStrat.cdsDomainQuery.Open;
    dmStrat.DomainQueryRecordCount;
    if (UserSession.UserID = 'guest') then
    begin
      nRec := UserSession.NumRecordsFound;
      if (nRec > MaxGuestRecords) then
      begin
        dmStrat.cdsDomainQuery.Last;
        for i := nRec downto MaxGuestRecords+1 do
        begin
          dmStrat.cdsDomainQuery.Delete;
        end;
      end;
    end;
    iwlPrevPage.Visible := (UserSession.NumRecordsFound > iwDBgResults.RowLimit);
    iwlNextPage.Visible := (UserSession.NumRecordsFound > iwDBgResults.RowLimit);
    iwlFirstPage.Visible := (UserSession.NumRecordsFound > iwDBgResults.RowLimit);
    iwlLastPage.Visible := (UserSession.NumRecordsFound > iwDBgResults.RowLimit);
    UserSession.PageNum := 1;
    UserSession.PageNumTotal := UserSession.NumRecordsFound div iwDBgResults.RowLimit;
    if ((UserSession.NumRecordsFound mod iwDBgResults.RowLimit) <> 0) then UserSession.PageNumTotal := UserSession.PageNumTotal +1;
    iwlPageNum.Caption := IntToStr(UserSession.PageNum);
    iwlPageNumTotal.Caption := IntToStr(UserSession.PageNumTotal);
    lblRecordCount.Text := IntToStr(UserSession.NumRecordsFound)+' records match the query specified';
    if (UserSession.UserID = 'guest') then lblRecordCount.Text := lblRecordCount.Text + ' (guest is limited to 10 records)';
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

procedure TISFDomainGrid.iwlFirstPageClick(Sender: TObject);
begin
  dmStrat.cdsDomainQuery.First;
  UserSession.PageNum := 1;
end;

procedure TISFDomainGrid.iwlLastPageClick(Sender: TObject);
begin
  dmStrat.cdsDomainQuery.Last;
  UserSession.PageNum := UserSession.PageNumTotal;
end;

procedure TISFDomainGrid.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
  tmpUser : string;
begin
  tmpUser := UserSession.UserID;
  dmStrat.qDRep1.Close;
  dmStrat.qDRep1.SQL.Clear;
  dmStrat.qDRep1.SQL.Text := dmStrat.DomainQuery.SQL.Text;
  dmStrat.qDRep1.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qDRep2.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qDRep3.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qDRep4.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qDRep5.ParamByName('USERID').AsString := tmpUser;
  dmStrat.cdsDRep1.Close;
  dmStrat.cdsDRep1.Open;
  dmStrat.cdsDRep1.First;
  //dmStrat.FlexCelReport1.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxDomains.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxDomains.xlsx';
  frFileNameStr := 'Domains_selected.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsDRep1',dmStrat.cdsDRep1);
    fr.AddTable('cdsDRep2',dmStrat.cdsDRep2);
    fr.AddTable('cdsDRep3',dmStrat.cdsDRep3);
    fr.AddTable('cdsDRep4',dmStrat.cdsDRep4);
    fr.AddTable('cdsDRep5',dmStrat.cdsDRep5);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        //dmStrat.FlexCelReport1.SavetoStream(MemStream);
        //WebApplication.SendStream(MemStream,true,'','Domains_selected.xlsx'); //save as an attachment
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStrat.cdsDRep1.Close;
        //dmUser.SetDeveloperData('qDRep1 complete');
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFDomainGrid.iwlMainPageClick(Sender: TObject);
begin
  iwlMainPageClick(Sender);
end;

procedure TISFDomainGrid.iwlOptionsClick(Sender: TObject);
begin
  iwlOptionsClick(Sender);
end;

end.
