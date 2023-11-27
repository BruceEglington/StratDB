unit IWStrat_framemenu;

interface

uses
  SysUtils, Classes, Controls, Forms,
  IWVCLBaseContainer, IWColor, IWContainer, IWRegion, Menus, IWCompMenu, jpeg,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompExtCtrls,
  IWHTMLContainer, ImgList, Graphics, IWHTML40Container, System.ImageList;

type
  TISFFrameMenu = class(TFrame)
    IWFrameRegion: TIWRegion;
    IWRegion1: TIWRegion;
    IWRegion2: TIWRegion;
    IWImageStratDB: TIWImage;
    MainMenu1: TMainMenu;
    Select1: TMenuItem;
    SelectUnit1: TMenuItem;
    SelectDomain1: TMenuItem;
    SelectDeposit1: TMenuItem;
    SelectLargeIgneousProvince1: TMenuItem;
    SelectChart1: TMenuItem;
    LookupTables1: TMenuItem;
    Options1: TMenuItem;
    New1: TMenuItem;
    NewUnit1: TMenuItem;
    NewDomain1: TMenuItem;
    NewLargeIgneousProvince1: TMenuItem;
    NewDeposit1: TMenuItem;
    LookupsCharts1: TMenuItem;
    LookupsDomainTypes1: TMenuItem;
    LookupsMaps1: TMenuItem;
    LookupsMetamorphicGrades1: TMenuItem;
    LookupOrogenies1: TMenuItem;
    LookupsTimescale1: TMenuItem;
    LookupsDuctilityTypes1: TMenuItem;
    LookupsOrogenyTypes1: TMenuItem;
    LookupsDirections1: TMenuItem;
    LookupsReferences1: TMenuItem;
    MainPage1: TMenuItem;
    IWRegion3: TIWRegion;
    SelectGraph1: TMenuItem;
    ImageList1: TImageList;
    IWImageIGCP509: TIWImage;
    LookupsSedEnvironments: TMenuItem;
    NewChart1: TMenuItem;
    OptionsUser1: TMenuItem;
    OptionsWhoForMembers1: TMenuItem;
    OptionsWhoForGroups1: TMenuItem;
    LookupsClanTypes1: TMenuItem;
    NewReference1: TMenuItem;
    IWMenu1: TIWMenu;
    LookupsRockClasses: TMenuItem;
    LookupsGeodynamicSettings: TMenuItem;
    LookupsRanks: TMenuItem;
    LookupsSpecialFeatures: TMenuItem;
    LookupsContinents: TMenuItem;
    LookupsCountries: TMenuItem;
    SelectGrainProbabilities1: TMenuItem;
    SelectGrainSources1: TMenuItem;
    N1: TMenuItem;
    LookupsUserProj1: TMenuItem;
    procedure SelectUnit1Click(Sender: TObject);
    procedure SelectChart1Click(Sender: TObject);
    procedure SelectDeposit1Click(Sender: TObject);
    procedure SelectDomain1Click(Sender: TObject);
    procedure SelectLargeIgneousProvince1Click(Sender: TObject);
    procedure LookupsCharts1Click(Sender: TObject);
    procedure SelectGraph1Click(Sender: TObject);
    procedure LookupsDirections1Click(Sender: TObject);
    procedure LookupsDomainTypes1Click(Sender: TObject);
    procedure LookupsDuctilityTypes1Click(Sender: TObject);
    procedure LookupsMaps1Click(Sender: TObject);
    procedure LookupsMetamorphicGrades1Click(Sender: TObject);
    procedure LookupOrogenies1Click(Sender: TObject);
    procedure LookupsOrogenyTypes1Click(Sender: TObject);
    procedure LookupsReferences1Click(Sender: TObject);
    procedure LookupsTimescale1Click(Sender: TObject);
    procedure NewDomain1Click(Sender: TObject);
    procedure NewLargeIgneousProvince1Click(Sender: TObject);
    procedure MainPage1Click(Sender: TObject);
    procedure NewDeposit1Click(Sender: TObject);
    procedure NewUnit1Click(Sender: TObject);
    procedure LookupsSedEnvironmentsClick(Sender: TObject);
    procedure NewChart1Click(Sender: TObject);
    procedure OptionsUser1Click(Sender: TObject);
    procedure OptionsWhoForMembers1Click(Sender: TObject);
    procedure OptionsWhoForGroups1Click(Sender: TObject);
    procedure LookupsClanTypes1Click(Sender: TObject);
    procedure LookupsRockClassesClick(Sender: TObject);
    procedure LookupsGeodynamicSettingsClick(Sender: TObject);
    procedure LookupsRanksClick(Sender: TObject);
    procedure LookupsSpecialFeaturesClick(Sender: TObject);
    procedure LookupsContinentsClick(Sender: TObject);
    procedure LookupsCountriesClick(Sender: TObject);
    procedure SelectGrainProbabilities1Click(Sender: TObject);
    procedure SelectGrainSources1Click(Sender: TObject);
    procedure LookupsUserProj1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  IWAppForm, IWForm, IWInit,
  ServerController,
  IWStrat_constants,
  IWStrat_definequery, IWStrat_options,
  IWStrat_selectchart, IWStrat_metamorphicgrades,
  IWStrat_orogenies, IWStrat_charts, IWStrat_domains, IWStrat_maps,
  IWStrat_domaintypes, IWStrat_timescale, IWStrat_selectgraph, IWStrat_lips,
  IWStrat_newrecord1, IWStrat_ductilities, IWStrat_deformationtypes,
  IWStrat_directions, IWStrat_references, IWStrat_definedepositquery,
  IWStrat_sedenv, IWStrat_referencequery, IWStrat_userwhofor,
  IWStrat_userforlist, IWStrat_clantypes, IWStrat_rockclasses, IWStrat_settings,
  IWStrat_ranks, IWStrat_specialfeatures, IWStrat_continents, IWStrat_countries,
  IWStrat_uMain, IWStrat_GrainSources, IWStrat_addproject;

procedure TISFFrameMenu.NewChart1Click(Sender: TObject);
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

procedure TISFFrameMenu.LookupOrogenies1Click(Sender: TObject);
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

procedure TISFFrameMenu.LookupsCharts1Click(Sender: TObject);
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

procedure TISFFrameMenu.LookupsClanTypes1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFClanTypes.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsContinentsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFContinents.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsCountriesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFCountries.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsDirections1Click(Sender: TObject);
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

procedure TISFFrameMenu.LookupsDomainTypes1Click(Sender: TObject);
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

procedure TISFFrameMenu.LookupsDuctilityTypes1Click(Sender: TObject);
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

procedure TISFFrameMenu.LookupsGeodynamicSettingsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFSettings.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsMaps1Click(Sender: TObject);
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

procedure TISFFrameMenu.LookupsMetamorphicGrades1Click(Sender: TObject);
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

procedure TISFFrameMenu.LookupsOrogenyTypes1Click(Sender: TObject);
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

procedure TISFFrameMenu.LookupsRanksClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFRanks.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsReferences1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFReferenceQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsRockClassesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFRockClasses.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsSedEnvironmentsClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFSedEnv.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsSpecialFeaturesClick(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFSpecialFeatures.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.LookupsTimescale1Click(Sender: TObject);
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

procedure TISFFrameMenu.LookupsUserProj1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFAddProject.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.MainPage1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFMain.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.NewDeposit1Click(Sender: TObject);
begin
  {}
end;

procedure TISFFrameMenu.NewDomain1Click(Sender: TObject);
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

procedure TISFFrameMenu.NewLargeIgneousProvince1Click(Sender: TObject);
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

procedure TISFFrameMenu.NewUnit1Click(Sender: TObject);
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

procedure TISFFrameMenu.OptionsUser1Click(Sender: TObject);
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

procedure TISFFrameMenu.OptionsWhoForGroups1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFUserForList.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.OptionsWhoForMembers1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFUserWhoFor.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.SelectChart1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := usCharts;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFSelectChart.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.SelectDeposit1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    if UserSession.CanModify
    then UserSession.UnitSender := usDeposits
    else UserSession.UnitSender := usDeposits;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFDefineQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.SelectDomain1Click(Sender: TObject);
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

procedure TISFFrameMenu.SelectGrainProbabilities1Click(Sender: TObject);
begin
  //select units or select domains
  //select isotope system and interpretation (U-Pb and detrital; Lu-Hf and detrital; Sm-Nd and TDM; etc)
  //for units version, select all raw data samples for the units selected
  //calculate probability curves for each unit
  //
  //Possible plots
  // 1) x axis value is detrital age; y axis value is unit age plus some proportion of the probability distribution value
  // 2) x axis is detrital age; y axis is unit age; line thickness is some proportion of probability distribution value
  //
  // could have 3-D versions of these
  // 3) x axis is detrital age; y axis is unit age; z axis is probability distribution value
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := usGrainProbabilitiesDetritalUPb;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFDefineQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.SelectGrainSources1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := usGrainSourcesDetritalUPb;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFDefineQuery.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.SelectGraph1Click(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UserSession.UnitSender := usGraph;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    //TISFSelectGraph.Create(WebApplication).Show;
    //TIWChartInterpretation.Create(WebApplication).Show;
  end else
  begin
    UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
  end;
end;

procedure TISFFrameMenu.SelectLargeIgneousProvince1Click(Sender: TObject);
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

procedure TISFFrameMenu.SelectUnit1Click(Sender: TObject);
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

end.