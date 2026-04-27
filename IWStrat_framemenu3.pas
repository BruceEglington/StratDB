unit IWStrat_framemenu3;

interface

uses
  SysUtils, Classes, Controls, Forms,
  IWVCLBaseContainer, IWColor, IWContainer, IWRegion, IWVCLBaseControl,
  IWBaseControl, IWBaseHTMLControl, IWControl, IWCompLabel, IWHTMLContainer,
  Menus, IWCompMenu, IWExtCtrls, ImgList;

type
  TIWFrame2 = class(TFrame)
    IWFrameRegion: TIWRegion;
    MainMenu1: TMainMenu;
    Select1: TMenuItem;
    Graph1: TMenuItem;
    IWMenu1: TIWMenu;
    SelectUnits1: TMenuItem;
    SelectChart1: TMenuItem;
    SelectDomains1: TMenuItem;
    SelectLIPs1: TMenuItem;
    Lookups1: TMenuItem;
    LookupDomains1: TMenuItem;
    LookupLIPs1: TMenuItem;
    LookupDeposits1: TMenuItem;
    Options1: TMenuItem;
    Mainpage1: TMenuItem;
    New1: TMenuItem;
    NewUnit1: TMenuItem;
    NewDomain1: TMenuItem;
    NewLIP1: TMenuItem;
    NewDeposit1: TMenuItem;
    LookupCharts1: TMenuItem;
    LookupDomainTypes1: TMenuItem;
    LookupMaps1: TMenuItem;
    LookupMetamorphicGrades1: TMenuItem;
    LookupOrogenies1: TMenuItem;
    LookupOrogenyTypes1: TMenuItem;
    LookupDuctilityTypes1: TMenuItem;
    LookupDirections1: TMenuItem;
    LookupReferences1: TMenuItem;
    LookupTimescale1: TMenuItem;
    IWRegion1: TIWRegion;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.