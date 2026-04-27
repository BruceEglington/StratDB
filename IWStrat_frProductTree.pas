unit IWStrat_frProductTree;

interface

uses
  Windows, Messages, SysUtils, {$IFNDEF VER130}Variants,{$ENDIF} Classes, Graphics, Controls, Forms,
  Dialogs, IWBaseControl, IWControl, IWCompLabel,
  IWHTMLControls, IWExtCtrls, IWHTMLTag, IWCompRectangle,
  IWContainer, IWRegion, IWVCLBaseControl, IWBaseHTMLControl,
  IWVCLBaseContainer, IWHTMLContainer, jpeg, IWStrat_framemenu2;

type
  TISFProductTree = class(TFrame)
    IWFrameRegion: TIWRegion;
    rectRight: TIWRectangle;
    iwregPageLinks: TIWRegion;
    iwlMainPage: TIWLink;
    iwlDefineQuery: TIWLink;
    iwlOptions: TIWLink;
    iwlMetamorphicGrades: TIWLink;
    iwlNewRecord: TIWLink;
    iwlOtherLookups: TIWLink;
    IWImage1: TIWImage;
    iwlSelectChart: TIWLink;
    iwlDomains: TIWLink;
    iwlOrogenies: TIWLink;
    iwlCharts: TIWLink;
    iwlMaps: TIWLink;
    iwlDomainTypes: TIWLink;
    iwlDefineDomainQuery: TIWLink;
    iwlTimeScale: TIWLink;
    iwlSelectGraph: TIWLink;
    iwlDefineLIPQuery: TIWLink;
    iwlLIPs: TIWLink;
    iwlDuctilities: TIWLink;
    iwlOrogenyTypes: TIWLink;
    iwlDirections: TIWLink;
    iwlReferences: TIWLink;
    iwlDefineDepositQuery: TIWLink;
    procedure iwlMainPageClick(Sender: TObject);
    procedure iwlDefineQueryClick(Sender: TObject);
    procedure iwlOptionsClick(Sender: TObject);
    procedure iwlUnitsClick(Sender: TObject);
    procedure iwlUnitAreasClick(Sender: TObject);
    procedure iwlMetamorphicGradesClick(Sender: TObject);
    procedure iwlNewRecordClick(Sender: TObject);
    procedure iwlOtherLookupsClick(Sender: TObject);
    procedure iwlSelectChartClick(Sender: TObject);
    procedure iwlChartsClick(Sender: TObject);
    procedure iwlDomainsClick(Sender: TObject);
    procedure iwlOrogeniesClick(Sender: TObject);
    procedure iwlMapsClick(Sender: TObject);
    procedure iwlDomainTypesClick(Sender: TObject);
    procedure iwlDefineDomainQueryClick(Sender: TObject);
    procedure iwlTimeScaleClick(Sender: TObject);
    procedure iwlSelectGraphClick(Sender: TObject);
    procedure iwlLIPsClick(Sender: TObject);
    procedure iwlDefineLIPQueryClick(Sender: TObject);
    procedure iwlDuctilitiesClick(Sender: TObject);
    procedure iwlOrogenyTypesClick(Sender: TObject);
    procedure iwlDirectionsClick(Sender: TObject);
    procedure iwlReferencesClick(Sender: TObject);
    procedure iwlDefineDepositQueryClick(Sender: TObject);
  protected
  public
  end;

implementation
{$R *.dfm}

uses
  IWStrat_dm,
  IWColor, IWAppForm, IWForm, IWInit,
//  uDocumentation,
  ServerController, IWApplication, IWStrat_uMain,
  IWStrat_definequery, IWStrat_options,
  IWStrat_constants, IWStrat_selectchart, IWStrat_metamorphicgrades,
  IWStrat_orogenies, IWStrat_charts, IWStrat_domains, IWStrat_maps,
  IWStrat_domaintypes, IWStrat_timescale, IWStrat_selectgraph, IWStrat_lips,
  IWStrat_newrecord1, IWStrat_ductilities, IWStrat_deformationtypes,
  IWStrat_directions, IWStrat_references, IWStrat_definedepositquery;

{ TISFProductTree }

procedure TISFProductTree.iwlMainPageClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

procedure TISFProductTree.iwlMapsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFMaps.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlSelectChartClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFSelectChart.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlSelectGraphClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFSelectGraph.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlChartsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFCharts.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlDefineDepositQueryClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    if UserSession.CanModify
    then UserSession.UnitSender := usDeposits
    else UserSession.UnitSender := usDeposits;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFDefineDepositQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlDefineDomainQueryClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    if UserSession.CanModify
    then UserSession.UnitSender := usDomains
    else UserSession.UnitSender := usDomains;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFDefineQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlDefineLIPQueryClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    if UserSession.CanModify
    then UserSession.UnitSender := usLIPs
    else UserSession.UnitSender := usLIPs;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFDefineQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlDefineQueryClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    if UserSession.CanModify
    then UserSession.UnitSender := usDetailsEdit
    else UserSession.UnitSender := usDetails;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFDefineQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlDirectionsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFDirections.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlDomainsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFDomains.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlDomainTypesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFDomainTypes.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlDuctilitiesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFDuctilities.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlLIPsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFLIPS.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlTimeScaleClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFTimescale.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlOrogeniesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFOrogenies.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlOrogenyTypesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFDeformationTypes.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlOptionsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFOptions.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlUnitsClick(Sender: TObject);
begin
  {
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := 'Units';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFUnitQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
  }
end;

procedure TISFProductTree.iwlUnitAreasClick(Sender: TObject);
begin
  {
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := 'UnitAreas';
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFUnitQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
  }
end;

procedure TISFProductTree.iwlMetamorphicGradesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFMetamorphicGrades.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlNewRecordClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    if UserSession.CanInsert then
    begin
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      TIWAppForm(WebApplication.ActiveForm).Hide;
      TISFNewRecord1.Create(WebApplication).Show;
    end;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFProductTree.iwlOtherLookupsClick(Sender: TObject);
begin
  {
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFOtherLookups.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
  }
end;

procedure TISFProductTree.iwlReferencesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFReferences.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

end.
