unit IWStrat_adddeformationlink;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWCompGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddDeformationLink = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    iwbCancelUpdates: TIWButton;
    rectLeft: TIWRectangle;
    iwDBnLink: TIWDBNavigator;
    iwDBgLink: TIWDBGrid;
    iwbDeleteLink: TIWButton;
    iwbEdit: TIWButton;
    iwbApplyUpdates: TIWButton;
    IWLabel3: TIWLabel;
    iwDBlcbOrogeny: TIWDBLookupComboBox;
    IWLabel4: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    IWDBEdit3: TIWDBEdit;
    IWLabel10: TIWLabel;
    IWLabel11: TIWLabel;
    IWLabel2: TIWLabel;
    iwDBlcbAgeconstraintlevel: TIWDBLookupComboBox;
    iwbOpen: TIWButton;
    IWLabel5: TIWLabel;
    iwDBlcbDuctility: TIWDBLookupComboBox;
    iwDBlcbOrogenyType: TIWDBLookupComboBox;
    IWLabel6: TIWLabel;
    IWLabel7: TIWLabel;
    iwDBlcbVergence: TIWDBLookupComboBox;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbDeleteLinkClick(Sender: TObject);
    procedure iwDBnLinkInsert(Sender: TObject);
    procedure iwbOpenClick(Sender: TObject);
  public
    procedure OpenQuery;
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_dm, IWStrat_domaindetails;


procedure TISFAddDeformationLink.OpenQuery;
begin
  dmStrat.cdsDomainQ.Close;
  dmStrat.cdsDomainQ.Open;
  dmStrat.cdsDomainDeformation.Close;
  dmStrat.cdsDomainDeformation.Open;
end;

procedure TISFAddDeformationLink.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmStrat.cdsDomainDeformation.State in [dsBrowse]));
  iwbEdit.Visible := (UserSession.CanModify);
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsDomainDeformation.State in [dsEdit,dsInsert]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsDomainDeformation.State in [dsEdit,dsInsert]));
  iwbDeleteLink.Visible := (UserSession.CanModify and (dmStrat.cdsDomainDeformation.State in [dsBrowse]));
  iwDBlcbDuctility.Editable := (UserSession.CanModify and (dmStrat.cdsDomainDeformation.State in [dsEdit,dsInsert]));
  iwDBlcbOrogeny.Editable := (UserSession.CanModify and (dmStrat.cdsDomainDeformation.State in [dsEdit,dsInsert]));
  iwDBlcbAgeConstraintLevel.Editable := (UserSession.CanModify and (dmStrat.cdsDomainDeformation.State in [dsEdit,dsInsert]));
  iwDBlcbOrogenyType.Editable := (UserSession.CanModify and (dmStrat.cdsDomainDeformation.State in [dsEdit,dsInsert]));
  iwDBlcbVergence.Editable := (UserSession.CanModify and (dmStrat.cdsDomainDeformation.State in [dsEdit,dsInsert]));
end;

procedure TISFAddDeformationLink.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  dmStrat.cdsDomainQ.Close;
  dmStrat.cdsDomainQ.Open;
  dmStrat.cdsDomainDeformation.Close;
  dmStrat.cdsDomainDeformation.Open;
  //dmStrat.cdsDomainDeformation.Edit;
  dmStrat.cdsOrogenies.Open;
  dmStrat.cdsDuctilities.Open;
  dmStrat.cdsOrogenyTypes.Open;
  dmStrat.cdsAgeConstraints.Open;
  dmStrat.cdsDirections.Open;
end;

procedure TISFAddDeformationLink.iwbApplyUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmStrat.cdsDomainDeformation.Post;
    dmStrat.cdsDomainDeformation.ApplyUpdates(0);
    dmStrat.cdsDomainQ.Close;
    dmStrat.cdsDomainQ.Open;
    dmStrat.cdsDomainDeformation.Close;
    dmStrat.cdsDomainDeformation.Open;
  end;
end;

procedure TISFAddDeformationLink.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmStrat.cdsDomainDeformation.CancelUpdates;
  end;
end;

procedure TISFAddDeformationLink.iwbDeleteLinkClick(Sender: TObject);
begin
  dmStrat.cdsDomainDeformation.Delete;
  dmStrat.cdsDomainDeformation.ApplyUpdates(0);
end;

procedure TISFAddDeformationLink.iwbEditClick(Sender: TObject);
begin
  if not dmStrat.cdsDomainDeformation.Active then dmStrat.cdsDomainDeformation.Open;
  dmStrat.cdsDomainDeformation.Edit;
end;

procedure TISFAddDeformationLink.iwbOpenClick(Sender: TObject);
begin
  OpenQuery;
end;

procedure TISFAddDeformationLink.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsOrogenies.Close;
  dmStrat.cdsDuctilities.Close;
  dmStrat.cdsOrogenyTypes.Close;
  dmStrat.cdsAgeConstraints.Close;
  dmStrat.cdsDirections.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDomainDetails.Create(WebApplication).Show;
end;

procedure TISFAddDeformationLink.iwDBnLinkInsert(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertDeformationLink(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsDomainQ.Close;
    dmStrat.cdsDomainQ.Open;
    dmStrat.cdsDomainDeformation.Close;
    dmStrat.cdsDomainDeformation.Open;
    {}
  end
  else begin
    {}
    WebApplication.ShowMessage('Not able to insert new record');
  end;
end;

end.
