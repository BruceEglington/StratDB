unit IWStrat_framemenu2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompMenu, Menus;

type
  TFrame1 = class(TFrame)
    MainMenu1: TMainMenu;
    D1: TMenuItem;
    Select1: TMenuItem;
    Lookups1: TMenuItem;
    imescale1: TMenuItem;
    Options1: TMenuItem;
    MainPage1: TMenuItem;
    byUnit1: TMenuItem;
    byDomain1: TMenuItem;
    byLIP1: TMenuItem;
    Chart1: TMenuItem;
    Graph1: TMenuItem;
    Charts1: TMenuItem;
    Domains1: TMenuItem;
    DomainTypes1: TMenuItem;
    LIPs1: TMenuItem;
    Maps1: TMenuItem;
    MetamorphicGrades1: TMenuItem;
    Orogenies1: TMenuItem;
    OrogenyTypes1: TMenuItem;
    DuctilityTypes1: TMenuItem;
    VergenceDirections1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
