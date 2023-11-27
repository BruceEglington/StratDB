unit IWStrat_frDepositGrid;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompLabel, IWCompGrids, IWDBGrids, IWDBStdCtrls,
  Forms, IWHTMLControls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompButton,
  IWStrat_frTopBar, jpeg, IWCompExtCtrls,
  IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWRegion, IWCompRectangle, IWStrat_framemenu, IWCompMemo,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWHTML40Container, IWCompListbox;

type
  TISFDepositGrid = class(TIWAppForm)
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
    IWRegion4: TIWRegion;
    iwbDownloadCommodities: TIWButton;
    TopBar: TISFTopBarStrat;
    IWLabel1: TIWLabel;
    iwDBlcbCommodityAssociation: TIWDBLookupComboBox;
    IWLabel2: TIWLabel;
    IWRegion5: TIWRegion;
    iwDBgResults: TIWDBGrid;
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
    procedure iwbDownloadCommoditiesClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, IWStrat_dmD, IWStrat_depositdetails,
  IWStrat_uMain, IWStrat_constants, usrIW_dm, IWStrat_dm;




procedure TISFDepositGrid.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    iwlPageNum.Caption := IntToStr(UserSession.PageNum);
  end;
end;

procedure TISFDepositGrid.IWDBGrid1Columns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.RecordChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  if UserSession.CanModify then
  begin
    TISFDepositDetails.Create(WebApplication).Show;
  end else
  begin
    TISFDepositDetails.Create(WebApplication).Show;
  end;
end;

procedure TISFDepositGrid.IWDBGrid1ColumnsTitleClick(Sender: TObject);
begin
  dmStratD.cdsDepositQuery.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDepositGrid.iwlPrevPageClick(Sender: TObject);
begin
  dmStratD.cdsDepositQuery.MoveBy(-1*iwDBgResults.RowLimit);
  UserSession.PageNum := UserSession.PageNum - 1;
  if (UserSession.PageNum < 1) then UserSession.PageNum := 1;
end;

procedure TISFDepositGrid.iwlNextPageClick(Sender: TObject);
begin
  dmStratD.cdsDepositQuery.MoveBy(iwDBgResults.RowLimit);
  UserSession.PageNum := UserSession.PageNum + 1;
  if (UserSession.PageNum > UserSession.PageNumTotal) then UserSession.PageNum := UserSession.PageNumTotal;
end;

procedure TISFDepositGrid.IWAppFormCreate(Sender: TObject);
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
    //iwbDownloadCommodities.Visible := UserSession.CanModifyPlus;
    if (UserSession.ThisProgram = 'StratDB') then
    begin
      //TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
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
    dmStratD.cdsCommodityAssociations.Close;
    dmStratD.cdsCommodityAssociations.Open;
    iwDBlcbCommodityAssociation.KeyValue := 1;
    //dmUser.SetDeveloperData('TISFDepositGrid.IWAppFormCreate');
    //dmUser.SetDeveloperData(dmStratD.DepositQuery.SQL.Text);
    dmStratD.cdsDepositQuery.Close;
    dmStratD.DepositQuery.Close;
    dmStratD.DepositQuery.ParamByName('UserID').AsString := UserSession.UserID;
    dmStratD.cdsDepositQuery.Open;
    dmStratD.DepositQueryRecordCount;
    //dmUser.SetDeveloperData('NumRecords deposits found = '+IntToStr(UserSession.NumRecordsFound));
    if (UserSession.UserID = 'guest') then
    begin
      nRec := UserSession.NumRecordsFound;
      if (nRec > MaxGuestRecords) then
      begin
        dmStratD.cdsDepositQuery.Last;
        for i := nRec downto MaxGuestRecords+1 do
        begin
          dmStratD.cdsDepositQuery.Delete;
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

procedure TISFDepositGrid.iwlFirstPageClick(Sender: TObject);
begin
  dmStratD.cdsDepositQuery.First;
  UserSession.PageNum := 1;
end;

procedure TISFDepositGrid.iwlLastPageClick(Sender: TObject);
begin
  dmStratD.cdsDepositQuery.Last;
  UserSession.PageNum := UserSession.PageNumTotal;
end;

procedure TISFDepositGrid.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  l,i : integer;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmStratD.qDRep1.Close;
  dmStratD.qDRep1.SQL.Clear;
  dmStratD.qDRep1.SQL.Text := dmStratD.DepositQuery.SQL.Text;
  dmStratD.cdsDRep1.Close;
  dmStratD.qDRep1.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratD.qDRep2.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratD.cdsDRep1.Open;
  dmStratD.cdsDRep1.First;
  //dmUser.SetDeveloperData('qDRep1');
  //dmUser.SetDeveloperData(dmStratD.qDRep1.SQL.Text);
  //dmStratD.FlexCelReportDeposits.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBDeposits.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBDeposits.xlsx';
  frFileNameStr := 'Deposits_selected.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr := TFlexCelReport.Create(true);
    fr.AddTable('cdsDRep1',dmStratD.cdsDRep1);
    fr.AddTable('cdsDRep2',dmStratD.cdsDRep2);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratD.cdsDRep1.Close;
        //dmUser.SetDeveloperData('qDRep1 complete');
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFDepositGrid.iwbDownloadCommoditiesClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
  tempStr : string;
  iCode : integer;
  FromDate, ToDate : double;
  CommodityAssociationID : integer;
  CommodityAssociationIDstr : string;
begin
  CommodityAssociationID := 0;
  CommodityAssociationID := iwDBlcbCommodityAssociation.KeyValue;
  CommodityAssociationIDstr := IntToStr(CommodityAssociationID);
  dmStratD.qDepCommodities.Close;
  dmStratD.qDepCommodities.SQL.Clear;
  dmStratD.qDepCommodities.SQL.Add('select distinct deposits.sdbdepositid, deposits.depositname, deposits.depositparentid,');
  dmStratD.qDepCommodities.SQL.Add('deposits.depositclanid, deposits.deplongitude, deposits.deplatitude,');
  dmStratD.qDepCommodities.SQL.Add('deposits.approxage, deposits.approxageuncertainty, deposits.datingtypeid,');
  dmStratD.qDepCommodities.SQL.Add('deposits.databaseid, deposits.countryid, deposits.geodynamicid,');
  dmStratD.qDepCommodities.SQL.Add('deposits.hostunitid, deposits.approxstratage, deposits.approxstratageuncertainty,');
  dmStratD.qDepCommodities.SQL.Add('deposits.depositstatusid,depositclans.depositclan,depositstati.depositstatus,');
  dmStratD.qDepCommodities.SQL.Add('depositclans.commodityassociationid');
  dmStratD.qDepCommodities.SQL.Add('from deposits,userswhofor,depositfor,depositclans,depositstati');
  if (UserSession.IncludeContinentValues) then
  begin
    dmStratD.qDepCommodities.SQL.Add(',COUNTRIES');
  end;
  if (UserSession.IncludeCommodityValues) then
  begin
    dmStratD.DepositQuery.SQL.Add(' ,DEPOSITCOMMODITIES');
  end;
  if UserSession.IncludeValidationValues then
  begin
    dmStratD.DepositQuery.SQL.Add(',STRATVALID ');
  end;
  dmStratD.qDepCommodities.SQL.Add('where userswhofor.userid = :UserID');
  dmStratD.qDepCommodities.SQL.Add('and userswhofor.whoforid = depositfor.whoforid');
  dmStratD.qDepCommodities.SQL.Add('and depositfor.sdbdepositid = deposits.sdbdepositid');
  dmStratD.qDepCommodities.SQL.Add('and depositclans.depositclanid = deposits.depositclanid');
  dmStratD.qDepCommodities.SQL.Add('and deposits.depositstatusid = depositstati.depositstatusid');
  if UserSession.IncludeValidationValues then
  begin
    dmStratD.DepositQuery.SQL.Add('AND DEPOSITS.SDBDEPOSITID = DEPOSITVALID.SDBDEPOSITID ');
  end;
  if (not UserSession.IncludeAllParentIDs) then
  begin
    dmStratD.qDepCommodities.SQL.Add('AND DEPOSITS.DEPOSITPARENTID = 0');
  end;
  if UserSession.IncludeDateFromValue then
  begin
    Val(UserSession.DateFromField,FromDate,iCode);
    if (iCode = 0) then
    begin
      UserSession.DateFromField := FormatFloat('  ###0.00',FromDate);
    end else
    begin
      UserSession.DateFromField := FormatFloat('  ###0.00',0.0);
    end;
  end;
  if UserSession.IncludeDateToValue then
  begin
    Val(UserSession.DateToField,ToDate,iCode);
    if (iCode = 0) then
    begin
      UserSession.DateToField := FormatFloat('  ###0.00',ToDate);
    end else
    begin
      UserSession.DateToField := FormatFloat('  ###0.00',4500.0);
    end;
  end;
  if UserSession.IncludeDateFromValue then
  begin
    tempStr := 'AND ';
    dmStratD.qDepCommodities.SQL.Add(tempStr);
    tempStr := 'DEPOSITS.APPROXAGE >= '+UserSession.DateFromField;
    dmStratD.qDepCommodities.SQL.Add(tempStr);
  end;
  if UserSession.IncludeDateToValue then
  begin
    tempStr := 'AND ';
    dmStratD.qDepCommodities.SQL.Add(tempStr);
    tempStr := 'DEPOSITS.APPROXAGE <= '+ UserSession.DateToField;
    dmStratD.qDepCommodities.SQL.Add(tempStr);
  end;
  {Continents}
  if (UserSession.IncludeContinentValues) then
  begin
    dmStratD.qDepCommodities.SQL.Add('AND DEPOSITS.COUNTRYID = COUNTRIES.COUNTRYID');
    dmStratD.qDepCommodities.SQL.Add('AND ( COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmStratD.qDepCommodities.SQL.Add('OR COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmStratD.qDepCommodities.SQL.Add(' ) ');
  end;
  {Clans}
  if (UserSession.IncludeClanValues) then
  begin
    dmStratD.qDepCommodities.SQL.Add('AND ( DEPOSITS.DEPOSITCLANID = '+''''+UserSession.ClanValues.Strings[0]+'''');
    if (UserSession.ClanValues.Count >1) then
    begin
      for i := 2 to UserSession.ClanValues.Count do
      begin
        dmStratD.qDepCommodities.SQL.Add('OR DEPOSITS.DEPOSITCLANID = '+''''+UserSession.ClanValues.Strings[i-1]+'''');
      end;
    end;
    dmStratD.qDepCommodities.SQL.Add(' ) ');
  end;
  {Countries}
  if (UserSession.IncludeAreaValues) then
  begin
    dmStratD.qDepCommodities.SQL.Add('AND ( DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[0]+'''');
    if (UserSession.AreaValues.Count >1) then
    begin
      for i := 2 to UserSession.AreaValues.Count do
      begin
        dmStratD.qDepCommodities.SQL.Add('OR DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
      end;
    end;
    dmStratD.qDepCommodities.SQL.Add(' ) ');
  end;
  {Deposits}
  if (UserSession.IncludeDepositValues) then
  begin
    dmStratD.qDepCommodities.SQL.Add('AND ( DEPOSITS.SDBDEPOSITID = '+''''+UserSession.DepositValues.Strings[0]+'''');
    if (UserSession.DepositValues.Count >1) then
    begin
      for i := 2 to UserSession.DepositValues.Count do
      begin
        dmStratD.qDepCommodities.SQL.Add('OR DEPOSITS.SDBDEPOSITID = '+''''+UserSession.DepositValues.Strings[i-1]+'''');
      end;
    end;
    dmStratD.qDepCommodities.SQL.Add(' ) ');
  end;
  {Commodities}
  if (UserSession.IncludeCommodityValues) then
  begin
    dmStratD.qDepCommodities.SQL.Add('AND DEPOSITS.SDBDEPOSITID = DEPOSITCOMMODITIES.SBDEPOSITID ');
    dmStratD.qDepCommodities.SQL.Add('AND ( DEPOSITCOMMODITIES.COMMODITYID = '+''''+UserSession.CommodityValues.Strings[0]+'''');
    if (UserSession.CommodityValues.Count >1) then
    begin
      for i := 2 to UserSession.CommodityValues.Count do
      begin
        dmStratD.qDepCommodities.SQL.Add('OR DEPOSITCOMMODITIES.COMMODITYID = '+''''+UserSession.CommodityValues.Strings[i-1]+'''');
      end;
    end;
    dmStratD.qDepCommodities.SQL.Add(' ) ');
  end;
  {DepositStatus}
  if (UserSession.IncludeDepositStatusValues) then
  begin
    dmStratD.qDepCommodities.SQL.Add('AND ( DEPOSITS.DEPOSITSTATUSID = '+''''+UserSession.DepositStatusValues.Strings[0]+'''');
    if (UserSession.DepositStatusValues.Count >1) then
    begin
      for i := 2 to UserSession.DepositStatusValues.Count do
      begin
        dmStratD.qDepCommodities.SQL.Add('OR DEPOSITS.DEPOSITSTATUSID = '+''''+UserSession.DepositStatusValues.Strings[i-1]+'''');
      end;
    end;
    dmStratD.qDepCommodities.SQL.Add(' ) ');
  end;
  {validation status}
  if (UserSession.IncludeValidationValues) then
  begin
    dmStratD.qDepCommodities.SQL.Add('AND ');
    if ((UserSession.ValidationValues.Count > 1)) then
    begin
      tempStr := ' (';
      dmStratD.qDepCommodities.SQL.Add(tempStr);
    end;
    tempStr := 'DEPOSITVALID.VALIDSTATUSID = '+''''+UserSession.ValidationValues[0]+'''';
    dmStratD.qDepCommodities.SQL.Add(tempStr);
    if (UserSession.ValidationValues.Count > 1) then
    begin
      for i := 2 to UserSession.ValidationValues.Count do
      begin
        dmStratD.qDepCommodities.SQL.Add('OR ');
        tempStr := 'DEPOSITVALID.VALIDSTATUSID = '+''''+UserSession.ValidationValues[i-1]+'''';
        dmStratD.qDepCommodities.SQL.Add(tempStr);
      end;
      dmStratD.qDepCommodities.SQL.Add(') ');
    end;
  end;
  dmStratD.qDepCommodities.SQL.Add('order by deposits.countryid,deposits.depositclanid,deposits.depositname');
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData('qDepCommodities');
    //dmUser.SetDeveloperData(dmStratD.qDepCommodities.SQL.Text);
  end;
  dmStratD.cdsDepCommodities.Close;
  dmStratD.qDepCommodities.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratD.qCom0.Close;
  dmStratD.qCom0.ParamByName('CommodityAssociationID').AsString := CommodityAssociationIDstr;
  dmStratD.qCom1.Close;
  dmStratD.qCom1.ParamByName('CommodityAssociationID').AsString := CommodityAssociationIDstr;
  dmStratD.qCom2.Close;
  dmStratD.qCom2.ParamByName('CommodityAssociationID').AsString := CommodityAssociationIDstr;
  dmStratD.qCom3.Close;
  dmStratD.qCom3.ParamByName('CommodityAssociationID').AsString := CommodityAssociationIDstr;
  dmStratD.qCom4.Close;
  dmStratD.qCom4.ParamByName('CommodityAssociationID').AsString := CommodityAssociationIDstr;
  dmStratD.qCom5.Close;
  dmStratD.qCom5.ParamByName('CommodityAssociationID').AsString := CommodityAssociationIDstr;
  dmStratD.qCom6.Close;
  dmStratD.qCom6.ParamByName('CommodityAssociationID').AsString := CommodityAssociationIDstr;
  dmStratD.qCom7.Close;
  dmStratD.qCom7.ParamByName('CommodityAssociationID').AsString := CommodityAssociationIDstr;
  dmStratD.qCom8.Close;
  dmStratD.qCom8.ParamByName('CommodityAssociationID').AsString := CommodityAssociationIDstr;
  dmStratD.cdsDepCommodities.Open;
  dmStratD.cdsDepCommodities.First;
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxDepCommodities.xlsx';
  frFileNameStr := 'Deposits_commodities.xlsx';
  if (CommodityAssociationID > 0) then
  begin
    //dmStratD.FlexCelReportDepCommodities.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxDepCommodities'+Trim(CommodityAssociationIDstr)+'.xlsx';
    frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxDepCommodities'+Trim(CommodityAssociationIDstr)+'.xlsx';
    frFileNameStr := 'Deposits_commodities'+Trim(CommodityAssociationIDstr)+'.xlsx';
  end;
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsDepCommodities',dmStratD.cdsDepCommodities);
    fr.AddTable('cdsCom0',dmStratD.cdsCom0);
    fr.AddTable('cdsCom1',dmStratD.cdsCom1);
    fr.AddTable('cdsCom2',dmStratD.cdsCom2);
    fr.AddTable('cdsCom3',dmStratD.cdsCom3);
    fr.AddTable('cdsCom4',dmStratD.cdsCom4);
    fr.AddTable('cdsCom5',dmStratD.cdsCom5);
    fr.AddTable('cdsCom6',dmStratD.cdsCom6);
    fr.AddTable('cdsCom7',dmStratD.cdsCom7);
    fr.AddTable('cdsCom8',dmStratD.cdsCom8);
    fr.AddTable('cdsCom9',dmStratD.cdsCom9);
    fr.AddRelationship('cdsDepCommodities','cdsCom0','SDBDEPOSITID','SBDEPOSITID');
    fr.AddRelationship('cdsDepCommodities','cdsCom1','SDBDEPOSITID','SBDEPOSITID');
    fr.AddRelationship('cdsDepCommodities','cdsCom2','SDBDEPOSITID','SBDEPOSITID');
    fr.AddRelationship('cdsDepCommodities','cdsCom3','SDBDEPOSITID','SBDEPOSITID');
    fr.AddRelationship('cdsDepCommodities','cdsCom4','SDBDEPOSITID','SBDEPOSITID');
    fr.AddRelationship('cdsDepCommodities','cdsCom5','SDBDEPOSITID','SBDEPOSITID');
    fr.AddRelationship('cdsDepCommodities','cdsCom6','SDBDEPOSITID','SBDEPOSITID');
    fr.AddRelationship('cdsDepCommodities','cdsCom7','SDBDEPOSITID','SBDEPOSITID');
    fr.AddRelationship('cdsDepCommodities','cdsCom8','SDBDEPOSITID','SBDEPOSITID');
    fr.AddRelationship('cdsDepCommodities','cdsCom9','SDBDEPOSITID','SBDEPOSITID');
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        //dmStratD.FlexCelReportDepCommodities.SavetoStream(MemStream);
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratD.cdsDepCommodities.Close;
        //dmUser.SetDeveloperData('qDepCommodities complete');
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

end.

