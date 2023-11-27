unit IWStrat_defineLIPquery;

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
  TISFDefineLIPQuery = class(TIWAppForm)
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
    iwrLIPs: TIWRegion;
    IWButton8: TIWButton;
    iwlLIPs: TIWListbox;
    iwcbLIPs: TIWCheckBox;
    iwrContOcean: TIWRegion;
    iwlLIPContOceans: TIWListbox;
    iwcbLIPContOceans: TIWCheckBox;
    iwrSizes: TIWRegion;
    iwlLIPSizes: TIWListbox;
    iwcbLIPSizes: TIWCheckBox;
    iwrRatings: TIWRegion;
    iwlLIPRatings: TIWListbox;
    IWButton3: TIWButton;
    iwcbLIPRatings: TIWCheckBox;
    iwrMorphologies: TIWRegion;
    iwlLIPMorphologies: TIWListbox;
    IWButton5: TIWButton;
    iwcbLIPMorphologies: TIWCheckBox;
    iwrDomains: TIWRegion;
    iwlDomains: TIWListbox;
    IWButton7: TIWButton;
    iwcbDomains: TIWCheckBox;
    iwrReferences: TIWRegion;
    IWButton4: TIWButton;
    iwlReferences: TIWListbox;
    iwcbReferences: TIWCheckBox;
    iwrWhoFor: TIWRegion;
    IWButton1: TIWButton;
    iwlWhoFor: TIWListbox;
    iwcbWhoFor: TIWCheckBox;
    iwrValidation: TIWRegion;
    IWButton6: TIWButton;
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

uses IWStrat_dm, ServerController, DB_List_Combo,
  IWStrat_frLIPGrid, IWStrat_uMain, usrIW_dm, IWStrat_dmLIP;

{$R *.dfm}


procedure TISFDefineLIPQuery.IWAppFormCreate(Sender: TObject);
var
  i : integer;
  tempStr : string;
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  iwlblErrorTop.Visible := false;
  iwlblErrorBottom.Visible := false;
  iwcbLIPs.Checked := UserSession.IncludeLIPValues;
  iwcbDomains.Checked := UserSession.IncludeDomainValues;
  iwcbValidation.Checked := UserSession.IncludeDomainValidationValues;
  iwcbLIPSizes.Checked := UserSession.IncludeSizeValues;
  iwcbLIPRatings.Checked := UserSession.IncludeRatingValues;
  iwcbLIPMorphologies.Checked := UserSession.IncludeMorphologyValues;
  iwcbLIPContOceans.Checked := UserSession.IncludeContOceanValues;
  iwcbReferences.Checked := UserSession.IncludeReferenceValues;
  iwcbFromDate.Checked := UserSession.IncludeDateFromValue;
  iwcbToDate.Checked := UserSession.IncludeDateToValue;
  iwcbRestrictParentID.Checked := not UserSession.IncludeAllParentIDs;
  iweFromDate.Text := UserSession.DateFromField;
  iweToDate.Text := UserSession.DateToField;
  iwcbWhoFor.Checked := UserSession.IncludeUsersWhoForValues;
  {Domains}
  dmStrat.qDomains.Close;
  dmStrat.qDomains.SQL.Clear;
  dmStrat.qDomains.SQL.Add('SELECT DISTINCT DOMAINS.DOMAINID, DOMAINS.DOMAINNAME,');
  dmStrat.qDomains.SQL.Add('  DOMAINS.CONTINENTID, DOMAINS.DOMAINPARENTID,');
  dmStrat.qDomains.SQL.Add('  DOMAINS.DOMAINTYPEID, DOMAINS.MAXAGE,');
  dmStrat.qDomains.SQL.Add('  DOMAINS.MINPLOTAGE,DOMAINS.MAXPLOTAGE,');
  dmStrat.qDomains.SQL.Add('  DOMAINS.SPOTLATITUDE,DOMAINS.SPOTLONGITUDE');
  dmStrat.qDomains.SQL.Add('FROM DOMAINS,DOMAINFOR,USERSWHOFOR');
  dmStrat.qDomains.SQL.Add('WHERE USERSWHOFOR.USERID = :UserID');
  dmStrat.qDomains.SQL.Add('AND USERSWHOFOR.WHOFORID = DOMAINFOR.WHOFORID');
  dmStrat.qDomains.SQL.Add('AND DOMAINS.DOMAINID = DOMAINFOR.DOMAINID');
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
  //dmUser.SetDeveloperData(dmStrat.qDomains.SQL.Text);
  dmStrat.qDomains.ParamByName('USERID').AsString := UserSession.UserID;
  dmStrat.cdsDomains.Close;
  try
    if ((UserSession.OrderByValue >= '0') and (UserSession.OrderByValue <= '2')) then iwrgOrderBy.ItemIndex := StrToInt(UserSession.OrderByValue)
    else iwrgOrderBy.ItemIndex := 0;
  except
    WebApplication.ShowMessage('Error in OrderByValue. It is '+UserSession.OrderByValue);
  end;
  {LIPs}
  //dmUser.SetDeveloperData('Before LIP query definition');
  dmLIP.qLIPs.Close;
  dmLIP.cdsLIPs.Close;
  dmLIP.qLIPs.SQL.Clear;
  dmLIP.qLIPs.SQL.Add('SELECT DISTINCT LIPS.LIPID, LIPS.LIPNAME,');
  tempStr := '   LIPS.LIPNAME || '+''''+'   ('+''''+' || LIPS.LIPID || '+''''+') '+''''+' AS LIPNAMELIPID, ';
  dmLIP.qLIPs.SQL.Add(tempStr);
  dmLIP.qLIPs.SQL.Add('LIPS.LIPPARENTID,LIPS.CONTINENTID');
  dmLIP.qLIPs.SQL.Add('FROM LIPS,LIPFOR,USERSWHOFOR');
  dmLIP.qLIPs.SQL.Add('WHERE USERSWHOFOR.USERID = :UserID');
  dmLIP.qLIPs.SQL.Add('AND USERSWHOFOR.WHOFORID = LIPFOR.WHOFORID');
  dmLIP.qLIPs.SQL.Add('AND LIPFOR.LIPID = LIPS.LIPID');

  if (UserSession.IncludeContinentValues and (UserSession.ContinentValues.Count=0)) then
  begin
    UserSession.IncludeContinentValues := false;
  end;
  if (UserSession.IncludeContinentValues) then
  begin
    dmLIP.qLIPs.SQL.Add('AND ( LIPS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
    if (UserSession.ContinentValues.Count >1) then
    begin
      for i := 2 to UserSession.ContinentValues.Count do
      begin
        dmLIP.qLIPs.SQL.Add('OR LIPS.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
      end;
    end;
    dmLIP.qLIPs.SQL.Add(' ) ');
  end;

  dmLIP.qLIPs.SQL.Add('ORDER BY LIPS.LIPNAME');
  //dmUser.SetDeveloperData(dmLIP.qLIPs.SQL.Text);
  //dmUser.SetDeveloperData('After LIP query definition');
  dmLIP.qLIPs.ParamByName('USERID').AsString := UserSession.UserID;
  dmLIP.cdsLIPs.Close;
  {References}
  dmStrat.qReferences.Close;
  dmStrat.qReferences.ParamByName('FIRSTREFERENCE').AsString := 'A';
  dmStrat.qReferences.ParamByName('LASTREFERENCE').AsString := 'zzz';
  {ForList for current user}
  dmLIP.qWhoFor.Close;
  dmLIP.qWhoFor.ParamByName('USERID').AsString := UserSession.UserID;

  iwrLIPs.Visible := UserSession.IncludeLIPValues;
  iwrContOcean.Visible := UserSession.IncludeContOceanValues;
  iwrSizes.Visible := UserSession.IncludeSizeValues;
  iwrRatings.Visible := UserSession.IncludeRatingValues;
  iwrMorphologies.Visible := UserSession.IncludeMorphologyValues;
  iwrDomains.Visible := UserSession.IncludeDomainValues;
  iwrReferences.Visible := UserSession.IncludeReferenceValues;
  iwrWhoFor.Visible := UserSession.IncludeUsersWhoForValues;
  iwrValidation.Visible := UserSession.IncludeValidationValues;
  UserSession.DateFromField := iweFromDate.Text;
  UserSession.DateToField := iweToDate.Text;
  if (Usersession.IncludeLIPValues) then UpdateListBoxValues(iwlLIPs,dmLIP.cdsLIPs,'LIPNameLIPID','LIPID',UserSession.LIPValues);
  if (Usersession.IncludeSizeValues) then UpdateListBoxValues(iwlLIPSizes,dmLIP.cdsLIPSizes,'LIPSizeDescription','LIPSizeID',UserSession.SizeValues);
  if (Usersession.IncludeRatingValues) then UpdateListBoxValues(iwlLIPRatings,dmLIP.cdsLIPRatings,'LIPRatingDescription','LIPRatingID',UserSession.RatingValues);
  if (Usersession.IncludeMorphologyValues) then UpdateListBoxValues(iwlLIPMorphologies,dmLIP.cdsLIPForms,'LIPFormType','LIPFormID',UserSession.MorphologyValues);
  if (Usersession.IncludeContOceanValues) then UpdateListBoxValues(iwlLIPContOceans,dmLIP.cdsContOceans,'ContOcean','ContOceanID',UserSession.ContOceanValues);
  if (Usersession.IncludeValidationValues) then UpdateListBoxValues(iwlValidation,dmStrat.cdsValidationStatus,'ValidationStatus','ValidStatusID',UserSession.ValidationValues);
  if (Usersession.IncludeDomainValues) then UpdateListBoxValues(iwlDomains,dmStrat.cdsDomains,'DomainName','DomainID',UserSession.DomainValues);
  if (Usersession.IncludeReferenceValues) then UpdateListBoxValues(iwlReferences,dmStrat.cdsReferences,'SourceShort','SourceShort',UserSession.ReferenceValues);
  if (Usersession.IncludeUsersWhoForValues) then UpdateListBoxValues(iwlWhoFor,dmLIP.cdsWhoFor,'WhoFor','WhoForID',UserSession.UsersWhoForValues);
end;

procedure TISFDefineLIPQuery.iwbSubmitQueryClick(Sender: TObject);
begin
  UserSession.DataHaveChanged := true;
  UserSession.OrderByValue := IntToStr(iwrgOrderBy.ItemIndex);
  UserSession.IncludeDomainValues := iwcbDomains.Checked;
  UserSession.IncludeLIPValues := iwcbLIPs.Checked;
  UserSession.IncludeSizeValues := iwcbLIPSizes.Checked;
  UserSession.IncludeRatingValues := iwcbLIPRatings.Checked;
  UserSession.IncludeMorphologyValues := iwcbLIPMorphologies.Checked;
  UserSession.IncludeContOceanValues := iwcbLIPContOceans.Checked;
  UserSession.IncludeReferenceValues := iwcbReferences.Checked;
  UserSession.IncludeValidationValues := iwcbValidation.Checked;
  UserSession.IncludeUsersWhoForValues := iwcbWhoFor.Checked;
  UserSession.IncludeAllParentIDs := not iwcbRestrictParentID.Checked;
  UserSession.IncludeDateFromValue := iwcbFromDate.Checked;
  UserSession.IncludeDateToValue := iwcbToDate.Checked;
  UserSession.DateFromField := iweFromDate.Text;
  UserSession.DateToField := iweToDate.Text;
  if (UserSession.IncludeLIPValues) then
    GetListBoxValues(iwlLIPs,dmLIP.cdsLIPs,'LIPNameLIPID','LIPID',UserSession.LIPValues);
  if (UserSession.IncludeSizeValues) then
    GetListBoxValues(iwlLIPSizes,dmLIP.cdsLIPSizes,'LIPSizeDescription','LIPSizeID',UserSession.SizeValues);
  if (UserSession.IncludeRatingValues) then
    GetListBoxValues(iwlLIPRatings,dmLIP.cdsLIPRatings,'LIPRatingDescription','LIPRatingID',UserSession.RatingValues);
  if (UserSession.IncludeMorphologyValues) then
    GetListBoxValues(iwlLIPMorphologies,dmLIP.cdsLIPForms,'LIPFormType','LIPFormID',UserSession.MorphologyValues);
  if (UserSession.IncludeContOceanValues) then
    GetListBoxValues(iwlLIPContOceans,dmLIP.cdsContOceans,'ContOcean','ContOceanID',UserSession.ContOceanValues);
  if (UserSession.IncludeValidationValues) then
    GetListBoxValues(iwlValidation,dmStrat.cdsValidationStatus,'ValidationStatus','ValidStatusID',UserSession.ValidationValues);
  if (UserSession.IncludeDomainValues) then
    GetListBoxValues(iwlDomains,dmStrat.cdsDomains,'DomainName','DomainID',UserSession.DomainValues);
  if (UserSession.IncludeReferenceValues) then
    GetListBoxValues(iwlReferences,dmStrat.cdsReferences,'SourceShort','SourceShort',UserSession.ReferenceValues);
  if (UserSession.IncludeUsersWhoForValues) then
    GetListBoxValues(iwlWhoFor,dmLIP.cdsWhoFor,'WhoFor','WhoForID',UserSession.UsersWhoForValues);
  if ((UserSession.IncludeLIPValues) and (UserSession.LIPValues.Count=0)) then UserSession.IncludeLIPValues := false;
  if ((UserSession.IncludeSizeValues) and (UserSession.SizeValues.Count=0)) then UserSession.IncludeSizeValues := false;
  if ((UserSession.IncludeRatingValues) and (UserSession.RatingValues.Count=0)) then UserSession.IncludeRatingValues := false;
  if ((UserSession.IncludeMorphologyValues) and (UserSession.MorphologyValues.Count=0)) then UserSession.IncludeMorphologyValues := false;
  if ((UserSession.IncludeValidationValues) and (UserSession.ValidationValues.Count=0)) then UserSession.IncludeValidationValues := false;
  if ((UserSession.IncludeDomainValues) and (UserSession.DomainValues.Count=0)) then UserSession.IncludeDomainValues := false;
  if ((UserSession.IncludeReferenceValues) and (UserSession.ReferenceValues.Count=0)) then UserSession.IncludeReferenceValues := false;
  if ((UserSession.IncludeUsersWhoForValues) and (UserSession.UsersWhoForValues.Count=0)) then UserSession.IncludeUsersWhoForValues := false;
  if ((UserSession.IncludeContOceanValues) and (UserSession.ContOceanValues.Count=0)) then UserSession.IncludeContOceanValues := false;
  if ((UserSession.IncludeContinentValues) and (UserSession.ContinentValues.Count=0)) then UserSession.IncludeContinentValues := false;
  if Validate then
  begin
    dmStrat.cdsDomains.Close;
    dmLIP.cdsLIPs.Close;
    dmLIP.SubmitLIPQuery;
    //dmUser.SetDeveloperData(dmLIP.LIPQuery.SQL.Text);
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFLIPGrid.Create(WebApplication).Show
  end;
end;

procedure TISFDefineLIPQuery.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
end;

function TISFDefineLIPQuery.Validate: Boolean;
begin
  Result := true;
  iwlblErrorTop.Visible := false;
  iwlblErrorBottom.Visible := false;
  if (not UserSession.IncludeDomainValues
    and not UserSession.IncludeLIPValues
    and not UserSession.IncludeMorphologyValues
    and not UserSession.IncludeContOceanValues
    and not UserSession.IncludeRatingValues
    and not UserSession.IncludeReferenceValues
    and not UserSession.IncludeUsersWhoForValues
    and not UserSession.IncludeValidationValues
    and not UserSession.IncludeDateFromValue
    and not UserSession.IncludeDateToValue
    and not UserSession.IncludeSizeValues) then Result := false;
  if (Result = false) then
    begin
      iwlblErrorTop.Visible := true;
      iwlblErrorBottom.Visible := true;
      Exit;
    end;
end;

procedure TISFDefineLIPQuery.iwbClearCheckboxesClick(Sender: TObject);
begin
  iwcbLIPs.Checked := false;
  iwcbLIPSizes.Checked := false;
  iwcbLIPRatings.Checked := false;
  iwcbLIPMorphologies.Checked := false;
  iwcbLIPContOceans.Checked := false;
  iwcbReferences.Checked := false;
  iwcbWhoFor.Checked := false;
  iwcbValidation.Checked := false;
  iwcbRestrictParentID.Checked := false;
  iwcbDomains.Checked := false;
  iwcbFromDate.Checked := false;
  iwcbToDate.Checked := false;
end;

procedure TISFDefineLIPQuery.iwbCancelClick(Sender: TObject);
begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    if (UserSession.ThisProgram = 'IGCP509') then TISFMain.Create(WebApplication).Show;
    if (UserSession.ThisProgram = 'StratDB') then TISFMain.Create(WebApplication).Show;
end;

end.
