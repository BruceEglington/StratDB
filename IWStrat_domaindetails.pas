unit IWStrat_domaindetails;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWCompButton, IWCompLabel, IWBaseControl,
  IWControl, IWCompEdit, IWDBStdCtrls, IWCompGrids, IWDBGrids, IWCompMemo,
  IWCompListbox, IWVCLBaseControl,
  DB, IWBaseHTMLControl, IWCompRectangle, IWCompCheckbox,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWRegion,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWStrat_frTopBar, IWHTML40Container;

type
  TISFDomainDetails = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    IWLabel1: TIWLabel;
    iwbReturn: TIWButton;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    iwDBgValidation: TIWDBGrid;
    IWLabel24: TIWLabel;
    iwbObjection: TIWButton;
    iwbDetailsEdit: TIWButton;
    IWDBEdit2: TIWDBEdit;
    IWDBEdit3: TIWDBEdit;
    iwbReturn2: TIWButton;
    iwbDetailsEdit2: TIWButton;
    IWLabel66: TIWLabel;
    IWLabel67: TIWLabel;
    IWLabel5: TIWLabel;
    IWLabel8: TIWLabel;
    IWDBEdit7: TIWDBEdit;
    IWLabel9: TIWLabel;
    IWLabel10: TIWLabel;
    IWDBEdit8: TIWDBEdit;
    IWDBEdit9: TIWDBEdit;
    IWLabel12: TIWLabel;
    IWDBMemo1: TIWDBMemo;
    iwDBgUnits: TIWDBGrid;
    iwbGoToParent: TIWButton;
    iwrDateView: TIWRegion;
    IWLabel22: TIWLabel;
    iwDBgDateView: TIWDBGrid;
    iwrTopButtons: TIWRegion;
    iwrUnitDetails: TIWRegion;
    IWLabel16: TIWLabel;
    iwrSubUnits: TIWRegion;
    iwrValidation: TIWRegion;
    iwlSortUnits: TIWLabel;
    iwlDVSortedBy: TIWLabel;
    iwbApplyUpdates: TIWButton;
    iwbValidate: TIWButton;
    iwbClearObjection: TIWButton;
    iwrClientAll: TIWRegion;
    iwrBottomButtons: TIWRegion;
    iwbAddDomainToDateView: TIWButton;
    iwDBnStratUnits: TIWDBNavigator;
    iwbCancelUpdates: TIWButton;
    iwrMetamorphism: TIWRegion;
    IWLabel6: TIWLabel;
    iwDBgMetamorphism: TIWDBGrid;
    iwlSortMetamorphism: TIWLabel;
    iwDBnMetamorphism: TIWDBNavigator;
    iwrSubDomains: TIWRegion;
    IWLabel11: TIWLabel;
    iwDBgSubDomains: TIWDBGrid;
    iwlSortSubDomains: TIWLabel;
    IWDBNavigator2: TIWDBNavigator;
    iwrDeformation: TIWRegion;
    IWLabel14: TIWLabel;
    iwDBgDeformation: TIWDBGrid;
    iwlSortDeformation: TIWLabel;
    iwDBnDeformation: TIWDBNavigator;
    IWDBNavigator5: TIWDBNavigator;
    iwbLinkUnitsToParentDomain: TIWButton;
    iwrCommodities: TIWRegion;
    IWLabel19: TIWLabel;
    iwDBgEconomicFeatures: TIWDBGrid;
    iwlSortEconomicFeatures: TIWLabel;
    iwDBnEconomicFeatures: TIWDBNavigator;
    IWLabel21: TIWLabel;
    IWDBEdit5: TIWDBEdit;
    IWLabel23: TIWLabel;
    IWDBEdit6: TIWDBEdit;
    iwrDatesAvailable: TIWRegion;
    IWLabel30: TIWLabel;
    IWDBEdit10: TIWDBEdit;
    IWLabel31: TIWLabel;
    IWDBEdit12: TIWDBEdit;
    IWLabel32: TIWLabel;
    iwlDatesAvailable: TIWLabel;
    iwDBlcbDomainType: TIWDBLookupComboBox;
    iwbAddMetamorphismLink: TIWButton;
    iwbAddDeformationLink: TIWButton;
    iwbAddEconomicFeatureLink: TIWButton;
    iwbAddStratUnitLink: TIWButton;
    iwbDownloadUnits: TIWButton;
    iwrWhoFor: TIWRegion;
    IWLabel37: TIWLabel;
    iwDBgLinkToWhoFor: TIWDBGrid;
    iwDBnLinkToWhoFor: TIWDBNavigator;
    iwbDeleteLinkToWhoFor: TIWButton;
    iwbAddWhoFor: TIWButton;
    iwrLIP: TIWRegion;
    IWLabel7: TIWLabel;
    iwDBgLIP: TIWDBGrid;
    iwlLIPSortedBy: TIWLabel;
    iwDBnLIP: TIWDBNavigator;
    iwbAddLIPLink: TIWButton;
    iwbPublish: TIWButton;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbDetailsEditClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbObjectionClick(Sender: TObject);
    procedure iwbGoToParentClick(Sender: TObject);
    procedure iwDBgDateViewColumns0TitleClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbValidateClick(Sender: TObject);
    procedure iwbClearObjectionClick(Sender: TObject);
    procedure iwbDeleteRefLinkClick(Sender: TObject);
    procedure iwbDeleteLinkToApplicationsClick(Sender: TObject);
    procedure iwbAddDomainToDateViewClick(Sender: TObject);
    procedure iwbDeleteDomainLinkClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure IWAppFormDestroy(Sender: TObject);
    procedure iwbLinkUnitsToParentDomainClick(Sender: TObject);
    procedure iwbAddMetamorphismLinkClick(Sender: TObject);
    procedure iwbAddDeformationLinkClick(Sender: TObject);
    procedure iwbAddStratUnitLinkClick(Sender: TObject);
    procedure iwbAddEconomicFeatureLinkClick(Sender: TObject);
    procedure iwDBnEconomicFeaturesEdit(Sender: TObject);
    procedure iwDBnMetamorphismEdit(Sender: TObject);
    procedure iwDBnDeformationEdit(Sender: TObject);
    procedure iwDBnStratUnitsEdit(Sender: TObject);
    procedure iwDBgEconomicFeaturesColumns0TitleClick(Sender: TObject);
    procedure iwDBgSubDomainsColumns0TitleClick(Sender: TObject);
    procedure iwDBgSubDomainsColumns0Click(ASender: TObject;
      const AValue: string);
    procedure iwDBgMetamorphismColumns0TitleClick(Sender: TObject);
    procedure iwDBgDeformationColumns0TitleClick(Sender: TObject);
    procedure iwDBgUnitsColumns0TitleClick(Sender: TObject);
    procedure iwbDownloadUnitsClick(Sender: TObject);
    procedure iwbAddWhoForClick(Sender: TObject);
    procedure iwbDeleteLinkToWhoForClick(Sender: TObject);
    procedure iwbAddLIPLinkClick(Sender: TObject);
    procedure iwDBnLIPEdit(Sender: TObject);
    procedure iwDBgLIPColumns0TitleClick(Sender: TObject);
    procedure iwbPublishClick(Sender: TObject);
  public
    RecordValues : TStringList;
    procedure UpdateQuery2;
    procedure UpdateQuery2MinMax(tmpDVLevel : integer; DomainIsLIP : boolean);
    procedure ShowHideEditButtons;
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_frDomainGrid, Graphics, IWColor,
  IWStrat_constants, IWStrat_dm, IWStrat_dmDV, IWStrat_domainvalidcheck,
  usrIW_dm, IWStrat_addeconomicfeaturelink,
  IWStrat_adddeformationlink, IWStrat_addstratunitlink,
  IWStrat_addmetamorphismlink, IWStrat_dmC, IWStrat_domains;

procedure TISFDomainDetails.IWAppFormDestroy(Sender: TObject);
begin
  dmStrat.cdsDomainTypes.Close;
  dmStrat.cdsDomainQ.Close;
end;

procedure TISFDomainDetails.IWAppFormCreate(Sender: TObject);
var
  i, iRec : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'StratDB Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Database';
    iwrDateView.Visible := UserSession.LinkToDateView;
    iwbValidate.Visible := UserSession.CanValidate;
    iwbAddDomainToDateView.Visible := UserSession.CanModify;
    dmStrat.cdsDomainTypes.Open;
    if (UserSession.CanModify) then
    begin
      //iwDBgReference.RowCurrentColor := clWebYellow;
    end else
    begin
      //iwDBgReference.RowCurrentColor := clNone;
    end;
    UpdateQuery2;
  end;
  ShowHideEditButtons;
end;

procedure TISFDomainDetails.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
end;

procedure TISFDomainDetails.ShowHideEditButtons;
begin
  iwbReturn.Visible := (dmStrat.cdsDomainQ.State in [dsBrowse]);
  iwbReturn2.Visible := (dmStrat.cdsDomainQ.State in [dsBrowse]);
  iwbDetailsEdit.Visible := (UserSession.CanModify and (dmStrat.cdsDomainQ.State in [dsBrowse]));
  iwbDetailsEdit2.Visible := (UserSession.CanModify and (dmStrat.cdsDomainQ.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsDomainQ.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsDomainQ.State in [dsEdit]));
  iwbGoToParent.Visible := (dmStrat.cdsDomainQDOMAINPARENTID.AsInteger <> 0);
  iwbObjection.Visible := true;
  iwbValidate.Visible := UserSession.CanValidate;
  iwbClearObjection.Visible := UserSession.CanValidate;
  iwDBlcbDomainType.Editable := (UserSession.CanModify and (dmStrat.cdsDomainQ.State in [dsEdit]));
  iwrDateView.Visible := UserSession.LinkToDateView;

  iwbAddMetamorphismLink.Enabled := UserSession.CanModify and (dmStrat.cdsDomainQ.State in [dsBrowse]);
  iwbAddDeformationLink.Enabled := UserSession.CanModify and (dmStrat.cdsDomainQ.State in [dsBrowse]);
  iwbAddStratUnitLink.Enabled := UserSession.CanModify and (dmStrat.cdsDomainQ.State in [dsBrowse]);
  iwbAddEconomicFeatureLink.Enabled := UserSession.CanModify and (dmStrat.cdsDomainQ.State in [dsBrowse]);
  iwbAddDomainToDateView.Enabled := (UserSession.CanModify and (dmStrat.cdsDomainQ.State in [dsBrowse]));

  //iwbAddStratUnitLink.Enabled := true;
end;

procedure TISFDomainDetails.iwbReturnClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  if (UserSession.UnitSender = 'NewDomain') then
  begin
    TISFDomains.Create(WebApplication).Show;
  end else
  begin
    TISFDomainGrid.Create(WebApplication).Show;
  end;
end;

procedure TISFDomainDetails.iwbCancelUpdatesClick(Sender: TObject);
begin
  dmStrat.cdsDomainQ.CancelUpdates;
  ShowHideEditButtons;
end;

procedure TISFDomainDetails.iwbDetailsEditClick(Sender: TObject);
begin
  {
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Hide;
  TISFDetailsEdit.Create(WebApplication).Show
  }
  dmStrat.cdsDomainQ.Edit;
  ShowHideEditButtons;
end;

procedure TISFDomainDetails.iwbDownloadUnitsClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
begin
  dmStratC.qDomainUnits.Close;
  dmStratC.qDomainUnits.ParamByName('DomainID').AsString := dmStrat.cdsDomainQDOMAINID.AsString;
  dmStratC.cdsDomainUnits.Close;
  dmStratC.cdsDomainUnits.Open;
  dmStratC.cdsDomainUnits.First;
  //dmUser.SetDeveloperData(dmStratC.qDomainUnits.SQL.Text);
  //dmStratC.FlexCelReportDomainUnits.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBDomainUnits.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBDomainUnits.xlsx';
  frFileNameStr := 'DomainUnits_charting.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsDomainUnits',dmStratC.cdsDomainUnits);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsDomainUnits.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFDomainDetails.iwbObjectionClick(Sender: TObject);
begin
  UserSession.RecordChosen := dmStrat.cdsDomainQDOMAINID.AsString;
  dmStrat.qDomainValidFull.Close;
  dmStrat.qDomainValidFull.ParamByName('DOMAINID').AsString := UserSession.RecordChosen;
  dmStrat.cdsDomainValidFull.Close;
  dmStrat.cdsDomainValidFull.Open;
  dmStrat.cdsDomainValidFull.Filter := 'ValidStatusID='+''''+'Chckd'+'''';
  dmStrat.cdsDomainValidFull.Filtered := true;
  if (dmStrat.cdsDomainValidFull.RecordCount = 0) then
  begin
    dmStrat.cdsDomainValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
    dmStrat.cdsDomainValidFull.Filtered := true;
    if (dmStrat.cdsDomainValidFull.RecordCount = 0) then
    begin
      dmStrat.cdsDomainValidFull.Append;
      dmStrat.cdsDomainValidFullDOMAINID.AsString := UserSession.RecordChosen;
      dmStrat.cdsDomainValidFullValidSTATUSID.AsString := 'Check';
      dmStrat.cdsDomainValidFullDATEDONE.AsDateTime := dmUser.GetUTCDateTime;
      dmStrat.cdsDomainValidFullDONEBY.AsString := UserSession.UserID;
      dmStrat.cdsDomainValidFull.Post;
    end;
    dmStrat.cdsDomainValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
    dmStrat.cdsDomainValidFull.Filtered := true;
    dmStrat.cdsDomainValidFull.Edit;
    dmStrat.cdsDomainValidFullDOMAINID.AsString := UserSession.RecordChosen;
    dmStrat.cdsDomainValidFullVALIDSTATUSID.AsString := 'Check';
    dmStrat.cdsDomainValidFullDATEDONE.AsDateTime := dmUser.GetUTCDateTime;
    dmStrat.cdsDomainValidFullDONEBY.AsString := UserSession.UserID;
    dmStrat.cdsDomainValidFull.Post;
  end else
  begin
    dmStrat.cdsDomainValidFull.Edit;
    dmStrat.cdsDomainValidFullDOMAINID.AsString := UserSession.RecordChosen;
    dmStrat.cdsDomainValidFullVALIDSTATUSID.AsString := 'Check';
    dmStrat.cdsDomainValidFullDATEDONE.AsDateTime := dmUser.GetUTCDateTime;
    dmStrat.cdsDomainValidFull.Post;
    dmStrat.cdsDomainValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
    dmStrat.cdsDomainValidFull.Filtered := true;
  end;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDomainValidCheck.Create(WebApplication).Show;
end;

procedure TISFDomainDetails.iwbPublishClick(Sender: TObject);
begin
  try
    dmStrat.cdsDomainFor.Append;
    dmStrat.cdsDomainForDOMAINID.AsString := UserSession.RecordChosen;
    dmStrat.cdsDomainForWHOFORID.AsString := ValueForPublished;
    dmStrat.cdsDomainFor.Post;
    dmStrat.cdsDomainFor.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('not able to Publish this record');
  end;
end;

procedure TISFDomainDetails.iwbGoToParentClick(Sender: TObject);
begin
  try
    dmDV.cdsQueryDV.Close;
  except
  end;
  UserSession.ParameterChosen := dmStrat.cdsDomainQDOMAINPARENTID.AsString;
  UserSession.RecordChosen := Trim(dmStrat.cdsDomainQDOMAINPARENTID.AsString);
  if (UserSession.RecordChosen <> '0') then
  begin
    {
    dmStrat.qDomainQ.Close;
    dmStrat.qDomainQ.ParamByName('DOMAINID').AsString := UserSession.RecordChosen;
    dmStrat.cdsDomainQ.Close;
    dmStrat.cdsDomainQ.Open;
    }
    UpdateQuery2;
  end;
end;

procedure TISFDomainDetails.iwbLinkUnitsToParentDomainClick(Sender: TObject);
begin
  dmStrat.LinkUnitsToParentDomain;
end;

procedure TISFDomainDetails.iwDBnDeformationEdit(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddDeformationLink.Create(WebApplication).Show;
end;

procedure TISFDomainDetails.iwDBnEconomicFeaturesEdit(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddEconomicFeatureLink.Create(WebApplication).Show;
end;

procedure TISFDomainDetails.iwDBnLIPEdit(Sender: TObject);
begin
  //TIWAppForm(WebApplication.ActiveForm).Release;
  //TISFAddLIPLink.Create(WebApplication).Show;
end;

procedure TISFDomainDetails.iwDBnMetamorphismEdit(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddMetamorphismLink.Create(WebApplication).Show;
end;

procedure TISFDomainDetails.iwDBnStratUnitsEdit(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFAddStratUnitLink.Create(WebApplication).Show;
end;

procedure TISFDomainDetails.UpdateQuery2;
var
  i, iRec : integer;
  tmpDVLevel : integer;
  DomainIsLIP : boolean;
  tmpUser : string;
begin
  UserSession.UnitSender := usDomains;
  tmpUser := UserSession.UserID;
  try
    dmDV.cdsQueryDV.Close;
  except
  end;
  dmStrat.qDomainQ.Close;
  dmStrat.qDomainQ.ParamByName('DOMAINID').AsString := UserSession.RecordChosen;
  dmStrat.qDomainQ.ParamByName('USERID').AsString := tmpUser;
  //dmStrat.qDomainQ.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qDomainParent.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qSubDomains.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qDomainUnits.ParamByName('USERID').AsString := tmpUser;
  dmStrat.cdsDomainQ.Close;
  dmStrat.cdsDomainQ.Open;

  dmStrat.qDomainQ.Close;
  dmStrat.qDomainQ.ParamByName('DOMAINID').AsString := UserSession.RecordChosen;
  dmStrat.qDomainQ.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qDomainParent.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qSubDomains.ParamByName('USERID').AsString := tmpUser;
  dmStrat.qDomainUnits.ParamByName('USERID').AsString := tmpUser;
  dmStrat.cdsDomainQ.Close;
  dmStrat.cdsDomainQ.Open;
  DomainIsLIP := false;
  if (dmStrat.cdsDomainQDOMAINTYPEID.AsString=LIPDomainType) then DomainIsLIP := true;
  if (UserSession.LinkToDateView) then
  begin
    tmpDVLevel := dmStrat.cdsDomainQDVLEVEL.AsInteger;
    try
      dmDV.QueryDV.SQL.Clear;
      dmDV.QueryDV.SQL.Add('SELECT  DISTINCT DOMAINS.DOMAINID, ');
      dmDV.QueryDV.SQL.Add('  ISORGR30.COUNTRYABR, ISORGR30.UNITID, SUITE.UNITNAME,');
      dmDV.QueryDV.SQL.Add('  ISORGR30.MATERIALABR,ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,');
      dmDV.QueryDV.SQL.Add('  ISORGR30.TECHABR,TECHNIQUE.TECHNIQUE,');
      dmDV.QueryDV.SQL.Add('  ISORGR30.INTERPABR,ISORGR30.IAGE,ISORGR30.IAGEPERROR,ISORGR30.IAGEMERROR, ISORGR30.AGEUNITS,');
      dmDV.QueryDV.SQL.Add('  ISORGR30.LITHOLOGY,ISORGR30.RECORDID,COUNTRY.COUNTRY,MATERIAL.MATERIALDESCRIPTION,');
      dmDV.QueryDV.SQL.Add('  INTERPRETATION.INTERPRETATION,APPROACH.APPROACHDESCRIPTION,ISOSYSTEM.ISOSYSTEMNAME,');
      dmDV.QueryDV.SQL.Add('  ISORGR30.RAGE,ISORGR30.RAGEPERROR,ISORGR30.RAGEMERROR,ISOFOR.WHOFORID');
      dmDV.QueryDV.SQL.Add('FROM ISORGR30,COUNTRY,INTERPRETATION,APPROACH,MATERIAL,ISOSYSTEM,ISOFOR,TECHNIQUE,SUITE,');
      dmDV.QueryDV.SQL.Add('   DOMAINS,ISOPROVTERR');
      dmDV.QueryDV.SQL.Add('WHERE  ISORGR30.COUNTRYABR = COUNTRY.COUNTRYABR');
      dmDV.QueryDV.SQL.Add('AND (');
      dmDV.QueryDV.SQL.Add('  ISORGR30.RECORDID = ISOPROVTERR.RECORDID ');
      dmDV.QueryDV.SQL.Add('  and ISOPROVTERR.DOMAINID=DOMAINS.DOMAINID ');
      dmDV.QueryDV.SQL.Add('  and DOMAINS.DOMAINID='+UserSession.RecordChosen+')');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.MATERIALABR = MATERIAL.MATERIALABR');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.INTERPABR = INTERPRETATION.INTERPABR');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.APPROACHABR = APPROACH.APPROACHABR');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.TECHABR = TECHNIQUE.TECHABR');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.ISOTOPESYSTEM = ISOSYSTEM.ISOSYSTEM');
      dmDV.QueryDV.SQL.Add('AND ISORGR30.PREFLEVEL >= 1');
      dmDV.QueryDV.SQL.Add('AND SUITE.UNITID = ISORGR30.UNITID');
      dmDV.QueryDV.SQL.Add('AND ISOFOR.RECORDID=ISORGR30.RECORDID');
      if not UserSession.IsDeveloper then dmDV.QueryDV.SQL.Add('AND ISOFOR.WHOFORID='+''''+'PUBL'+'''');
      if not DomainIsLIP then dmDV.QueryDV.SQL.Add('AND INTERPRETATION.INTERPGROUP=1');
      if DomainIsLIP then dmDV.QueryDV.SQL.Add('AND INTERPRETATION.INTERPGROUP=2');
      dmDV.QueryDV.SQL.ADD('ORDER BY ISORGR30.RAGE,SUITE.UNITNAME,ISORGR30.MATERIALABR,');
      dmDV.QueryDV.SQL.ADD('  ISORGR30.ISOTOPESYSTEM,ISORGR30.APPROACHABR,ISORGR30.INTERPABR,');
      dmDV.QueryDV.SQL.ADD('  ISORGR30.PREFLEVEL');

      if UserSession.IsDeveloper then
      begin
        //dmUser.SetDeveloperData(dmDV.QueryDV.SQL.Text);
      end;

      dmDV.cdsQueryDV.Close;
      dmDV.cdsQueryDV.Open;
      iRec := 0;
      iRec := dmDV.cdsQueryDV.RecordCount;
    finally
    end;
  end;
  iwbPublish.Enabled := false;
  if (iRec <= 0) then
  begin
    dmDV.cdsQueryDV.Close;
    iwDBgDateView.Visible := false;
    iwlDVSortedBy.Visible := false;
    iwrDatesAvailable.Visible := false;
    iwrDateView.Visible := false;
  end else
  begin
    iwDBgDateView.Visible := true;
    iwlDVSortedBy.Visible := true;
    iwrDateView.Visible := UserSession.LinkToDateView;
    iwrDatesAvailable.Visible := UserSession.LinkToDateView;
    UpdateQuery2MinMax(tmpDVLevel,DomainIsLIP);
    dmStrat.qCountPublished.Close;
    dmStrat.qCountPublished.SQL.Clear;
    dmStrat.qCountPublished.SQL.Add('SELECT COUNT(DOMAINFOR.WHOFORID)');
    dmStrat.qCountPublished.SQL.Add('FROM DOMAINFOR');
    dmStrat.qCountPublished.SQL.Add('WHERE DOMAINFOR.DOMAINID = :ID');
    dmStrat.qCountPublished.SQL.Add('AND DOMAINFOR.WHOFORID='+''''+'PUBL'+'''');
    dmStrat.qCountPublished.ParamByName('ID').AsString := UserSession.RecordChosen;
    dmStrat.cdsCountPublished.Close;
    dmStrat.cdsCountPublished.Open;
    if ((UserSession.CanModify) and (dmStrat.cdsCountPublishedCOUNT.AsInteger < 1)) then
    begin
      iwbPublish.Enabled := true;
    end;
  end;
end;

procedure TISFDomainDetails.UpdateQuery2MinMax(tmpDVLevel : integer; DomainIsLIP : boolean);
var
  i, iRec : integer;
begin
  if (UserSession.LinkToDateView) then
  begin
    try
      dmDV.cdsDVMinMax.Close;
      dmDV.qDVMinMax.Close;
      dmDV.qDVMinMax.SQL.Clear;
      dmDV.qDVMinMax.SQL.Add('SELECT MIN(1.0*(ISORGR30.rage-isorgr30.ragemerror)) as MinAge,');
      dmDV.qDVMinMax.SQL.Add('max(1.0*(isorgr30.rage+isorgr30.rageperror)) as MaxAge');
      dmDV.qDVMinMax.SQL.Add('from ISORGR30,INTERPRETATION,ISOFOR');
      dmDV.qDVMinMax.SQL.Add('   ,DOMAINS,ISOPROVTERR');
      dmDV.qDVMinMax.SQL.Add('  where ISORGR30.RECORDID = ISOPROVTERR.RECORDID ');
      dmDV.qDVMinMax.SQL.Add('  and ISOPROVTERR.DOMAINID=DOMAINS.DOMAINID ');
      dmDV.qDVMinMax.SQL.Add('  and DOMAINS.DOMAINID='+UserSession.RecordChosen);
      dmDV.qDVMinMax.SQL.Add('AND INTERPRETATION.INTERPABR = ISORGR30.INTERPABR');
      if not DomainIsLIP then dmDV.qDVMinMax.SQL.Add('AND INTERPRETATION.INTERPGROUP=1');
      if DomainIsLIP then dmDV.qDVMinMax.SQL.Add('AND INTERPRETATION.INTERPGROUP=2');
      dmDV.qDVMinMax.SQL.Add('AND ISORGR30.PREFLEVEL >= '+''''+'1'+'''');
      dmDV.qDVMinMax.SQL.Add('AND ISOFOR.RECORDID=ISORGR30.RECORDID');
      if not UserSession.IsDeveloper then dmDV.qDVMinMax.SQL.Add('AND ISOFOR.WHOFORID='+''''+'PUBL'+'''');
      if UserSession.IsDeveloper then
      begin
        //dmUser.SetDeveloperData(dmDV.qDVMinMax.SQL.Text);
      end;
      dmDV.cdsDVMinMax.Close;
      dmDV.cdsDVMinMaxMINAGE.DisplayFormat := '###0.00';
      dmDV.cdsDVMinMaxMAXAGE.DisplayFormat := '###0.00';
      dmDV.cdsDVMinMax.Open;
    finally
    end;
  end;
end;

procedure TISFDomainDetails.iwDBgDateViewColumns0TitleClick(Sender: TObject);
begin
  dmDV.cdsQueryDV.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlDVSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDomainDetails.iwDBgDeformationColumns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsDomainDeformation.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortDeformation.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDomainDetails.iwDBgEconomicFeaturesColumns0TitleClick(
  Sender: TObject);
begin
  dmStrat.cdsDomainDeposits.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortEconomicFeatures.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDomainDetails.iwDBgLIPColumns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsDomainLIP.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlLIPSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDomainDetails.iwDBgMetamorphismColumns0TitleClick(
  Sender: TObject);
begin
  dmStrat.cdsDomainMetamorphism.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortMetamorphism.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDomainDetails.iwDBgSubDomainsColumns0Click(ASender: TObject;
  const AValue: string);
begin
  UserSession.RecordChosen := Trim(AValue);
  UpdateQuery2;
  ShowHideEditButtons;
  UserSession.ParameterChosen := Trim(AValue);
end;

procedure TISFDomainDetails.iwDBgSubDomainsColumns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsSubDomains.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortSubDomains.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDomainDetails.iwDBgUnitsColumns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsDomainUnits.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortUnits.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDomainDetails.iwbApplyUpdatesClick(Sender: TObject);
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
  try
    dmStrat.cdsDomainQ.ApplyUpdates(0);
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
    //dmUser.SetDeveloperData(RemoteNodeName);
    //dmUser.SetDeveloperData(RemoteNodeCharSet);
    //dmUser.SetDeveloperData(RemoteNodeDBName);
    //dmUser.SetDeveloperData(RemoteNodeDBType);
    //dmUser.SetDeveloperData(RemoteNodeDBVersion);
    //dmUser.SetDeveloperData(RemoteNodeSQLDialect);
    //dmUser.SetDeveloperData(RemoteNodeUserLogin);
    //dmUser.SetDeveloperData(RemoteNodeUserPassword);
    LocalTmpStringList := TStringList.Create;
    dmReplicate.qLocalNodes.Close;
    dmReplicate.cdsLocalNodes.Close;
    dmReplicate.cdsLocalNodes.Open;
    Cnt := dmReplicate.cdsLocalNodes.RecordCount;
    for i := 1 to Cnt do
    begin
      LocalNodeName := dmReplicate.cdsLocalNodesNODENAME.AsString;
      LocalNodeServer := dmReplicate.cdsLocalNodesNODESERVER.AsString;
      LocalNodePath := dmReplicate.cdsLocalNodesNODEPATH.AsString;
      LocalNodeDBName := LocalNodeServer+':'+LocalNodePath;
      //LocalNodeDBName := dmReplicate.cdsLocalNodesNODEDBNAME.AsString;
      LocalNodeDBType := dmReplicate.cdsLocalNodesNODEDBTYPE.AsString;
      LocalNodeDBVersion := dmReplicate.cdsLocalNodesNODEDBVERSION.AsString;
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
  except
    WebApplication.ShowMessage('Not able to update record');
  end;
  ShowHideEditButtons;
end;

procedure TISFDomainDetails.iwbValidateClick(Sender: TObject);
var
  HasValidityRecord : boolean;
begin
  HasValidityRecord := false;
  dmStrat.cdsDomainValid.Filter := 'ValidStatusID='+''''+'Valid'+'''';
  dmStrat.cdsDomainValid.Filtered := true;
  if (dmStrat.cdsDomainValid.RecordCount = 1) then
  begin
    HasValidityRecord := true;
  end;
  if (not HasValidityRecord) then
  begin
    dmStrat.cdsDomainValid.Filter := 'ValidStatusID='+''''+'NotYt'+'''';
    dmStrat.cdsDomainValid.Filtered := true;
    if (dmStrat.cdsDomainValid.RecordCount = 1) then
    begin
      HasValidityRecord := true;
      dmStrat.cdsDomainValid.Edit;
      dmStrat.cdsDomainValidVALIDSTATUSID.AsString := 'Valid';
      dmStrat.cdsDomainValidDONEBY.AsString := UserSession.UserID;
      dmStrat.cdsDomainValidDATEDONE.AsDateTime := dmUser.GetUTCDateTime;
      dmStrat.cdsDomainValid.Post;
    end;
    if (not HasValidityRecord) then
    begin
      dmStrat.cdsDomainValid.Append;
      dmStrat.cdsDomainValidDOMAINID.AsString := dmStrat.cdsDomainQDOMAINID.AsString;
      dmStrat.cdsDomainValidVALIDSTATUSID.AsString := 'Valid';
      dmStrat.cdsDomainValidDATEDONE.AsDateTime := dmUser.GetUTCDateTime;
      dmStrat.cdsDomainValidDONEBY.AsString := UserSession.UserID;
      dmStrat.cdsDomainValid.Post;
    end;
    try
      dmStrat.cdsDomainValid.ApplyUpdates(0);
    except
      WebApplication.ShowMessage('Not able to update validation status');
    end;
  end;
  dmStrat.cdsDomainValid.Filtered := false;
  dmStrat.cdsDomainQ.Close;
  dmStrat.cdsDomainQ.Open;
end;

procedure TISFDomainDetails.iwbClearObjectionClick(Sender: TObject);
begin
  UserSession.RecordChosen := dmStrat.cdsDomainQDOMAINID.AsString;
  dmStrat.qDomainValidFull.Close;
  dmStrat.qDomainValidFull.ParamByName('DOMAINID').AsString := UserSession.RecordChosen;
  dmStrat.cdsDomainValidFull.Close;
  dmStrat.cdsDomainValidFull.Open;
  dmStrat.cdsDomainValidFull.Filter := 'ValidStatusID='+''''+'Check'+'''';
  dmStrat.cdsDomainValidFull.Filtered := true;
  if (dmStrat.cdsDomainValidFull.RecordCount > 0) then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDomainValidCheck.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('No objection to clear');
  end;
end;

procedure TISFDomainDetails.iwbDeleteRefLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmStrat.DeleteRefRecord(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsDomainQ.Close;
    dmStrat.cdsDomainQ.Open;
  end;
end;

procedure TISFDomainDetails.iwbDeleteLinkToApplicationsClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmStrat.DeleteLinkToApplicationRecord(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsDomainQ.Close;
    dmStrat.cdsDomainQ.Open;
  end else
  begin
    WebApplication.ShowMessage('Could not delete linked record');
  end;
end;

procedure TISFDomainDetails.iwbDeleteLinkToWhoForClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  {
  dmStrat.DeleteDomainWhoForLinkRecord(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsDomainQ.Close;
    dmStrat.cdsDomainQ.Open;
  end else
  begin
    WebApplication.ShowMessage('Could not delete linked record');
  end;
  }
end;

procedure TISFDomainDetails.iwbAddDeformationLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertDeformationLink(WasSuccessful);
  if WasSuccessful then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddDeformationLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

procedure TISFDomainDetails.iwbAddDomainToDateViewClick(Sender: TObject);
var
  tmpDomainName, tmpDomainID, tmpDomainTypeID,
  tmpContinentID, tmpDVLevel : string;
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  tmpDomainName := dmStrat.cdsDomainQDOMAINNAME.AsString;
  tmpDomainTypeID := dmStrat.cdsDomainQDOMAINTYPEID.AsString;
  tmpDomainID := dmStrat.cdsDomainQDOMAINID.AsString;
  tmpContinentID := dmStrat.cdsDomainQCONTINENTID.AsString;
  tmpDVLevel := dmStrat.cdsDomainQDVLEVEL.AsString;
  dmDV.AddDomainToDV(tmpDomainName,tmpDomainID,tmpContinentID,tmpDomainTypeID,tmpDVLevel);
end;

procedure TISFDomainDetails.iwbAddEconomicFeatureLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertEconomicFeatureLink(WasSuccessful);
  if WasSuccessful then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddEconomicFeatureLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

procedure TISFDomainDetails.iwbAddLIPLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertDomainLIPLink(WasSuccessful);
  if WasSuccessful then
  begin
    //TIWAppForm(WebApplication.ActiveForm).Release;
    //TISFAddDomainLIPLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

procedure TISFDomainDetails.iwbAddMetamorphismLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertMetamorphismLink(WasSuccessful);
  if WasSuccessful then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddMetamorphismLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

procedure TISFDomainDetails.iwbAddStratUnitLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertStratUnitLink(WasSuccessful);
  if WasSuccessful then
  begin
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddStratUnitLink.Create(WebApplication).Show;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

procedure TISFDomainDetails.iwbAddWhoForClick(Sender: TObject);
begin
  WebApplication.ShowMessage('Not yet implemented');
end;

procedure TISFDomainDetails.iwbDeleteDomainLinkClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  dmStrat.DeleteDomainRecord(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsDomainQ.Close;
    dmStrat.cdsDomainQ.Open;
  end else
  begin
    WebApplication.ShowMessage('Could not delete linked record');
  end;
end;

end.
