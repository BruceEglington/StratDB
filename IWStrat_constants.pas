unit IWStrat_constants;

interface

const
  ValueForUndefinedContinentID = 'UND';
  ValueForUndefinedCountryID = 'UND';
  ValueForPublished = 'PUBL';

  usDetails = 'Details';
  usDetailsEdit = 'DetailsEdit';
  usReferences = 'References';
  usDomains = 'Domains';
  usGrid = 'Grid';
  usGraph = 'Graph';
  usUnits = 'Units';
  usLIPs = 'LIPs';
  usDeposits = 'Deposits';
  usCharts = 'Charts';
  usChartDomains = 'ChartDomains';
  usChartLIPs = 'ChartLIPs';
  usGrainProbabilitiesDetritalUPb = 'GrainUPb';
  usGrainSourcesDetritalUPb = 'GrainSources';

  MaxGuestRecords = 10;
  DefaultMapFolder = 'files/maps/';
  DefaultMapFileName = 'country.shp';
  DefaultMapDBFName = 'country.dbf';
  DefaultFlexCellFolder = 'wwwroot/files/flexcell/';
  DefaultMissingValue = -999.99;
  LIPDomainType = 'LIP';

  gtInterpretationProbabilityCurves = 'Interpretation probability curves';

  nt100Percent = 'Major peak normalised to 100%';
  ntTrueProbability = 'True probability (normalised to number of data)';
  Steps        = 2500;
  SpectrumStartAge = 0.0;
  SpectrumEndAge = 4600.0;
  MaxSeries  = 6;
  MaxSamp    = 1000;

  NothingChosen = 'nothing';
  Copyright1 = '(c) Dr Bruce Eglington (2004-2022)';
  Copyright2 = 'StratDB / IGCP 509/648 Database';


implementation

end.
