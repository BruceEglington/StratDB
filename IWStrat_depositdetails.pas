unit IWStrat_depositdetails;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWCompButton, IWCompLabel, IWBaseControl,
  IWControl, IWCompEdit, IWDBStdCtrls, IWCompGrids, IWDBGrids, IWCompMemo,
  IWCompListbox, IWVCLBaseControl,
  DB, IWBaseHTMLControl, IWCompRectangle, IWCompCheckbox,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWRegion,
  IWStrat_frTopBar, IWHTML40Container;

type
  TISFDepositDetails = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    IWLabel1: TIWLabel;
    iwbReturn: TIWButton;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel11: TIWLabel;
    IWDBEdit11: TIWDBEdit;
    iwbDetailsEdit: TIWButton;
    IWDBEdit3: TIWDBEdit;
    iwbReturn2: TIWButton;
    iwbDetailsEdit2: TIWButton;
    IWLabel66: TIWLabel;
    IWLabel67: TIWLabel;
    rectLeft: TIWRectangle;
    IWLabel5: TIWLabel;
    IWLabel6: TIWLabel;
    IWDBEdit5: TIWDBEdit;
    IWRegion1: TIWRegion;
    iwrTopButtons: TIWRegion;
    iwrDepositDetails: TIWRegion;
    iwrCommodities: TIWRegion;
    IWLabel19: TIWLabel;
    iwDBgCommodities: TIWDBGrid;
    iwDBnCommodities: TIWDBNavigator;
    iwbApplyUpdates: TIWButton;
    iwrClientAll: TIWRegion;
    iwrBottomButtons: TIWRegion;
    iwlCommoditiesSortedBy: TIWLabel;
    iwrDomain: TIWRegion;
    IWLabel25: TIWLabel;
    iwDBgDomain: TIWDBGrid;
    iwDBnDomains: TIWDBNavigator;
    iwlDomainsSortedBy: TIWLabel;
    iwbDeleteDomainLink: TIWButton;
    IWLabel26: TIWLabel;
    iwDBlcbClan: TIWDBLookupComboBox;
    iwbCancelUpdates: TIWButton;
    IWLabel28: TIWLabel;
    iwDBlcbOtherDatabase: TIWDBLookupComboBox;
    iwlDatesAvailable: TIWLabel;
    IWLabel30: TIWLabel;
    iwDBeMinDVAge: TIWDBEdit;
    IWLabel31: TIWLabel;
    iwDBeMaxDVAge: TIWDBEdit;
    IWLabel32: TIWLabel;
    iwbAddCommodityLink: TIWButton;
    iwbAddDomainLink: TIWButton;
    iwbDeleteCommodityLink: TIWButton;
    IWLabel4: TIWLabel;
    iwDBlcbCountry: TIWDBLookupComboBox;
    IWLabel7: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    IWLabel8: TIWLabel;
    IWDBEdit4: TIWDBEdit;
    IWLabel9: TIWLabel;
    IWDBEdit6: TIWDBEdit;
    IWLabel10: TIWLabel;
    IWDBEdit7: TIWDBEdit;
    IWLabel12: TIWLabel;
    iwDBlcbHostUnit: TIWDBLookupComboBox;
    IWLabel13: TIWLabel;
    IWDBEdit8: TIWDBEdit;
    IWLabel14: TIWLabel;
    IWDBEdit9: TIWDBEdit;
    IWLabel15: TIWLabel;
    iwrWhoFor: TIWRegion;
    IWLabel37: TIWLabel;
    iwDBgLinkToWhoFor: TIWDBGrid;
    iwDBnLinkToWhoFor: TIWDBNavigator;
    iwbDeleteLinkToWhoFor: TIWButton;
    iwbAddWhoFor: TIWButton;
    iwbPublish: TIWButton;
    IWLabel16: TIWLabel;
    iwDBlcbDatingType: TIWDBLookupComboBox;
    IWLabel17: TIWLabel;
    IWDBLookupComboBox2: TIWDBLookupComboBox;
    IWLabel18: TIWLabel;
    iwDBlcbGeodynamicSetting: TIWDBLookupComboBox;
    IWLabel20: TIWLabel;
    IWDBEdit10: TIWDBEdit;
    iwrSubDeposits: TIWRegion;
    IWLabel21: TIWLabel;
    IWDBGrid1: TIWDBGrid;
    IWDBNavigator1: TIWDBNavigator;
    IWLabel22: TIWLabel;
    iwbAddSubDeposit: TIWButton;
    iwbDeleteSubDeposit: TIWButton;
    iwrDateView: TIWRegion;
    IWLabel23: TIWLabel;
    iwDBgDateView: TIWDBGrid;
    iwlDVSortedBy: TIWLabel;
    iwrValidation: TIWRegion;
    IWLabel24: TIWLabel;
    iwDBgValidation: TIWDBGrid;
    iwbObjection: TIWButton;
    iwbValidate: TIWButton;
    iwbClearObjection: TIWButton;
    IWLabel27: TIWLabel;
    iwDBlcbDepositStatus: TIWDBLookupComboBox;
    IWLabel29: TIWLabel;
    iwDBmComments: TIWDBMemo;
    iwrReferences: TIWRegion;
    IWLabel33: TIWLabel;
    iwDBgReference: TIWDBGrid;
    iwDBnReferences: TIWDBNavigator;
    iwbDeleteRefLink: TIWButton;
    iwbAddRefLink: TIWButton;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbDetailsEditClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwDBgResultsColumns0Click(ASender: TObject;
      const AValue: String);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure IWDBGrid4Columns0TitleClick(Sender: TObject);
    procedure iwDBgDomainColumns0TitleClick(Sender: TObject);
    procedure iwbDeleteDomainLinkClick(Sender: TObject);
    procedure IWAppFormDestroy(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbAddDomainLinkClick(Sender: TObject);
    procedure iwDBgDomainColumns0Click(ASender: TObject; const AValue: string);
    procedure iwDBgCorrelativesColumns0Click(ASender: TObject;
      const AValue: string);
    procedure iwDBnDomainsEdit(Sender: TObject);
    procedure iwbDeleteLinkToWhoForClick(Sender: TObject);
    procedure iwbPublishClick(Sender: TObject);
    procedure iwbAddWhoForClick(Sender: TObject);
    procedure iwbAddCommodityLinkClick(Sender: TObject);
    procedure iwDBnCommoditiesEdit(Sender: TObject);
    procedure iwbDeleteCommodityLinkClick(Sender: TObject);
    procedure iwbObjectionClick(Sender: TObject);
    procedure iwbValidateClick(Sender: TObject);
    procedure iwbClearObjectionClick(Sender: TObject);
    procedure iwbAddRefLinkClick(Sender: TObject);
    procedure iwbDeleteRefLinkClick(Sender: TObject);
    procedure iwDBnReferencesEdit(Sender: TObject);
  public
    RecordValues : TStringList;
    procedure UpdateQuery2;
    procedure UpdateQuery2MinMax;
    procedure ShowHideEditButtons;
  end;

implementation

{$R *.dfm}

uses
  ServerController, Graphics, IWColor,
  IWStrat_constants, IWStrat_dmD, IWStrat_dmDV, IWStrat_frDepositGrid,
  IWStrat_adddomaindepositlink, IWStrat_dm, IWStrat_addcommoditylink,
  IWStrat_validcheck, usrIW_dm, IWStrat_addreflink;

procedure TISFDepositDetails.IWAppFormDestroy(Sender: TObject);
begin
  dmStratD.cdsClans.Close;
  dmStratD.cdsCommodities.Close;
  dmStratD.cdsCountryContinents.Close;
  dmStratD.cdsUnitCountry.Close;
  dmStratD.cdsDepositStatus.Close;
end;

procedure TISFDepositDetails.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := UserSession.UserDisplayName;
  end;
end;

procedure TISFDepositDetails.ShowHideEditButtons;
begin
  iwbReturn.Visible := (dmStratD.cdsDeposit.State in [dsBrowse]);
  iwbReturn2.Visible := (dmStratD.cdsDeposit.State in [dsBrowse]);
  iwbDetailsEdit.Visible := (UserSession.CanModify and (dmStratD.cdsDeposit.State in [dsBrowse]));
  iwbDetailsEdit2.Visible := (UserSession.CanModify and (dmStratD.cdsDeposit.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStratD.cdsDeposit.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStratD.cdsDeposit.State in [dsEdit]));
  iwDBlcbCountry.Editable := (UserSession.CanModify and (dmStratD.cdsDeposit.State in [dsEdit]));
  iwDBlcbClan.Editable := (UserSession.CanModify and (dmStratD.cdsDeposit.State in [dsEdit]));
  iwDBlcbOtherDatabase.Editable := (UserSession.CanModify and (dmStratD.cdsDeposit.State in [dsEdit]));
  iwDBlcbHostUnit.Editable := (UserSession.CanModify and (dmStratD.cdsDeposit.State in [dsEdit]));
  iwDBlcbDatingType.Editable := (UserSession.CanModify and (dmStratD.cdsDeposit.State in [dsEdit]));
  iwDBlcbGeodynamicSetting.Editable := (UserSession.CanModify and (dmStratD.cdsDeposit.State in [dsEdit]));
  iwDBlcbDepositStatus.Editable := (UserSession.CanModify and (dmStratD.cdsDeposit.State in [dsEdit]));
  iwbObjection.Visible := true;
  iwbValidate.Visible := UserSession.CanValidate;
  iwbClearObjection.Visible := UserSession.CanValidate;
  iwDBmComments.Editable := (UserSession.CanModify and (dmStratD.cdsDeposit.State in [dsEdit]));

  iwbAddSubDeposit.Enabled := UserSession.CanModify and (dmStratD.cdsSubDeposits.State in [dsBrowse]);
  iwbDeleteSubDeposit.Enabled := UserSession.CanModify and (dmStratD.cdsSubDeposits.State in [dsBrowse]) and (dmStratD.cdsSubDeposits.RecordCount>0);
  iwbAddCommodityLink.Enabled := UserSession.CanModify and (dmStratD.cdsDepositCommodities.State in [dsBrowse]);
  iwbDeleteCommodityLink.Enabled := UserSession.CanModify and (dmStratD.cdsDepositCommodities.State in [dsBrowse]) and (dmStratD.cdsDepositCommodities.RecordCount>0);
  iwbAddDomainLink.Enabled := UserSession.CanModify and (dmStratD.cdsDepositDomains.State in [dsBrowse]);
  iwbDeleteDomainLink.Enabled := UserSession.CanModify and (dmStratD.cdsDepositDomains.State in [dsBrowse]) and (dmStratD.cdsDepositDomains.RecordCount>0);
  iwbAddRefLink.Enabled := UserSession.CanModify and (dmStratD.cdsRefs.State in [dsBrowse]);
  iwbDeleteRefLink.Enabled := UserSession.CanModify and (dmStratD.cdsRefs.State in [dsBrowse]) and (dmStratD.cdsRefs.RecordCount>0);
end;

procedure TISFDepositDetails.iwbReturnClick(Sender: TObject);
begin
  dmStratD.cdsClans.Close;
  dmStratD.cdsOtherDatabases.Close;
  dmStratD.cdsCountryContinents.Close;
  dmStratD.cdsUnitCountry.Close;
  dmStratD.cdsDatingTypes.Close;
  dmStratD.cdsGeodynamicSettings.Close;
  dmDV.cdsQueryDV.Close;
  dmDV.cdsDVMinMax.Close;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDepositGrid.Create(WebApplication).Show
end;

procedure TISFDepositDetails.iwbValidateClick(Sender: TObject);
var
  HasValidityRecord : boolean;
begin
  UserSession.UnitSender := usDeposits;
  HasValidityRecord := false;
  dmStratD.cdsValid.Filter := 'ValidStatusID='+''''+'Valid'+'''';
  dmStratD.cdsValid.Filtered := true;
  if (dmStratD.cdsValid.RecordCount = 1) then
  begin
    HasValidityRecord := true;
  end;
  if (not HasValidityRecord) then
  begin
    dmStratD.cdsValid.Filter := 'ValidStatusID='+''''+'NotYt'+'''';
    dmStratD.cdsValid.Filtered := true;
    if (dmStratD.cdsValid.RecordCount = 1) then
    begin
      HasValidityRecord := true;
      dmStratD.cdsValid.Edit;
      dmStratD.cdsValidVALIDSTATUSID.AsString := 'Valid';
      dmStratD.cdsValidDONEBY.AsString := UserSession.UserID;
      dmStratD.cdsValidDATEDONE.AsDateTime := Now;
      dmStratD.cdsValid.Post;
    end;
    if (not HasValidityRecord) then
    begin
      dmStratD.cdsValid.Append;
      dmStratD.cdsValidSDBDEPOSITID.AsString := dmStratD.cdsDepositSDBDEPOSITID.AsString;
      dmStratD.cdsValidVALIDSTATUSID.AsString := 'Valid';
      dmStratD.cdsValidDATEDONE.AsDateTime := Now;
      dmStratD.cdsValidDONEBY.AsString := UserSession.UserID;
      dmStratD.cdsValidFullCOMMENTS.AsString := ' ';
      dmStratD.cdsValid.Post;
    end;
    try
      dmStratD.cdsValid.ApplyUpdates(0);
    except
      WebApplication.ShowMessage('Not able to update validation status');
    end;
  end;
  dmStratD.cdsValid.Filtered := false;
  dmStratD.cdsDeposit.Close;
  dmStratD.cdsDeposit.Open;
end;

procedure TISFDepositDetails.iwbCancelUpdatesClick(Sender: TObject);
begin
  dmStratD.cdsDeposit.CancelUpdates;
  ShowHideEditButtons;
end;

procedure TISFDepositDetails.iwbClearObjectionClick(Sender: TObject);
begin
  UserSession.UnitSender := usDeposits;
  UserSession.RecordChosen := dmStratD.cdsDepositSDBDEPOSITID.AsString;
  dmStratD.qValidFull.Close;
  dmStratD.qValidFull.ParamByName('DEPOSITID').AsString := UserSession.RecordChosen;
  dmStratD.cdsValidFull.Close;
  dmStratD.cdsValidFull.Open;
  dmStratD.cdsValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
  dmStratD.cdsValidFull.Filtered := true;
  if (dmStratD.cdsValidFull.RecordCount > 0) then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFValidCheck.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('No objection to clear');
  end;
end;

procedure TISFDepositDetails.iwbDetailsEditClick(Sender: TObject);
begin
  dmStratD.cdsDeposit.Edit;
  dmStratD.cdsDepositComment.Edit;
  ShowHideEditButtons;
end;

procedure TISFDepositDetails.iwbObjectionClick(Sender: TObject);
begin
  UserSession.UnitSender := usDeposits;
  UserSession.RecordChosen := dmStratD.cdsDepositSDBDEPOSITID.AsString;
  dmStratD.qValidFull.Close;
  dmStratD.qValidFull.ParamByName('DEPOSITID').AsString := UserSession.RecordChosen;
  dmStratD.cdsValidFull.Close;
  dmStratD.cdsValidFull.Open;
  dmStratD.cdsValidFull.Filter := 'ValidStatusID='+''''+'Chckd'+'''';
  dmStratD.cdsValidFull.Filtered := true;
  if (dmStratD.cdsValidFull.RecordCount = 0) then
  begin
    dmStratD.cdsValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
    dmStratD.cdsValidFull.Filtered := true;
    if (dmStratD.cdsValidFull.RecordCount = 0) then
    begin
      dmStratD.cdsValidFull.Append;
      dmStratD.cdsValidFullSDBDEPOSITID.AsString := UserSession.RecordChosen;
      dmStratD.cdsValidFullVALIDSTATUSID.AsString := 'Check';
      dmStratD.cdsValidFullDATEDONE.AsDateTime := Now;
      dmStratD.cdsValidFullDONEBY.AsString := UserSession.UserID;
      dmStratD.cdsValidFullCOMMENTS.AsString := ' ';
      dmStratD.cdsValidFull.Post;
    end;
    dmStratD.cdsValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
    dmStratD.cdsValidFull.Filtered := true;
    dmStratD.cdsValidFull.Edit;
    dmStratD.cdsValidFullSDBDEPOSITID.AsString := UserSession.RecordChosen;
    dmStratD.cdsValidFullVALIDSTATUSID.AsString := 'Check';
    dmStratD.cdsValidFullDATEDONE.AsDateTime := Now;
    dmStratD.cdsValidFullDONEBY.AsString := UserSession.UserID;
    dmStratD.cdsValidFullCOMMENTS.AsString := ' ';
    dmStratD.cdsValidFull.Post;
  end else
  begin
    dmStratD.cdsValidFull.Edit;
    dmStratD.cdsValidFullSDBDEPOSITID.AsString := UserSession.RecordChosen;
    dmStratD.cdsValidFullVALIDSTATUSID.AsString := 'Check';
    dmStratD.cdsValidFullDATEDONE.AsDateTime := Now;
    dmStratD.cdsValidFull.Post;
    dmStratD.cdsValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
    dmStratD.cdsValidFull.Filtered := true;
  end;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFValidCheck.Create(WebApplication).Show;
end;

procedure TISFDepositDetails.iwbPublishClick(Sender: TObject);
begin
  try
    dmStratD.cdsDepositFor.Append;
    dmStratD.cdsDepositForSDBDEPOSITID.AsString := UserSession.RecordChosen;
    dmStratD.cdsDepositForWHOFORID.AsString := ValueForPublished;
    dmStratD.cdsDepositFor.Post;
    dmStratD.cdsDepositFor.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('not able to Publish this record');
  end;
end;

procedure TISFDepositDetails.IWAppFormCreate(Sender: TObject);
var
  i, iRec : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'StratDB Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Database';
    if (UserSession.CanModify) then
    begin
      iwDBgDomain.RowCurrentColor := clWebYellow;
    end else
    begin
      iwDBgDomain.RowCurrentColor := clNone;
    end;
    dmStratD.cdsClans.Close;
    dmStratD.cdsOtherDatabases.Close;
    dmStratD.cdsCountryContinents.Close;
    dmStratD.cdsDatingTypes.Close;
    dmStratD.cdsGeodynamicSettings.Close;
    dmStratD.cdsUnitCountry.Close;
    dmStratD.cdsDepositStatus.Close;
    dmStratD.qDeposit.Close;
    dmStratD.qDeposit.ParamByName('SDBDEPOSITID').AsString := UserSession.RecordChosen;
    dmStratD.cdsDeposit.Close;
    dmStratD.cdsDeposit.Open;
    dmStratD.cdsDepositComment.Close;
    dmStratD.cdsDepositComment.Open;
    if UserSession.IsDeveloper then
    begin
      //dmUser.SetDeveloperData(dmStratD.qDeposit.SQL.Text);
    end;
    iwbPublish.Enabled := false;
    iwlDatesAvailable.Visible := false;
    UpdateQuery2;
    dmStrat.qCountPublished.Close;
    dmStrat.qCountPublished.SQL.Clear;
    dmStrat.qCountPublished.SQL.Add('SELECT COUNT(DEPOSITFOR.WHOFORID)');
    dmStrat.qCountPublished.SQL.Add('FROM DEPOSITFOR');
    dmStrat.qCountPublished.SQL.Add('WHERE DEPOSITFOR.SDBDEPOSITID = :ID');
    dmStrat.qCountPublished.SQL.Add('AND DEPOSITFOR.WHOFORID='+''''+'PUBL'+'''');
    dmStrat.qCountPublished.ParamByName('ID').AsString := UserSession.RecordChosen;
    dmStrat.cdsCountPublished.Close;
    dmStrat.cdsCountPublished.Open;
    if ((UserSession.CanModify) and (dmStrat.cdsCountPublishedCOUNT.AsInteger < 1)) then
    begin
      iwbPublish.Enabled := true;
    end;
    dmStratD.cdsClans.Open;
    dmStratD.cdsOtherDatabases.Open;
    dmStratD.cdsCountryContinents.Open;
    dmStratD.cdsDatingTypes.Open;
    dmStratD.cdsGeodynamicSettings.Open;
    dmStratD.qUnitCountry.Close;
    dmStratD.qUnitCountry.ParamByName('COUNTRYID').AsString := dmStratD.cdsDepositCOUNTRYID.AsString;
    dmStratD.cdsUnitCountry.Close;
    dmStratD.cdsUnitCountry.Open;
    dmStratD.cdsDepositStatus.Open;
  end;
  iwbAddCommodityLink.Enabled := false;
  iwbDeleteCommodityLink.Enabled := false;
  iwbAddDomainLink.Enabled := false;
  iwbDeleteDomainLink.Enabled := false;
  ShowHideEditButtons;
end;

procedure TISFDepositDetails.iwDBgResultsColumns0Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.RecordChosen := Trim(AValue);
  //UpdateQuery2;
  ShowHideEditButtons;
  UserSession.ParameterChosen := Trim(AValue);
end;

procedure TISFDepositDetails.UpdateQuery2;
var
  i, iRec : integer;
  tmpUnitID : integer;
  tmpParentID : integer;
begin
  Usersession.UnitSender := usDeposits;
  try
    dmDV.cdsQueryDV.Close;
    dmDV.cdsDVMinMax.Close;
  except
  end;
  dmStratD.qDeposit.Close;
  dmStratD.qDeposit.ParamByName('SDBDEPOSITID').AsString := UserSession.RecordChosen;
  dmStratD.cdsDeposit.Close;
  dmStratD.cdsDeposit.Open;
  iRec := 0;
  if (UserSession.LinkToDateView) then
  begin
    tmpUnitID := dmStratD.cdsDepositHOSTUNITID.AsInteger;
    dmDV.cdsSuite.Close;
    dmDV.qSuite.Close;
    dmDV.qSuite.ParamByName('UnitID').AsInteger := tmpUnitID;
    dmDV.cdsSuite.Open;
    tmpParentID := dmDV.cdsSuitePARENTID.AsInteger;
    dmDV.cdsSuite.Close;
    if (tmpUnitID <> 0) then
    begin
      try
        if (iRec > 0) then
        begin
          RecordValues := TStringList.Create;
          RecordValues.Clear;
        end;
        dmDV.QueryDV.SQL.Clear;
        dmDV.QueryDV.SQL.Add('SELECT DISTINCT SUITE.GISID, ISORGR30.COUNTRYABR, SUITE.UNITID, SUITE.UNITNAME,');
        dmDV.QueryDV.SQL.Add('  ISORGR30.MATERIALABR,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,');
        dmDV.QueryDV.SQL.Add('  ISORGR30.TECHABR,TECHNIQUE.TECHNIQUE,');
        dmDV.QueryDV.SQL.Add('  ISORGR30.INTERPABR,ISORGR30.IAGE,ISORGR30.IAGEPERROR,ISORGR30.IAGEMERROR, ISORGR30.AGEUNITS,');
        dmDV.QueryDV.SQL.Add('  ISORGR30.LITHOLOGY,ISORGR30.RECORDID,COUNTRY.COUNTRY,MATERIAL.MATERIALDESCRIPTION,');
        dmDV.QueryDV.SQL.Add('  INTERPRETATION.INTERPRETATION,APPROACH.APPROACHDESCRIPTION,ISOSYSTEM.ISOSYSTEMNAME,');
        dmDV.QueryDV.SQL.Add('  ISORGR30.RAGE,ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,ISOFOR.WHOFORID');
        dmDV.QueryDV.SQL.Add('FROM ISORGR30,COUNTRY,INTERPRETATION,APPROACH,MATERIAL,ISOSYSTEM,ISOFOR,TECHNIQUE, ');
        dmDV.QueryDV.SQL.Add('  SUITE,SUITECOUNTRY,USERSWHOFOR');
        dmDV.QueryDV.SQL.Add('WHERE  ISORGR30.COUNTRYABR = COUNTRY.COUNTRYABR');
        dmDV.QueryDV.SQL.Add('AND USERSWHOFOR.USERID = :UserID');
        dmDV.QueryDV.SQL.Add('AND USERSWHOFOR.WHOFORID = ISOFOR.WHOFORID');
        dmDV.QueryDV.SQL.Add('AND ISORGR30.MATERIALABR = MATERIAL.MATERIALABR');
        dmDV.QueryDV.SQL.Add('AND ISORGR30.INTERPABR = INTERPRETATION.INTERPABR');
        dmDV.QueryDV.SQL.Add('AND ISORGR30.APPROACHABR = APPROACH.APPROACHABR');
        dmDV.QueryDV.SQL.Add('AND ISORGR30.TECHABR = TECHNIQUE.TECHABR');
        dmDV.QueryDV.SQL.Add('AND ISORGR30.ISOTOPESYSTEM = ISOSYSTEM.ISOSYSTEM');
        dmDV.QueryDV.SQL.Add('AND ISORGR30.PREFLEVEL >= 1');
        dmDV.QueryDV.SQL.Add('AND ISOFOR.RECORDID=ISORGR30.RECORDID');
        if not UserSession.IsDeveloper then dmDV.QueryDV.SQL.Add('AND ISOFOR.WHOFORID='+''''+'PUBL'+'''');
        dmDV.QueryDV.SQL.Add('AND SUITE.UNITID=SUITECOUNTRY.UNITID');
        dmDV.QueryDV.SQL.Add('AND SUITECOUNTRY.UNITID=ISORGR30.UNITID');
        dmDV.QueryDV.SQL.Add('AND SUITECOUNTRY.COUNTRYABR=ISORGR30.COUNTRYABR');
        dmDV.QueryDV.SQL.Add('AND (SUITE.GISID='+IntToStr(tmpUnitID));
        if (iRec > 0) then
        begin
          dmDV.QueryDV.SQL.Add('OR SUITE.GISID = '+RecordValues.Strings[0]);
          if (iRec > 1) then
          begin
            for i := 2 to iRec do
            begin
              dmDV.QueryDV.SQL.Add('OR SUITE.GISID = '+RecordValues.Strings[i-1]);
            end;
          end;
        end;
        if (tmpParentID <> 0) then
        begin
          dmDV.QueryDV.SQL.Add('  OR SUITE.PARENTID='+IntToStr(tmpUnitID)+')');
        end else
        begin
          dmDV.QueryDV.SQL.Add(')');
        end;
        dmDV.QueryDV.SQL.Add('AND INTERPRETATION.INTERPGROUP>0');
        dmDV.QueryDV.SQL.ADD('ORDER BY ISORGR30.RAGE,SUITE.UNITNAME,ISORGR30.MATERIALABR,');
        dmDV.QueryDV.SQL.ADD('  ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,');
        dmDV.QueryDV.SQL.ADD('  ISORGR30.PREFLEVEL');

        if UserSession.IsDeveloper then
        begin
          //dmUser.SetDeveloperData(dmDV.QueryDV.SQL.Text);
        end;

        dmDV.QueryDV.ParamByName('UserID').AsString := UserSession.UserID;
        dmDV.cdsQueryDV.Close;
        dmDV.cdsQueryDV.Open;
        //dmDV.cdsDVMinMax.Open;
        iRec := 0;
        iRec := dmDV.cdsQueryDV.RecordCount;
      finally
        FreeAndNil(RecordValues);
      end;
    end;
  end;
  if (iRec <= 0) then
  begin
    dmDV.cdsQueryDV.Close;
    iwlDatesAvailable.Visible := false;
    iwDBeMinDVAge.Visible := false;
    iwDBeMaxDVAge.Visible := false;
  end else
  begin
    iwlDatesAvailable.Visible := true;
    //iwDBeMinDVAge.Visible := true;
    //iwDBeMaxDVAge.Visible := true;
    //UpdateQuery2MinMax;
  end;
end;

procedure TISFDepositDetails.UpdateQuery2MinMax;
var
  i, iRec : integer;
begin
  if (UserSession.LinkToDateView) then
  begin
    try
      dmDV.cdsDVMinMax.Close;
      dmDV.qDVMinMax.Close;
      dmDV.qDVMinMax.SQL.Clear;
      dmDV.qDVMinMax.SQL.Add('SELECT MIN((ISORGR30.rage-isorgr30.ragemerror)) as MinAge,');
      dmDV.qDVMinMax.SQL.Add('max((isorgr30.rage+isorgr30.rageperror)) as MaxAge');
      dmDV.qDVMinMax.SQL.Add('from ISORGR30,SUITE,INTERPRETATION,ISOFOR');
      dmDV.qDVMinMax.SQL.Add('WHERE (SUITE.GISID='+UserSession.RecordChosen+' or SUITE.parentid='+UserSession.RecordChosen+')');
      dmDV.qDVMinMax.SQL.Add('AND SUITE.UNITID=ISORGR30.UNITID');
      dmDV.qDVMinMax.SQL.Add('AND INTERPRETATION.INTERPABR = ISORGR30.INTERPABR');
      dmDV.qDVMinMax.SQL.Add('AND INTERPRETATION.INTERPGROUP=5');
      dmDV.qDVMinMax.SQL.Add('AND ISORGR30.PREFLEVEL >= '+''''+'1'+'''');
      dmDV.qDVMinMax.SQL.Add('AND ISOFOR.RECORDID=ISORGR30.RECORDID');
      if not UserSession.IsDeveloper then dmDV.qDVMinMax.SQL.Add('AND ISOFOR.WHOFORID='+''''+'PUBL'+'''');
      //dmUser.SetDeveloperData(dmDV.qDVMinMax.SQL.Text);
      dmDV.cdsDVMinMaxMINAGE.DisplayFormat := '###0.00';
      dmDV.cdsDVMinMaxMAXAGE.DisplayFormat := '###0.00';
      dmDV.cdsDVMinMax.Close;
      dmDV.cdsDVMinMax.Open;
    finally
    end;
  end;
end;

procedure TISFDepositDetails.iwDBgCorrelativesColumns0Click(ASender: TObject;
  const AValue: string);
begin
  UserSession.RecordChosen := Trim(AValue);
  //UpdateQuery2;
  UserSession.ParameterChosen := Trim(AValue);
end;

procedure TISFDepositDetails.iwbApplyUpdatesClick(Sender: TObject);
var
  LocalNodeServer,LocalNodePath,
  LocalNodeName,LocalNodeCharSet,
  LocalNodeDBName,LocalNodeDBType,LocalNodeDBVersion,LocalNodeSQLDialect,
  LocalNodeUserLogin,LocalNodeUserPassword : string;
  RemoteNodeServer,RemoteNodePath,
  RemoteNodeName,RemoteNodeCharSet,RemoteNodeDBName,
  RemoteNodeDBType,RemoteNodeDBVersion,RemoteNodeSQLDialect,RemoteNodeUserLogin,
  RemoteNodeUserPassword : string;
  i : integer;
  Cnt : integer;
  LocalTmpStringList, RemoteTmpStringList : TStringList;
begin
  //try
    dmStratD.cdsDeposit.ApplyUpdates(0);
  //except
  //end;
  try
    dmStratD.cdsDepositCommodities.ApplyUpdates(0);
  except
  end;
  try
    dmStratD.cdsDepositDomains.ApplyUpdates(0);
  except
  end;
  ShowHideEditButtons;
  dmStratD.cdsHostUnitAge.Close;
  dmStratD.cdsHostUnitAge.Open;
  {
  dmReplicate.cdsRemoteNodes.Open;
  RemoteNodeName := dmReplicate.cdsRemoteNodesNODENAME.AsString;
  RemoteNodeServer := dmReplicate.cdsRemoteNodesNODESERVER.AsString;
  RemoteNodePath := dmReplicate.cdsRemoteNodesNODEPATH.AsString;
  RemoteNodeDBName := RemoteNodeServer+':'+RemoteNodePath;
  //RemoteNodeDBName := dmReplicate.cdsRemoteNodesNODEDBNAME.AsString;
  RemoteNodeDBType := dmReplicate.cdsRemoteNodesNODEDBTYPE.AsString;
  RemoteNodeDBVersion := dmReplicate.cdsRemoteNodesNODEDBVERSION.AsString;
  //RemoteNodeCharSet := dmReplicate.cdsRemoteNodesNODECHARSET.AsString;
  //RemoteNodeSQLDialect := dmReplicate.cdsRemoteNodesNODESQLDIALECT.AsString;
  RemoteNodeUserLogin := dmReplicate.cdsRemoteNodesNODEUSERLOGIN.AsString;
  RemoteNodeUserPassword := dmReplicate.cdsRemoteNodesNODEUSERPASSWORD.AsString;
  RemoteTmpStringList := TStringList.Create;
  RemoteTmpStringList.Clear;
  RemoteTmpStringList.Text := dmReplicate.cdsRemoteNodesNODEDBSPECIFIC.AsString;
  RemoteNodeCharSet := RemoteTmpStringList.Values['CHARSET'];
  RemoteNodeSQLDialect := RemoteTmpStringList.Values['SQLDIALECT'];
  RemoteTmpStringList.Free;
  dmReplicate.cdsRemoteNodes.Close;
  }
  //dmUser.SetDeveloperData(RemoteNodeName);
  //dmUser.SetDeveloperData(RemoteNodeCharSet);
  //dmUser.SetDeveloperData(RemoteNodeDBName);
  //dmUser.SetDeveloperData(RemoteNodeDBType);
  //dmUser.SetDeveloperData(RemoteNodeDBVersion);
  //dmUser.SetDeveloperData(RemoteNodeSQLDialect);
  //dmUser.SetDeveloperData(RemoteNodeUserLogin);
  //dmUser.SetDeveloperData(RemoteNodeUserPassword);
  {
  LocalTmpStringList := TStringList.Create;
  dmReplicate.qLocalNodes.Close;
  dmReplicate.cdsLocalNodes.Close;
  dmReplicate.cdsLocalNodes.Open;
  Cnt := dmReplicate.cdsLocalNodes.RecordCount;
  for i := 1 to Cnt do
  begin
    LocalNodeName := dmReplicate.cdsLocalNodesNODENAME.AsString;
    LocalNodeDBName := dmReplicate.cdsLocalNodesNODEDBNAME.AsString;
    LocalNodeDBType := dmReplicate.cdsLocalNodesNODEDBTYPE.AsString;
    LocalNodeServer := dmReplicate.cdsLocalNodesNODESERVER.AsString;
    LocalNodePath := dmReplicate.cdsLocalNodesNODEPATH.AsString;
    LocalNodeDBName := LocalNodeServer+':'+LocalNodePath;
    //LocalNodeDBVersion := dmReplicate.cdsLocalNodesNODEDBVERSION.AsString;
    //LocalNodeCharSet := dmReplicate.cdsLocalNodesNODECHARSET.AsString;
    //LocalNodeSQLDialect := dmReplicate.cdsLocalNodesNODESQLDIALECT.AsString;
    LocalNodeUserLogin := dmReplicate.cdsLocalNodesNODEUSERLOGIN.AsString;
    LocalNodeUserPassword := dmReplicate.cdsLocalNodesNODEUSERPASSWORD.AsString;
    LocalTmpStringList.Clear;
    LocalTmpStringList.Text := dmReplicate.cdsLocalNodesNODEDBSPECIFIC.AsString;
    LocalNodeCharSet := LocalTmpStringList.Values['CHARSET'];
    LocalNodeSQLDialect := LocalTmpStringList.Values['SQLDIALECT'];
    //dmUser.SetDeveloperData(LocalNodeName);
    //dmUser.SetDeveloperData(LocalNodeCharSet);
    //dmUser.SetDeveloperData(LocalNodeDBName);
    //dmUser.SetDeveloperData(LocalNodeDBType);
    //dmUser.SetDeveloperData(LocalNodeDBVersion);
    //dmUser.SetDeveloperData(LocalNodeSQLDialect);
    //dmUser.SetDeveloperData(LocalNodeUserLogin);
    //dmUser.SetDeveloperData(LocalNodeUserPassword);
    dmReplicate.ReplicateFromStratDB(LocalNodeServer,LocalNodePath,
      LocalNodeName,LocalNodeCharSet,
      LocalNodeDBName,LocalNodeDBType,LocalNodeDBVersion,LocalNodeSQLDialect,
      LocalNodeUserLogin,LocalNodeUserPassword,
      RemoteNodeServer,RemoteNodePath,
      RemoteNodeName,RemoteNodeCharSet,RemoteNodeDBName,
      RemoteNodeDBType,RemoteNodeDBVersion,RemoteNodeSQLDialect,RemoteNodeUserLogin,
      RemoteNodeUserPassword,'ttNoTrace');
    dmReplicate.cdsLocalNodes.Next;
  end;
  LocalTmpStringList.Free;
  dmReplicate.cdsLocalNodes.Close;
  }
end;

procedure TISFDepositDetails.IWDBGrid4Columns0TitleClick(Sender: TObject);
begin
  dmStratD.cdsDepositCommodities.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlCommoditiesSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDepositDetails.iwDBnCommoditiesEdit(Sender: TObject);
begin
  dmStratD.qDeposit.Close;
  dmStratD.qCommodities.Close;
  dmStratD.cdsDeposit.Close;
  dmStratD.cdsCommodities.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddCommodityLink.Create(WebApplication).Show;
end;

procedure TISFDepositDetails.iwDBnDomainsEdit(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddDomainDepositLink.Create(WebApplication).Show;
end;

procedure TISFDepositDetails.iwDBnReferencesEdit(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddRefLink.Create(WebApplication).Show;
end;

procedure TISFDepositDetails.iwDBgDomainColumns0Click(ASender: TObject;
  const AValue: string);
begin
  UserSession.ParameterChosen := Trim(AValue);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddDomainDepositLink.Create(WebApplication).Show;
end;

procedure TISFDepositDetails.iwDBgDomainColumns0TitleClick(Sender: TObject);
begin
  dmStratD.cdsDepositDomains.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlDomainsSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDepositDetails.iwbAddCommodityLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := true;
  //WasSuccessful := false;
  dmStratD.InsertDepositCommodityLink(WasSuccessful);
  if WasSuccessful then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddCommodityLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new Commodity link record');
  end;
end;

procedure TISFDepositDetails.iwbAddDomainLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStratD.InsertDomainDepositLink(WasSuccessful);
  if WasSuccessful then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddDomainDepositLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new Deposit link record');
  end;
end;

procedure TISFDepositDetails.iwbAddRefLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  UserSession.UnitSender := usDeposits;
  WasSuccessful := false;
  dmStrat.InsertReferenceLink(WasSuccessful);
  if WasSuccessful then
  begin
    UserSession.UnitSender := usDeposits;
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddRefLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

procedure TISFDepositDetails.iwbAddWhoForClick(Sender: TObject);
begin
  WebApplication.ShowMessage('Not yet implemented');
end;

procedure TISFDepositDetails.iwbDeleteCommodityLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStratD.DeleteDepositCommodityLink(WasSuccessful);
  if WasSuccessful then
  begin
    dmStratD.cdsDeposit.Close;
    dmStratD.cdsDeposit.Open;
  end else
  begin
    //WebApplication.ShowMessage('Not yet programmed');
    WebApplication.ShowMessage('Could not delete linked record');
  end;
end;

procedure TISFDepositDetails.iwbDeleteDomainLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStratD.DeleteDomainRecord(WasSuccessful);
  if WasSuccessful then
  begin
    dmStratD.cdsDeposit.Close;
    dmStratD.cdsDeposit.Open;
  end else
  begin
    //WebApplication.ShowMessage('Not yet programmed');
    WebApplication.ShowMessage('Could not delete linked record');
  end;
end;

procedure TISFDepositDetails.iwbDeleteLinkToWhoForClick(Sender: TObject);
begin
  WebApplication.ShowMessage('Not yet implemented');
end;

procedure TISFDepositDetails.iwbDeleteRefLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmStratD.DeleteRefRecord(WasSuccessful);
  if WasSuccessful then
  begin
    dmStratD.cdsDepositQuery.Close;
    dmStratD.cdsDepositQuery.Open;
  end;
end;

end.
