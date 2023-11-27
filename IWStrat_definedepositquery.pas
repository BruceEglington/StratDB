unit IWStrat_definedepositquery;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, IWCompEdit, IWCompExtCtrls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompRectangle, 
  IWStrat_frTopBar, IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  IWRegion, IWHTML40Container;

type
  TISFDefineDepositQuery = class(TIWAppForm)
    rectLeft: TIWRectangle;
    IWRegion1: TIWRegion;
    iwrTopButtons: TIWRegion;
    iwcbFromDate: TIWCheckBox;
    iweFromDate: TIWEdit;
    iwcbToDate: TIWCheckBox;
    iweToDate: TIWEdit;
    iwlblErrorTop: TIWLabel;
    IWText1: TIWText;
    iwcbRestrictParentID: TIWCheckBox;
    iwbCancel: TIWButton;
    iwbClearCheckboxes: TIWButton;
    iwbSubmitQuery: TIWButton;
    iwrDeposits: TIWRegion;
    IWButton8: TIWButton;
    iwlDeposits: TIWListbox;
    iwcbDeposits: TIWCheckBox;
    iwrDepositClans: TIWRegion;
    iwlDepositClans: TIWListbox;
    IWButton2: TIWButton;
    iwcbDepositClans: TIWCheckBox;
    iwrDepositStatus: TIWRegion;
    IWButton3: TIWButton;
    iwlDepositStatus: TIWListbox;
    iwcbDepositStatus: TIWCheckBox;
    iwrCommodities: TIWRegion;
    IWButton4: TIWButton;
    iwlCommodities: TIWListbox;
    iwcbCommodities: TIWCheckBox;
    iwrValidation: TIWRegion;
    IWButton1: TIWButton;
    iwlValidation: TIWListbox;
    iwcbValidation: TIWCheckBox;
    iwrOrderBy: TIWRegion;
    iwlblErrorBottom: TIWLabel;
    iwbSubmitQuery2: TIWButton;
    iwrgOrderBy: TIWRadioGroup;
    IWLabel4: TIWLabel;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbClearCheckboxesClick(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
  end;

implementation

uses ServerController, DB_List_Combo,
  IWStrat_uMain, usrIW_dm, IWStrat_frDepositGrid, IWStrat_dmD, IWStrat_dm;

{$R *.dfm}


procedure TISFDefineDepositQuery.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  //UserSession.IncludeAreaValues := false;
  //dmStratD.ConstructUnitAreaQuery;
  iwlblErrorTop.Visible := false;
  iwlblErrorBottom.Visible := false;
  iwcbDepositClans.Checked := UserSession.IncludeClanValues;
  iwcbCommodities.Checked := UserSession.IncludeCommodityValues;
  iwcbDeposits.Checked := UserSession.IncludeDepositValues;
  iwcbRestrictParentID.Checked := not UserSession.IncludeAllParentIDs;
  iwcbFromDate.Checked := UserSession.IncludeDateFromValue;
  iwcbToDate.Checked := UserSession.IncludeDateToValue;
  iweFromDate.Text := UserSession.DateFromField;
  iweToDate.Text := UserSession.DateToField;
  iwcbDepositStatus.Checked := UserSession.IncludeDepositStatusValues;
  iwcbValidation.Checked := UserSession.IncludeValidationValues;
  if (UserSession.IncludeAreaValues and (UserSession.AreaValues.Count=0)) then
  begin
    UserSession.IncludeAreaValues := false;
  end;
  dmStratD.qDeposits.Close;
  dmStratD.qDeposits.SQL.Clear;
  dmStratD.qDeposits.SQL.Add('SELECT * FROM DEPOSITS, COUNTRIES ');
  dmStratD.qDeposits.SQL.Add('WHERE DEPOSITS.COUNTRYID = COUNTRIES.COUNTRYID ');
  {Continents}
  if (UserSession.IncludeContinentValues) then
  begin
    dmStratD.qDeposits.SQL.Add('AND ( COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmStratD.qDeposits.SQL.Add('OR COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmStratD.qDeposits.SQL.Add(' ) ');
  end;
  {Countries}
  if (UserSession.IncludeAreaValues) then
  begin
    dmStratD.qDeposits.SQL.Add('AND ( DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[0]+'''');
    if (UserSession.AreaValues.Count >1) then
    begin
      for i := 2 to UserSession.AreaValues.Count do
      begin
        dmStratD.qDeposits.SQL.Add('OR DEPOSITS.COUNTRYID = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
      end;
    end;
    dmStratD.qDeposits.SQL.Add(' ) ');
  end;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratD.qDeposits.SQL.Text);
  end;
  dmStratD.cdsDeposits.Close;
  try
    if ((UserSession.OrderByValue >= '0') and (UserSession.OrderByValue <= '3')) then iwrgOrderBy.ItemIndex := StrToInt(UserSession.OrderByValue)
    else iwrgOrderBy.ItemIndex := 0;
  except
    WebApplication.ShowMessage('Error in OrderByValue. It is '+UserSession.OrderByValue);
  end;
  iwrDeposits.Visible := UserSession.IncludeDepositValues;
  iwrDepositClans.Visible := UserSession.IncludeClanValues;
  iwrDepositStatus.Visible := UserSession.IncludeDepositStatusValues;
  iwrCommodities.Visible := UserSession.IncludeCommodityValues;
  iwrValidation.Visible := UserSession.IncludeDomainValidationValues;
  if (Usersession.IncludeClanValues) then UpdateListBoxValues(iwlDepositClans,dmStratD.cdsClans,'DepositClan','DepositClanID',UserSession.ClanValues);
  if (Usersession.IncludeCommodityValues) then UpdateListBoxValues(iwlCommodities,dmStratD.cdsCommodities,'Commodity','CommodityID',UserSession.CommodityValues);
  if (Usersession.IncludeDepositValues) then UpdateListBoxValues(iwlDeposits,dmStratD.cdsDeposits,'DepositName','SDBDepositID',UserSession.DepositValues);
  if (Usersession.IncludeDepositStatusValues) then UpdateListBoxValues(iwlDepositStatus,dmStratD.cdsDepositStatus,'DepositStatus','DepositStatusID',UserSession.DepositStatusValues);
  if (Usersession.IncludeValidationValues) then UpdateListBoxValues(iwlValidation,dmStrat.cdsValidationStatus,'ValidationStatus','ValidStatusID',UserSession.ValidationValues);
end;

procedure TISFDefineDepositQuery.iwbSubmitQueryClick(Sender: TObject);
begin
  UserSession.DataHaveChanged := true;
  UserSession.OrderByValue := IntToStr(iwrgOrderBy.ItemIndex);
  UserSession.IncludeDepositValues := iwcbDeposits.Checked;
  UserSession.IncludeClanValues := iwcbDepositClans.Checked;
  UserSession.IncludeCommodityValues := iwcbCommodities.Checked;
  UserSession.IncludeAllParentIDs := not iwcbRestrictParentID.Checked;
  UserSession.IncludeDateFromValue := iwcbFromDate.Checked;
  UserSession.IncludeDateToValue := iwcbToDate.Checked;
  UserSession.DateFromField := iweFromDate.Text;
  UserSession.DateToField := iweToDate.Text;
  UserSession.IncludeDepositStatusValues := iwcbDepositStatus.Checked;
  UserSession.IncludeValidationValues := iwcbValidation.Checked;
  if (UserSession.IncludeClanValues) then
    GetListBoxValues(iwlDepositClans,dmStratD.cdsClans,'DepositClan','DepositClanID',UserSession.ClanValues);
  if (UserSession.IncludeCommodityValues) then
    GetListBoxValues(iwlCommodities,dmStratD.cdsCommodities,'Commodity','CommodityID',UserSession.CommodityValues);
  if (UserSession.IncludeDepositValues) then
    GetListBoxValues(iwlDeposits,dmStratD.cdsDeposits,'DepositName','SDBDepositID',UserSession.DepositValues);
  if (UserSession.IncludeDepositStatusValues) then
    GetListBoxValues(iwlDepositStatus,dmStratD.cdsDepositStatus,'DepositStatus','DepositStatusID',UserSession.DepositStatusValues);
  if (UserSession.IncludeValidationValues) then
    GetListBoxValues(iwlValidation,dmStrat.cdsValidationStatus,'ValidationStatus','ValidStatusID',UserSession.ValidationValues);
  if ((UserSession.IncludeAreaValues) and (UserSession.AreaValues.Count=0)) then UserSession.IncludeAreaValues := false;
  if ((UserSession.IncludeDepositValues) and (UserSession.DepositValues.Count=0)) then UserSession.IncludeDepositValues := false;
  if ((UserSession.IncludeClanValues) and (UserSession.ClanValues.Count=0)) then UserSession.IncludeClanValues := false;
  if ((UserSession.IncludeCommodityValues) and (UserSession.CommodityValues.Count=0)) then UserSession.IncludeCommodityValues := false;
  if ((UserSession.IncludeValidationValues) and (UserSession.ValidationValues.Count=0)) then UserSession.IncludeValidationValues := false;
  if ((UserSession.IncludeDepositStatusValues) and (UserSession.DepositStatusValues.Count=0)) then UserSession.IncludeDepositStatusValues := false;
  if Validate then
  begin
    dmStratD.cdsCommodities.Close;
    dmStratD.cdsDeposits.Close;
    dmStratD.SubmitDepositQuery;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDepositGrid.Create(WebApplication).Show
  end;
end;

procedure TISFDefineDepositQuery.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
end;

function TISFDefineDepositQuery.Validate: Boolean;
begin
  Result := true;
  iwlblErrorTop.Visible := false;
  iwlblErrorBottom.Visible := false;
  if (not UserSession.IncludeDepositValues
    and not UserSession.IncludeClanValues
    and not UserSession.IncludeDepositStatusValues
    and not UserSession.IncludeValidationValues
    and not UserSession.IncludeDateFromValue
    and not UserSession.IncludeDateToValue
    and not UserSession.IncludeCommodityValues) then Result := false;
  if (Result = false) then
    begin
      iwlblErrorTop.Visible := true;
      iwlblErrorBottom.Visible := true;
      Exit;
    end;
end;

procedure TISFDefineDepositQuery.iwbClearCheckboxesClick(Sender: TObject);
begin
  iwcbDepositClans.Checked := false;
  iwcbCommodities.Checked := false;
  iwcbDeposits.Checked := false;
  iwcbRestrictParentID.Checked := false;
  iwcbFromDate.Checked := false;
  iwcbToDate.Checked := false;
  iwcbDepositStatus.Checked := false;
  iwcbValidation.Checked := false;
end;

procedure TISFDefineDepositQuery.iwbCancelClick(Sender: TObject);
begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if (UserSession.ThisProgram = 'IGCP509') then TISFMain.Create(WebApplication).Show;
    if (UserSession.ThisProgram = 'StratDB') then TISFMain.Create(WebApplication).Show;
end;

end.
