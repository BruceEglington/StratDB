unit IWStrat_newrecord2;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  IWBaseControl, IWControl, IWCompLabel, Controls,
  Forms, IWCompListbox, IWDBStdCtrls, IWCompCheckbox,
  IWHTMLControls, IWCompButton, IWCompText, DBClient, IWVCLBaseControl,
  IWBaseHTMLControl, IWCompRectangle, IWStrat_frTopBar;

type
  TISFNewRecord2 = class(TIWAppForm)
    iwbNextStageOfQuery: TIWButton;
    iwcbArea: TIWComboBox;
    IWLabel1: TIWLabel;
    IWText1: TIWText;
    rectLeft: TIWRectangle;
    iwbCancel: TIWButton;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbNextStageOfQueryClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
  end;

implementation

uses ServerController, DB_List_Combo, IWStrat_dm, IWStrat_uMain,
  IWStrat_newrecord3;

{$R *.dfm}


procedure TISFNewRecord2.IWAppFormCreate(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  dmStrat.qCountries.Close;
  dmStrat.qCountries.SQL.Clear;
  dmStrat.qCountries.SQL.Add('SELECT COUNTRIES.COUNTRYID, COUNTRIES.COUNTRY, ');
  dmStrat.qCountries.SQL.Add('  COUNTRIES.CONTINENTID,');
  dmStrat.qCountries.SQL.Add('  CONTINENTS.CONTINENT, COUNTRIES.COUNTRYHASRECORDS,');
  dmStrat.qCountries.SQL.Add('  COUNTRIES.STARTINGVALUE,COUNTRIES.DEFAULTMAPID');
  dmStrat.qCountries.SQL.Add('from COUNTRIES, CONTINENTS');
  dmStrat.qCountries.SQL.Add('where COUNTRIES.CONTINENTID=CONTINENTS.CONTINENTID');
  dmStrat.cdsCountries.Close;
  dmStrat.cdsCountries.Open;
  dmStrat.cdsCountries.Filter := 'CONTINENTID='+''''+UserSession.NewContinentID+'''';
  dmStrat.cdsCountries.Filtered := true;
  SetComboBox(iwcbArea,dmStrat.cdsCountries,'Country','CountryID');
end;

procedure TISFNewRecord2.iwbNextStageOfQueryClick(Sender: TObject);
begin
  GetComboBoxValue(iwcbArea,dmStrat.cdsCountries,'Country','CountryID',UserSession.NewAreaID);
  dmStrat.cdsCountries.Filtered := false;
  dmStrat.cdsCountries.Close;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFNewRecord3.Create(WebApplication).Show;
end;

procedure TISFNewRecord2.IWAppFormRender(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    UpdateComboBoxValue(iwcbArea,dmStrat.cdsCountries,'Country','CountryID',UserSession.NewAreaID);
  end;
end;

procedure TISFNewRecord2.iwbCancelClick(Sender: TObject);
begin
  dmStrat.cdsCountries.Filtered := false;
  dmStrat.cdsCountries.Close;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

end.
