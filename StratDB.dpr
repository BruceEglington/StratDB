program StratDB;

uses
  //madExcept,
  //madLinkDisAsm,
  //madListHardware,
  //madListProcesses,
  //madListModules,
  IWStart,
  Forms,
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  IWRtlFix in '..\IntraWeb\IWRtlFix.pas',
  IWStrat_uMain in 'IWStrat_uMain.pas' {Form1},
  IWStrat_addcommoditylink in 'IWStrat_addcommoditylink.pas' {ISFAddCommodityLink: TIWAppForm},
  IWStrat_addcorrelativelink in 'IWStrat_addcorrelativelink.pas' {ISFAddCorrelativeLink: TIWAppForm},
  IWStrat_adddeformationlink in 'IWStrat_adddeformationlink.pas' {ISFAddDeformationLink: TIWAppForm},
  IWStrat_adddomaindepositlink in 'IWStrat_adddomaindepositlink.pas' {ISFAddDomainDepositLink: TIWAppForm},
  IWStrat_adddomainlink in 'IWStrat_adddomainlink.pas' {ISFAddDomainLink: TIWAppForm},
  IWStrat_adddomainLIPlink in 'IWStrat_adddomainLIPlink.pas' {ISFAddDomainLIPLink: TIWAppForm},
  IWStrat_addeconomicfeaturelink in 'IWStrat_addeconomicfeaturelink.pas' {ISFAddEconomicFeatureLink: TIWAppForm},
  IWStrat_addgislink in 'IWStrat_addgislink.pas' {ISFAddGISLink: TIWAppForm},
  IWStrat_addlinktoapplication in 'IWStrat_addlinktoapplication.pas' {ISFAddLinkToApplication: TIWAppForm},
  IWStrat_addlipdomainlink in 'IWStrat_addlipdomainlink.pas' {ISFAddLIPDomainLink: TIWAppForm},
  IWStrat_addlipmorphologylink in 'IWStrat_addlipmorphologylink.pas' {ISFAddLIPMorphologyLink: TIWAppForm},
  IWStrat_addlipunitlink in 'IWStrat_addlipunitlink.pas' {ISFAddLIPUnitLink: TIWAppForm},
  IWStrat_addmetamorphismlink in 'IWStrat_addmetamorphismlink.pas' {ISFAddMetamorphismLink: TIWAppForm},
  IWStrat_addproject in 'IWStrat_addproject.pas' {ISFAddProject: TIWAppForm},
  IWStrat_addprecedinglink in 'IWStrat_addprecedinglink.pas' {ISFAddPrecedingLink: TIWAppForm},
  IWStrat_addreflink in 'IWStrat_addreflink.pas' {ISFAddRefLink: TIWAppForm},
  IWStrat_addspecialfeaturelink in 'IWStrat_addspecialfeaturelink.pas' {ISFAddSpecialFeatureLink: TIWAppForm},
  IWStrat_addstratunitlink in 'IWStrat_addstratunitlink.pas' {ISFAddStratUnitLink: TIWAppForm},
  IWStrat_addsucceedinglink in 'IWStrat_addsucceedinglink.pas' {ISFAddSucceedingLink: TIWAppForm},
  IWStrat_addsynonymlink in 'IWStrat_addsynonymlink.pas' {ISFAddSynonymLink: TIWAppForm},
  IWStrat_domainzircon in 'IWStrat_domainzircon.pas' {ISFDomainZircon: TIWAppForm},
  IWStrat_chartdomain in 'IWStrat_chartdomain.pas' {ISFChartDomain: TIWAppForm},
  IWStrat_chartedit in 'IWStrat_chartedit.pas' {ISFChartEdit: TIWAppForm},
  IWStrat_charts in 'IWStrat_charts.pas' {ISFCharts: TIWAppForm},
  IWStrat_clantypes in 'IWStrat_clantypes.pas' {ISFClanTypes: TIWAppForm},
  IWStrat_constants in 'IWStrat_constants.pas',
  IWStrat_constvalues in 'IWStrat_constvalues.pas',
  IWStrat_countries in 'IWStrat_countries.pas' {ISFCountries: TIWAppForm},
  IWStrat_definedepositquery in 'IWStrat_definedepositquery.pas' {ISFDefineDepositQuery: TIWAppForm},
  IWStrat_definedomainquery2 in 'IWStrat_definedomainquery2.pas' {ISFDefineDomainQuery2: TIWAppForm},
  IWStrat_defineLIPquery in 'IWStrat_defineLIPquery.pas' {ISFDefineLIPQuery: TIWAppForm},
  IWStrat_definenewcontinent in 'IWStrat_definenewcontinent.pas' {ISFDefineNewContinent: TIWAppForm},
  IWStrat_definequery in 'IWStrat_definequery.pas' {ISFDefineQuery: TIWAppForm},
  IWStrat_definequery1 in 'IWStrat_definequery1.pas' {ISFDefineQuery1: TIWAppForm},
  IWStrat_definequery2 in 'IWStrat_definequery2.pas' {ISFDefineQuery2: TIWAppForm},
  IWStrat_deformationtypes in 'IWStrat_deformationtypes.pas' {ISFDeformationTypes: TIWAppForm},
  IWStrat_depositdetails in 'IWStrat_depositdetails.pas' {ISFDepositDetails: TIWAppForm},
  IWStrat_details in 'IWStrat_details.pas' {ISFDetails: TIWAppForm},
  IWStrat_directions in 'IWStrat_directions.pas' {ISFDirections: TIWAppForm},
  IWStrat_dm in 'IWStrat_dm.pas' {dmStrat: TDataModule},
  IWStrat_dmC in 'IWStrat_dmC.pas' {dmStratC: TDataModule},
  IWStrat_dmD in 'IWStrat_dmD.pas' {dmStratD: TDataModule},
  IWStrat_dmDV in 'IWStrat_dmDV.pas' {dmDV: TDataModule},
  IWStrat_dmLIP in 'IWStrat_dmLIP.pas' {dmLIP: TDataModule},
  IWStrat_domaindetails in 'IWStrat_domaindetails.pas' {ISFDomainDetails: TIWAppForm},
  IWStrat_domains in 'IWStrat_domains.pas' {ISFDomains: TIWAppForm},
  IWStrat_domaintypes in 'IWStrat_domaintypes.pas' {ISFDomainTypes: TIWAppForm},
  IWStrat_domainvalidcheck in 'IWStrat_domainvalidcheck.pas' {ISFDomainValidCheck: TIWAppForm},
  IWStrat_ductilities in 'IWStrat_ductilities.pas' {ISFDuctilities: TIWAppForm},
  IWStrat_framemenu in 'IWStrat_framemenu.pas' {ISFFrameMenu: TFrame},
  IWStrat_frDepositGrid in 'IWStrat_frDepositGrid.pas' {ISFDepositGrid: TIWAppForm},
  IWStrat_frDomainGrid in 'IWStrat_frDomainGrid.pas' {ISFDomainGrid: TIWAppForm},
  IWStrat_frLIPGrid in 'IWStrat_frLIPGrid.pas' {ISFLIPGrid: TIWAppForm},
  IWStrat_frTopBar in 'IWStrat_frTopBar.pas' {ISFTopBarStrat: TFrame},
  IWStrat_LIPdetails in 'IWStrat_LIPdetails.pas' {ISFLIPDetails: TIWAppForm},
  IWStrat_lips in 'IWStrat_lips.pas' {ISFLIPS: TIWAppForm},
  IWStrat_maps in 'IWStrat_maps.pas' {ISFMaps: TIWAppForm},
  IWStrat_metamorphicgrades in 'IWStrat_metamorphicgrades.pas' {ISFMetamorphicGrades: TIWAppForm},
  IWStrat_newrecord1 in 'IWStrat_newrecord1.pas' {ISFNewRecord1: TIWAppForm},
  IWStrat_newrecord2 in 'IWStrat_newrecord2.pas' {ISFNewRecord2: TIWAppForm},
  IWStrat_newrecord3 in 'IWStrat_newrecord3.pas' {ISFNewRecord3: TIWAppForm},
  IWStrat_options in 'IWStrat_options.pas' {ISFOptions: TIWAppForm},
  IWStrat_orogenies in 'IWStrat_orogenies.pas' {ISFOrogenies: TIWAppForm},
  IWStrat_ranks in 'IWStrat_ranks.pas' {ISFRanks: TIWAppForm},
  IWStrat_refdetail in 'IWStrat_refdetail.pas' {ISFRefDetails: TIWAppForm},
  IWStrat_referencequery in 'IWStrat_referencequery.pas' {ISFReferenceQuery: TIWAppForm},
  IWStrat_references in 'IWStrat_references.pas' {ISFReferences: TIWAppForm},
  IWStrat_rockclasses in 'IWStrat_rockclasses.pas' {ISFRockClasses: TIWAppForm},
  IWStrat_sedenv in 'IWStrat_sedenv.pas' {ISFSedEnv: TIWAppForm},
  IWStrat_selectchart in 'IWStrat_selectchart.pas' {ISFSelectChart: TIWAppForm},
  IWStrat_selectgraph in 'IWStrat_selectgraph.pas' {ISFSelectGraph: TIWAppForm},
  IWStrat_selectmap in 'IWStrat_selectmap.pas' {ISFSelectMap: TIWAppForm},
  IWStrat_settings in 'IWStrat_settings.pas' {ISFSettings: TIWAppForm},
  IWStrat_specialfeatures in 'IWStrat_specialfeatures.pas' {ISFSpecialFeatures: TIWAppForm},
  IWStrat_timescale in 'IWStrat_timescale.pas' {ISFTimescale: TIWAppForm},
  IWStrat_userforlist in 'IWStrat_userforlist.pas' {ISFUserForList: TIWAppForm},
  IWStrat_userwhofor in 'IWStrat_userwhofor.pas' {ISFUserWhoFor: TIWAppForm},
  IWStrat_validcheck in 'IWStrat_validcheck.pas' {ISFValidCheck: TIWAppForm},
  usr_constants in '..\WebUserIW\usr_constants.pas',
  usr_insufficientright in '..\WebUserIW\usr_insufficientright.pas' {ISFInsufficientRights: TIWAppForm},
  usr_uChangeDetails in '..\WebUserIW\usr_uChangeDetails.pas' {ISFChangeUserDetails: TIWAppForm},
  usr_uDonate in '..\WebUserIW\usr_uDonate.pas' {ISFDonate: TIWAppForm},
  usr_uForgotten in '..\WebUserIW\usr_uForgotten.pas' {ISFForgotten: TIWAppForm},
  usr_uLogin in '..\WebUserIW\usr_uLogin.pas' {ISFLogin: TIWAppForm},
  usr_uRegister in '..\WebUserIW\usr_uRegister.pas' {ISFRegister: TIWAppForm},
  usr_uRenew in '..\WebUserIW\usr_uRenew.pas' {ISFRenew: TIWAppForm},
  usrIW_dm in '..\WebUserIW\usrIW_dm.pas' {dmUser: TDataModule},
  usr_uDBInterface in '..\WebUserIW\usr_uDBInterface.pas',
  IWStrat_GrainSources in 'IWStrat_GrainSources.pas' {ISFGrainSources: TIWAppForm},
  IWStrat_chartdetails in 'IWStrat_chartdetails.pas' {ISFChartDetails: TIWAppForm},
  usr_cookies in '..\WebUserIW\usr_cookies.pas',
  DVIW_mathproc in '..\DateViewIW2\DVIW_mathproc.pas',
  IWStrat_frGrid in 'IWStrat_frGrid.pas' {ISFGrid: TIWAppForm},
  IWStrat_continents in 'IWStrat_continents.pas' {ISFContinents: TIWAppForm},
  IWStrat_dmopt in 'IWStrat_dmopt.pas' {dmOpt: TDataModule},
  IWStrat_addorogeny in 'IWStrat_addorogeny.pas' {ISFAddOrogeny: TIWAppForm},
  IWCompTeeChart in '..\TeeChart__for_IntraWeb\IWCompTeeChart.pas',
  IWStrat_frGridGrainProbabilityUnits in 'IWStrat_frGridGrainProbabilityUnits.pas' {ISFGridGrainProbabilityUnits: TIWAppForm},
  Allsorts in '..\Eglington Delphi common code items\Allsorts.pas',
  DB_List_Combo in '..\Eglington Delphi common code items\DB_List_Combo.pas',
  ErrCodes in '..\Eglington Delphi common code items\ErrCodes.pas',
  Mathproc in '..\Eglington Delphi common code items\Mathproc.pas',
  NumRecipes in '..\Eglington Delphi common code items\NumRecipes.pas',
  NumRecipes_varb in '..\Eglington Delphi common code items\NumRecipes_varb.pas';

{$R *.res}

begin
  TIWStart.Execute(True);
end.
