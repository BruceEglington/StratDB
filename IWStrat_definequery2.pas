unit IWStrat_definequery2;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, IWCompEdit, IWCompExtCtrls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompRectangle, 
  IWStrat_frTopBar, IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  IWRegion, IWCompGrids, IWDBGrids, IWHTML40Container;

type
  TISFDefineQuery2 = class(TIWAppForm)
    IWRegion2: TIWRegion;
    rectLeft: TIWRectangle;
    IWRegion3: TIWRegion;
    iwrTopButtons: TIWRegion;
    iwbCancel: TIWButton;
    iwbClearCheckboxes: TIWButton;
    iwbSubmitQuery: TIWButton;
    iwrAgeRange: TIWRegion;
    iweToSort: TIWEdit;
    iwcbToSort: TIWCheckBox;
    iweFromSort: TIWEdit;
    iwcbFromSort: TIWCheckBox;
    iweToDate: TIWEdit;
    iwcbToDate: TIWCheckBox;
    iweFromDate: TIWEdit;
    iwcbFromDate: TIWCheckBox;
    iwcbRestrictParentID: TIWCheckBox;
    IWText1: TIWText;
    iwlblErrorTop: TIWLabel;
    iwrUnits: TIWRegion;
    iwlUnits: TIWListbox;
    iwcbUnits: TIWCheckBox;
    IWButton8: TIWButton;
    iwrDomains: TIWRegion;
    IWButton3: TIWButton;
    iwlDomains: TIWListbox;
    iwcbDomains: TIWCheckBox;
    iwrReferences: TIWRegion;
    IWButton4: TIWButton;
    iwlReferences: TIWListbox;
    iwcbReferences: TIWCheckBox;
    iwrPeriods: TIWRegion;
    IWButton2: TIWButton;
    iwlPeriods: TIWListbox;
    iwcbPeriods: TIWCheckBox;
    iwrAgeConstraints: TIWRegion;
    IWButton5: TIWButton;
    iwlAgeConstraints: TIWListbox;
    iwcbAgeConstraints: TIWCheckBox;
    iwrWhoFor: TIWRegion;
    IWButton7: TIWButton;
    iwlWhoFor: TIWListbox;
    iwcbWhoFor: TIWCheckBox;
    iwrInc4Cht: TIWRegion;
    IWButton6: TIWButton;
    iwcbInc4Cht: TIWCheckBox;
    iwlInc4Cht: TIWListbox;
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
    procedure IWButton9Click(Sender: TObject);
  public
  protected
    function Validate : Boolean ;
  end;

implementation

uses IWStrat_dm, ServerController, DB_List_Combo,
  IWStrat_frGrid, IWStrat_uMain, usrIW_dm, IWStrat_constants,
  IWStrat_frGridGrainProbabilityUnits, IWStrat_GrainSources;

{$R *.dfm}


procedure TISFDefineQuery2.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  {
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  }
  iwlblErrorTop.Visible := false;
  iwlblErrorBottom.Visible := false;
  iwcbUnits.Checked := UserSession.IncludeUnitValues;
  iwcbReferences.Checked := UserSession.IncludeReferenceValues;
  iwcbWhoFor.Checked := UserSession.IncludeUsersWhoForValues;
  iwcbValidation.Checked := UserSession.IncludeValidationValues;
  iwcbRestrictParentID.Checked := not UserSession.IncludeAllParentIDs;
  iwcbFromDate.Checked := UserSession.IncludeDateFromValue;
  iwcbToDate.Checked := UserSession.IncludeDateToValue;
  iweFromDate.Text := UserSession.DateFromField;
  iweToDate.Text := UserSession.DateToField;
  iwcbFromSort.Checked := UserSession.IncludeSortFromValue;
  iwcbToSort.Checked := UserSession.IncludeSortToValue;
  iweFromSort.Text := UserSession.SortFromField;
  iweToSort.Text := UserSession.SortToField;
  iwcbDomains.Checked := UserSession.IncludeDomainValues;
  iwcbPeriods.Checked := UserSession.IncludePeriodValues;
  iwcbAgeConstraints.Checked := UserSession.IncludeAgeConstraintValues;
  iwcbInc4Cht.Checked := UserSession.IncludeInc4ChtValues;
  {Units}
  //dmUser.SetDeveloperData('DefineQuery2 - 01');
  dmStrat.ConstructUnitAreaQuery;
  dmStrat.qUnits.Close;
  dmStrat.cdsUnits.Close;
  dmStrat.qUnits.ParamByName('USERID').AsString := UserSession.UserID;
  {References}
  //dmUser.SetDeveloperData('DefineQuery2 - 02');
  dmStrat.qReferences.Close;
  dmStrat.qReferences.ParamByName('FIRSTREFERENCE').AsString := 'A';
  dmStrat.qReferences.ParamByName('LASTREFERENCE').AsString := 'zzz';
  {ForList for current user}
  //dmUser.SetDeveloperData('DefineQuery2 - 03');
  dmStrat.qWhoFor.Close;
  dmStrat.qWhoFor.ParamByName('USERID').AsString := UserSession.UserID;
  {Domains}
  //dmUser.SetDeveloperData('DefineQuery2 - 04');
  dmStrat.qDomains.Close;
  dmStrat.qDomains.SQL.Clear;
  dmStrat.qDomains.SQL.Add('SELECT DISTINCT DOMAINS.DOMAINID, DOMAINS.DOMAINNAME,');
  dmStrat.qDomains.SQL.Add('   DOMAINS.CONTINENTID, DOMAINS.DOMAINPARENTID,');
  dmStrat.qDomains.SQL.Add('   DOMAINS.DOMAINTYPEID, DOMAINS.MAXAGE,');
  dmStrat.qDomains.SQL.Add('   DOMAINS.MINPLOTAGE,DOMAINS.MAXPLOTAGE,');
  dmStrat.qDomains.SQL.Add('   DOMAINS.SPOTLATITUDE,DOMAINS.SPOTLONGITUDE');
  dmStrat.qDomains.SQL.Add('FROM DOMAINS,DOMAINFOR,USERSWHOFOR');
  dmStrat.qDomains.SQL.Add('WHERE USERSWHOFOR.USERID = :UserID');
  dmStrat.qDomains.SQL.Add('AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID');
  dmStrat.qDomains.SQL.Add('AND DOMAINS.DOMAINID=DOMAINFOR.DOMAINID');
  if (UserSession.IncludeContinentValues and (UserSession.ContinentValues.Count=0)) then
  begin
    UserSession.IncludeContinentValues := false;
  end;
  if (UserSession.IncludeContinentValues) then
  begin
    dmStrat.qDomains.SQL.Add('AND ( DOMAINS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmStrat.qDomains.SQL.Add('OR DOMAINS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmStrat.qDomains.SQL.Add(' ) ');
  end;
  dmStrat.qDomains.SQL.Add('ORDER BY DOMAINS.DOMAINNAME');
  dmStrat.qDomains.ParamByName('UserID').AsString := UserSession.UserID;
  dmStrat.cdsDomains.Close;
  try
    if ((UserSession.OrderByValue >= '0') and (UserSession.OrderByValue <= '2')) then iwrgOrderBy.ItemIndex := StrToInt(UserSession.OrderByValue)
    else iwrgOrderBy.ItemIndex := 0;
  except
    WebApplication.ShowMessage('Error in OrderByValue. It is '+UserSession.OrderByValue);
  end;
  iwrUnits.Visible := UserSession.IncludeUnitValues;
  iwrDomains.Visible := UserSession.IncludeDomainValues;
  iwrReferences.Visible := UserSession.IncludeReferenceValues;
  iwrPeriods.Visible := UserSession.IncludePeriodValues;
  iwrAgeConstraints.Visible := UserSession.IncludeAgeConstraintValues;
  iwrWhoFor.Visible := UserSession.IncludeUsersWhoForValues;
  iwrInc4Cht.Visible := UserSession.IncludeInc4ChtValues;
  iwrValidation.Visible := UserSession.IncludeValidationValues;
  //dmUser.SetDeveloperData('DefineQuery2 before UpdateListBoxValues');
  if (Usersession.IncludeUnitValues) then UpdateListBoxValues(iwlUnits,dmStrat.cdsUnits,'UnitNameUnitID','UnitID',UserSession.UnitValues);
  //dmUser.SetDeveloperData('DefineQuery2 before UpdateListBoxValues 02');
  if (Usersession.IncludeReferenceValues) then UpdateListBoxValues(iwlReferences,dmStrat.cdsReferences,'SourceShort','SourceShort',UserSession.ReferenceValues);
  if (Usersession.IncludeUsersWhoForValues) then UpdateListBoxValues(iwlWhoFor,dmStrat.cdsUsersWhoFor,'WhoFor','WhoForID',UserSession.UsersWhoForValues);
  if (Usersession.IncludeValidationValues) then UpdateListBoxValues(iwlValidation,dmStrat.cdsValidationStatus,'ValidationStatus','ValidStatusID',UserSession.ValidationValues);
  if (Usersession.IncludeDomainValues) then UpdateListBoxValues(iwlDomains,dmStrat.cdsDomains,'DomainName','DomainID',UserSession.DomainValues);
  if (Usersession.IncludePeriodValues) then UpdateListBoxValues(iwlPeriods,dmStrat.cdsPeriods,'PeriodName','PeriodID',UserSession.PeriodValues);
  if (Usersession.IncludeAgeConstraintValues) then UpdateListBoxValues(iwlAgeConstraints,dmStrat.cdsAgeConstraints,'AgeConstraintLevel','AgeConstraintLevelID',UserSession.AgeConstraintValues);
  if (Usersession.IncludeInc4ChtValues) then UpdateListBoxValues(iwlInc4Cht,dmStrat.cdsYesNo,'YesNo','YesNoID',UserSession.Inc4ChtValues);
  //dmUser.SetDeveloperData('DefineQuery2 after UpdateListBoxValues');
end;

procedure TISFDefineQuery2.iwbSubmitQueryClick(Sender: TObject);
begin
  UserSession.DataHaveChanged := true;
  UserSession.OrderByValue := IntToStr(iwrgOrderBy.ItemIndex);
  UserSession.IncludeUnitValues := iwcbUnits.Checked;
  UserSession.IncludeReferenceValues := iwcbReferences.Checked;
  UserSession.IncludeUsersWhoForValues := iwcbWhoFor.Checked;
  UserSession.IncludeValidationValues := iwcbValidation.Checked;
  UserSession.IncludePeriodValues := iwcbPeriods.Checked;
  UserSession.IncludeAgeConstraintValues := iwcbAgeConstraints.Checked;
  UserSession.IncludeInc4ChtValues := iwcbInc4Cht.Checked;
  UserSession.IncludeAllParentIDs := not iwcbRestrictParentID.Checked;
  //dmUser.SetDeveloperData('DefineQuery2 before GetListBoxValues');
  if (UserSession.IncludeUnitValues) then
    GetListBoxValues(iwlUnits,dmStrat.cdsUnits,'UnitNameUnitID','UnitID',UserSession.UnitValues);
  if (UserSession.IncludeReferenceValues) then
    GetListBoxValues(iwlReferences,dmStrat.cdsReferences,'SourceShort','SourceShort',UserSession.ReferenceValues);
  if (UserSession.IncludeUsersWhoForValues) then
    GetListBoxValues(iwlWhoFor,dmStrat.cdsUsersWhoFor,'WhoFor','WhoForID',UserSession.UsersWhoForValues);
  if (UserSession.IncludeValidationValues) then
    GetListBoxValues(iwlValidation,dmStrat.cdsValidationStatus,'ValidationStatus','ValidStatusID',UserSession.ValidationValues);
  if (UserSession.IncludeDomainValues) then
    GetListBoxValues(iwlDomains,dmStrat.cdsDomains,'DomainName','DomainID',UserSession.DomainValues);
  if (UserSession.IncludePeriodValues) then
    GetListBoxValues(iwlPeriods,dmStrat.cdsPeriods,'PeriodName','PeriodID',UserSession.PeriodValues);
  if (UserSession.IncludeAgeConstraintValues) then
    GetListBoxValues(iwlAgeConstraints,dmStrat.cdsAgeConstraints,'AgeConstraintLevel','AgeConstraintLevelID',UserSession.AgeConstraintValues);
  if (UserSession.IncludeInc4ChtValues) then
    GetListBoxValues(iwlInc4Cht,dmStrat.cdsYesNo,'YesNo','YesNoID',UserSession.Inc4ChtValues);
  //dmUser.SetDeveloperData('DefineQuery2 after GetListBoxValues');
  UserSession.IncludeDateFromValue := iwcbFromDate.Checked;
  UserSession.IncludeDateToValue := iwcbToDate.Checked;
  UserSession.DateFromField := iweFromDate.Text;
  UserSession.DateToField := iweToDate.Text;
  UserSession.IncludeDomainValues := iwcbDomains.Checked;
  UserSession.IncludeSortFromValue := iwcbFromSort.Checked;
  UserSession.IncludeSortToValue := iwcbToSort.Checked;
  UserSession.SortFromField := iweFromSort.Text;
  UserSession.SortToField := iweToSort.Text;
  if ((UserSession.IncludeContinentValues) and (UserSession.ContinentValues.Count=0)) then UserSession.IncludeContinentValues := false;
  if ((UserSession.IncludeAreaValues) and (UserSession.AreaValues.Count=0)) then UserSession.IncludeAreaValues := false;
  if ((UserSession.IncludeUnitValues) and (UserSession.UnitValues.Count=0)) then UserSession.IncludeUnitValues := false;
  if ((UserSession.IncludeReferenceValues) and (UserSession.ReferenceValues.Count=0)) then UserSession.IncludeReferenceValues := false;
  if ((UserSession.IncludeUsersWhoForValues) and (UserSession.UsersWhoForValues.Count=0)) then UserSession.IncludeUsersWhoForValues := false;
  if ((UserSession.IncludeValidationValues) and (UserSession.ValidationValues.Count=0)) then UserSession.IncludeValidationValues := false;
  if ((UserSession.IncludeDomainValues) and (UserSession.DomainValues.Count=0)) then UserSession.IncludeDomainValues := false;
  if ((UserSession.IncludePeriodValues) and (UserSession.PeriodValues.Count=0)) then UserSession.IncludePeriodValues := false;
  if ((UserSession.IncludeAgeConstraintValues) and (UserSession.AgeConstraintValues.Count=0)) then UserSession.IncludeAgeConstraintValues := false;
  if ((UserSession.IncludeInc4ChtValues) and (UserSession.Inc4ChtValues.Count=0)) then UserSession.IncludeInc4ChtValues := false;
  if ((UserSession.IncludeInc4ChtValues) and (not UserSession.IncludeDomainValues)) then UserSession.IncludeInc4ChtValues := false;
  if Validate then
  begin
    //dmUser.SetDeveloperData('Before SubmitQuery1');
    dmStrat.SubmitQuery1;
    //dmUser.SetDeveloperData('After SubmitQuery1');
    //dmUser.SetDeveloperData('UserSession.UnitSender = '+UserSession.UnitSender);
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if ((UserSession.UnitSender=usDetailsEdit)
      or (UserSession.UnitSender=usDetails)) then
    begin
      TISFGrid.Create(WebApplication).Show;
    end;
    //TIWForm1.Create(WebApplication).Show
    if ((UserSession.UnitSender=usGrainProbabilitiesDetritalUPb)) then
    begin
      //dmUser.SetDeveloperData('before TISFGridGrainProbabilityUnits.Create');
      TISFGridGrainProbabilityUnits.Create(WebApplication).Show;
    end;
    if ((UserSession.UnitSender=usGrainSourcesDetritalUPb)) then
    begin
      TISFGrainSources.Create(WebApplication).Show;
    end;
  end;
end;

procedure TISFDefineQuery2.IWButton9Click(Sender: TObject);
begin
  dmStrat.cdsUnits.Open;
end;

procedure TISFDefineQuery2.IWAppFormRender(Sender: TObject);
begin
  {
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  }
end;

function TISFDefineQuery2.Validate: Boolean;
begin
  Result := true;
  iwlblErrorTop.Visible := false;
  iwlblErrorBottom.Visible := false;
  if (not UserSession.IncludeUnitValues
    and not UserSession.IncludeReferenceValues
    and not UserSession.IncludeUsersWhoForValues
    and not UserSession.IncludeValidationValues
    and not UserSession.IncludeSortFromValue
    and not UserSession.IncludeSortToValue
    and not UserSession.IncludeDomainValues
    and not UserSession.IncludePeriodValues
    and not UserSession.IncludeAgeConstraintValues
    and not UserSession.IncludeDateFromValue
    and not UserSession.IncludeDateToValue) then Result := false;
  if (Result = false) then
    begin
      iwlblErrorTop.Visible := true;
      iwlblErrorBottom.Visible := true;
      Exit;
    end;
end;

procedure TISFDefineQuery2.iwbClearCheckboxesClick(Sender: TObject);
begin
  iwcbUnits.Checked := false;
  iwcbFromDate.Checked := false;
  iwcbToDate.Checked := false;
  iwcbReferences.Checked := false;
  iwcbWhoFor.Checked := false;
  iwcbValidation.Checked := false;
  iwcbRestrictParentID.Checked := false;
  iwcbFromSort.Checked := false;
  iwcbToSort.Checked := false;
  iwcbDomains.Checked := false;
  iwcbPeriods.Checked := false;
  iwcbAgeConstraints.Checked := false;
  iwcbInc4Cht.Checked := false;
end;

procedure TISFDefineQuery2.iwbCancelClick(Sender: TObject);
begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if (UserSession.ThisProgram = 'IGCP509') then TISFMain.Create(WebApplication).Show;
    if (UserSession.ThisProgram = 'StratDB') then TISFMain.Create(WebApplication).Show;
end;

end.
