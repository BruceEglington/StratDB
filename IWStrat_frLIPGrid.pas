unit IWStrat_frLIPGrid;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompLabel, IWCompGrids, IWDBGrids, IWDBStdCtrls,
  Forms, IWHTMLControls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompButton,
  IWStrat_frTopBar, jpeg, IWCompExtCtrls,
  IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWRegion, IWCompRectangle, IWStrat_framemenu,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWHTML40Container, IWCompMemo;

type
  TISFLIPGrid = class(TIWAppForm)
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
    iwbCalcBarcodeAges: TIWButton;
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
    procedure iwbCalcBarcodeAgesClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, 
  IWStrat_uMain, IWStrat_constants, usrIW_dm, IWStrat_dmLIP, IWStrat_LIPdetails,
  IWStrat_dmDV;




procedure TISFLIPGrid.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    iwlPageNum.Caption := IntToStr(UserSession.PageNum);
  end;
end;

procedure TISFLIPGrid.IWDBGrid1Columns0Click(ASender: TObject;
  const AValue: String);
var
  tmpUser : string;
begin
  UserSession.RecordChosen := AValue;
  tmpUser := UserSession.UserID;
  UserSession.UnitSender := usLIPs;
  dmLIP.qLIPQ.Close;
  dmLIP.qLIPQ.ParamByName('LIPID').AsString := UserSession.RecordChosen;
  dmLIP.qLIPQ.ParamByName('USERID').AsString := tmpUser;
  dmLIP.qLIPParent.ParamByName('USERID').AsString := tmpUser;
  dmLIP.qSubLIPs.ParamByName('USERID').AsString := tmpUser;
  dmLIP.qLIPUnits.ParamByName('USERID').AsString := tmpUser;
  dmLIP.qLIPCorrelative.ParamByName('USERID').AsString := tmpUser;
  dmLIP.cdsLIPQ.Close;
  dmLIP.cdsLIPQ.Open;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  if UserSession.CanModify then
  begin
    TISFLIPDetails.Create(WebApplication).Show;
  end else
  begin
    TISFLIPDetails.Create(WebApplication).Show;
  end;
end;

procedure TISFLIPGrid.IWDBGrid1ColumnsTitleClick(Sender: TObject);
begin
  dmLIP.cdsLIPQuery.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFLIPGrid.iwlPrevPageClick(Sender: TObject);
begin
  dmLIP.cdsLIPQuery.MoveBy(-1*iwDBgResults.RowLimit);
  UserSession.PageNum := UserSession.PageNum - 1;
  if (UserSession.PageNum < 1) then UserSession.PageNum := 1;
end;

procedure TISFLIPGrid.iwlNextPageClick(Sender: TObject);
begin
  dmLIP.cdsLIPQuery.MoveBy(iwDBgResults.RowLimit);
  UserSession.PageNum := UserSession.PageNum + 1;
  if (UserSession.PageNum > UserSession.PageNumTotal) then UserSession.PageNum := UserSession.PageNumTotal;
end;

procedure TISFLIPGrid.IWAppFormCreate(Sender: TObject);
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
    UserSession.UnitSender := usLIPs;
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
    dmLIP.LIPQuery.Close;
    dmLIP.cdsLIPQuery.Close;
    dmLIP.cdsLIPQuery.Open;
    dmLIP.LIPQueryRecordCount;
    if (UserSession.UserID = 'guest') then
    begin
      nRec := UserSession.NumRecordsFound;
      if (nRec > MaxGuestRecords) then
      begin
        dmLIP.cdsLIPQuery.Last;
        for i := nRec downto MaxGuestRecords+1 do
        begin
          dmLIP.cdsLIPQuery.Delete;
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
  iwbCalcBarcodeAges.Visible := UserSession.IsDeveloper;
end;

procedure TISFLIPGrid.iwlFirstPageClick(Sender: TObject);
begin
  dmLIP.cdsLIPQuery.First;
  UserSession.PageNum := 1;
end;

procedure TISFLIPGrid.iwlLastPageClick(Sender: TObject);
begin
  dmLIP.cdsLIPQuery.Last;
  UserSession.PageNum := UserSession.PageNumTotal;
end;

procedure TISFLIPGrid.iwbCalcBarcodeAgesClick(Sender: TObject);
var
  tBarcodeAge : double;
  i, iRec : integer;
  tmpLIPID : integer;
  tmpUser : string;
begin
  dmLIP.cdsLIPQuery.First;
  repeat
    if (dmLIP.cdsLIPQueryBARCODEAGE.AsFloat > 3800.0) then
    begin
      dmDV.cdsQueryDV.Close;
      tmpLIPID := dmLIP.cdsLIPQueryLIPID.AsInteger;
      dmDV.DefineDVQuery(tmpLIPID);
      dmDV.QueryDV.ParamByName('LIPID').AsString := dmLIP.cdsLIPQueryLIPID.AsString;
      dmDV.QueryDV.ParamByName('USERID').AsString := UserSession.UserID;
      dmDV.cdsQueryDV.Close;
      dmDV.cdsQueryDV.Open;
      dmDV.qDVUser.Close;
      dmDV.qDVUser.ParamByName('UserID').AsString := UserSession.UserID;
      dmDV.cdsDVUser.Close;
      dmDV.cdsDVUser.Open;
      tBarCodeAge := dmDV.CalculateDVMedian;
      if (tBarCodeAge <> dmLIP.cdsLIPQueryBARCODEAGE.AsFloat)  then
      begin
        try
        dmLIP.cdsLIPQuery.Edit;
        dmLIP.cdsLIPQueryBARCODEAGE.AsFloat := tBarCodeAge;
        dmLIP.cdsLIPQuery.Post;
        dmLIP.cdsLIPQuery.ApplyUpdates(0);
        except
          WebApplication.ShowMessage('Not able to update Barcode Age for LIP ' + dmLIP.cdsLIPQueryLIPID.AsString);
        end;
      end;
    end;
    dmLIP.cdsLIPQuery.Next;
  until dmLIP.cdsLIPQuery.Eof;
end;

procedure TISFLIPGrid.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
  tmpUser : string;
begin
  tmpUser := UserSession.UserID;
  dmLIP.ConstructLIPReportQuery;
  dmLIP.qRep1.ParamByName('USERID').AsString := tmpUser;
  dmLIP.qRep2.ParamByName('USERID').AsString := tmpUser;
  dmLIP.qRep3.ParamByName('USERID').AsString := tmpUser;
  dmLIP.qRep4.ParamByName('USERID').AsString := tmpUser;
  //dmUser.SetDeveloperData(dmLIP.qRep1.SQL.Text);
  dmLIP.cdsRep1.Close;
  dmLIP.cdsRep1.Open;
  dmLIP.cdsRep1.First;
  //dmLIP.FlexCelReport1.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxLIPQueryResults.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxLIPQueryResults.xlsx';
  frFileNameStr := 'LIPs_selected.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    //fr.SetValue('Current_Date',Now);
    fr.AddTable('cdsRep1',dmLIP.cdsRep1);
    fr.AddTable('cdsRep2',dmLIP.cdsRep2);
    fr.AddTable('cdsRep3',dmLIP.cdsRep3);
    fr.AddTable('cdsRep4',dmLIP.cdsRep4);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.SetValue('Current_Date',Now);
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmLIP.cdsRep1.Close;
        dmLIP.cdsRep2.Close;
        dmLIP.cdsRep3.Close;
        dmLIP.cdsRep4.Close;
      end;
    finally
      InStream.Free
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFLIPGrid.iwlMainPageClick(Sender: TObject);
begin
  iwlMainPageClick(Sender);
end;

procedure TISFLIPGrid.iwlOptionsClick(Sender: TObject);
begin
  iwlOptionsClick(Sender);
end;

end.
