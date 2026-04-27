unit IWStrat_chartdomain;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompListbox, IWDBStdCtrls, IWCompEdit, IWCompButton, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompLabel, IWStrat_frTopBar;

type
  TISFChartDomain = class(TIWAppForm)
    iwDBnLink: TIWDBNavigator;
    iwbReturn: TIWButton;
    iwbSaveChanges: TIWButton;
    iwbCancelChanges: TIWButton;
    iwbDelete: TIWButton;
    iwDBgrid: TIWDBGrid;
    iwbEdit: TIWButton;
    IWLabel2: TIWLabel;
    IWDBEdit1: TIWDBEdit;
    IWDBEdit2: TIWDBEdit;
    IWLabel1: TIWLabel;
    IWLabel3: TIWLabel;
    iwDBlcbDomain: TIWDBLookupComboBox;
    IWLabel4: TIWLabel;
    IWDBEdit3: TIWDBEdit;
    IWLabel5: TIWLabel;
    IWDBEdit4: TIWDBEdit;
    IWLabel6: TIWLabel;
    IWDBEdit5: TIWDBEdit;
    IWLabel7: TIWLabel;
    IWDBEdit6: TIWDBEdit;
    IWLabel8: TIWLabel;
    IWDBEdit7: TIWDBEdit;
    iwbUseDomainName: TIWButton;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbSaveChangesClick(Sender: TObject);
    procedure iwbCancelChangesClick(Sender: TObject);
    procedure iwbDeleteClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwDBgridColumns3TitleClick(Sender: TObject);
    procedure iwDBnLinkInsert(Sender: TObject);
    procedure iwbUseDomainNameClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DB, IWStrat_chartdetails, IWStrat_dmC, usrIW_dm;




procedure TISFChartDomain.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwbSaveChanges.Visible := dmStratC.cdsChart.State in [dsEdit];
  iwbDelete.Visible := dmStratC.cdsChart.State in [dsBrowse];
  iwbEdit.Visible := dmStratC.cdsChart.State in [dsBrowse];
  iwbCancelChanges.Visible := dmStratC.cdsChart.State in [dsEdit];
  iwbUseDomainName.Visible := dmStratC.cdsChart.State in [dsEdit];
end;

procedure TISFChartDomain.IWAppFormCreate(Sender: TObject);
var
  i : integer;
  tmpDomainStr, tmpContinentStr : string;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStratC.qChart.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.cdsChart.Close;
  dmStratC.cdsChart.Open;
  //dmStratC.cdsChart.Locate('DOMAINID',UserSession.ParameterChosen,[]);
  //dmStratC.cdsChartDomain.Close;
  //dmStratC.cdsChartDomain.Open;
  //dmStratC.cdsDomainsAll.Filtered := false;
  dmStratC.qDomainsAll.Close;
  dmStratC.cdsDomainsAll.Close;
  //dmStratC.cdsDomainsAll.Filter := 'CONTINENTID='+USERSESSION.NewContinentID;
  //dmStratC.cdsDomainsAll.Filtered := true;
  dmStratC.qDomainsAll.ParamByName('USERID').AsString := UserSession.UserID;
  dmStratC.cdsDomainsAll.Open;
end;

procedure TISFChartDomain.iwbReturnClick(Sender: TObject);
begin
  dmStratC.cdsDomainsAll.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFChartDetails.Create(WebApplication).Show;
end;

procedure TISFChartDomain.iwbSaveChangesClick(Sender: TObject);
var
  tmpDomainStr : string;
begin
  try
    dmStratC.cdsChartDomain.ApplyUpdates(0);
    dmStratC.cdsChart.Close;
    dmStratC.cdsChart.Open;
    dmStratC.cdsChartDomain.Close;
    dmStratC.cdsChartDomain.Open;
  except
    WebApplication.ShowMessage('Not able to update changes to this record');
  end;
end;

procedure TISFChartDomain.iwDBgridColumns3TitleClick(Sender: TObject);
begin
  dmStratC.cdsChartDomain.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
end;

procedure TISFChartDomain.iwDBnLinkInsert(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  //dmUser.SetDeveloperData('Append new ChartDomain');
  dmStratC.AddChartDomain(UserSession.NewContinentID,WasSuccessful);
end;

procedure TISFChartDomain.iwbCancelChangesClick(Sender: TObject);
begin
  try
    dmStratC.cdsChartDomain.CancelUpdates;
  except
    WebApplication.ShowMessage('Not able to cancel changes to this record');
  end;
end;

procedure TISFChartDomain.iwbUseDomainNameClick(Sender: TObject);
begin
  dmStratC.cdsChartDomainDOMAINHEADING.AsString := dmStratC.cdsChartDomainDOMAINNAME.AsString;
end;

procedure TISFChartDomain.iwbDeleteClick(Sender: TObject);
begin
  try
    dmStratC.cdsChartDomain.Delete;
    dmStratC.cdsChartDomain.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete this link.',smAlert);
  end;
end;

procedure TISFChartDomain.iwbEditClick(Sender: TObject);
begin
  dmStratC.cdsChartDomain.Edit;
end;

end.
