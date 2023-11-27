unit IWStrat_addmetamorphismlink;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, Controls,
  Forms, IWStrat_frTopBar, IWCompGrids, IWDBGrids, IWDBStdCtrls, IWCompListbox,
  IWCompEdit, IWCompLabel, IWCompButton, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompRectangle, DB;

type
  TISFAddMetamorphismLink = class(TIWAppForm)
    rectLeft: TIWRectangle;
    iwbReturn: TIWButton;
    iwbEdit: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbDeleteLink: TIWButton;
    IWLabel1: TIWLabel;
    IWDBEdit1: TIWDBEdit;
    IWLabel2: TIWLabel;
    iwDBlcbGrade: TIWDBLookupComboBox;
    IWLabel4: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    IWLabel5: TIWLabel;
    IWDBEdit3: TIWDBEdit;
    IWLabel6: TIWLabel;
    IWDBEdit4: TIWDBEdit;
    IWLabel12: TIWLabel;
    iwDBlcbAgeConstraintLevel: TIWDBLookupComboBox;
    IWLabel8: TIWLabel;
    IWDBEdit5: TIWDBEdit;
    IWDBEdit6: TIWDBEdit;
    IWLabel10: TIWLabel;
    IWLabel11: TIWLabel;
    IWLabel9: TIWLabel;
    IWDBEdit7: TIWDBEdit;
    IWDBEdit8: TIWDBEdit;
    IWLabel3: TIWLabel;
    iwDBlcbOrogeny: TIWDBLookupComboBox;
    iwbOpen: TIWButton;
    iwDBnLink: TIWDBNavigator;
    iwDBgLink: TIWDBGrid;
    IWLabel7: TIWLabel;
    IWLabel13: TIWLabel;
    IWLabel14: TIWLabel;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbDeleteLinkClick(Sender: TObject);
    procedure iwbOpenClick(Sender: TObject);
    procedure iwDBnLinkInsert(Sender: TObject);
  public
    procedure OpenQuery;
  end;

implementation

uses IWStrat_dm, IWStrat_domaindetails, ServerController;

{$R *.dfm}

procedure TISFAddMetamorphismLink.OpenQuery;
begin
  dmStrat.cdsDomainQ.Close;
  dmStrat.cdsDomainQ.Open;
  dmStrat.cdsDomainMetamorphism.Close;
  dmStrat.cdsDomainMetamorphism.Open;
end;

procedure TISFAddMetamorphismLink.IWAppFormCreate(Sender: TObject);
begin
  {}
  //OpenQuery;
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  dmStrat.qDomainQ.Close;
  dmStrat.cdsDomainQ.Close;
  dmStrat.cdsDomainQ.Open;
  dmStrat.cdsDomainMetamorphism.Close;
  dmStrat.cdsDomainMetamorphism.Open;
  dmStrat.cdsOrogenies.Open;
  dmStrat.cdsMetamorphicGrades.Open;
  dmStrat.cdsAgeConstraints.Open;
  //WebApplication.ShowMessage('should now be open');
  //dmStrat.cdsDomainMetamorphism.Edit;
  //OpenQuery;
end;

procedure TISFAddMetamorphismLink.IWAppFormRender(Sender: TObject);
begin
  {}
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmStrat.cdsDomainMetamorphism.State in [dsBrowse]));
  iwbEdit.Visible := (UserSession.CanModify);
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsDomainMetamorphism.State in [dsEdit,dsInsert]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmStrat.cdsDomainMetamorphism.State in [dsEdit,dsInsert]));
  iwbDeleteLink.Visible := (UserSession.CanModify and (dmStrat.cdsDomainMetamorphism.State in [dsBrowse]));
  iwDBlcbGrade.Editable := (UserSession.CanModify and (dmStrat.cdsDomainMetamorphism.State in [dsEdit,dsInsert]));
  iwDBlcbOrogeny.Editable := (UserSession.CanModify and (dmStrat.cdsDomainMetamorphism.State in [dsEdit,dsInsert]));
  iwDBlcbAgeConstraintLevel.Editable := (UserSession.CanModify and (dmStrat.cdsDomainMetamorphism.State in [dsEdit,dsInsert]));
  //WebApplication.ShowMessage('should now be open');
end;

procedure TISFAddMetamorphismLink.iwbApplyUpdatesClick(Sender: TObject);
begin
  {}
  if(Sender = iwbApplyUpdates) then
  begin
    dmStrat.cdsDomainMetamorphism.Post;
    dmStrat.cdsDomainMetamorphism.ApplyUpdates(0);
    dmStrat.cdsDomainQ.Close;
    dmStrat.cdsDomainQ.Open;
    dmStrat.cdsDomainMetamorphism.Close;
    dmStrat.cdsDomainMetamorphism.Open;
  end;
end;

procedure TISFAddMetamorphismLink.iwbCancelUpdatesClick(Sender: TObject);
begin
  {}
  if(Sender = iwbCancelUpdates) then
  begin
    dmStrat.cdsDomainMetamorphism.CancelUpdates;
  end;
end;

procedure TISFAddMetamorphismLink.iwbDeleteLinkClick(Sender: TObject);
begin
  {}
  dmStrat.cdsDomainMetamorphism.Delete;
  dmStrat.cdsDomainMetamorphism.ApplyUpdates(0);
end;

procedure TISFAddMetamorphismLink.iwbEditClick(Sender: TObject);
begin
  {}
  if not dmStrat.cdsDomainMetamorphism.Active then dmStrat.cdsDomainMetamorphism.Open;
  dmStrat.cdsDomainMetamorphism.Edit;
end;

procedure TISFAddMetamorphismLink.iwbReturnClick(Sender: TObject);
begin
  {}
  dmStrat.cdsOrogenies.Close;
  dmStrat.cdsMetamorphicGrades.Close;
  dmStrat.cdsAgeConstraints.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDomainDetails.Create(WebApplication).Show;
end;

procedure TISFAddMetamorphismLink.iwbOpenClick(Sender: TObject);
begin
  {}
  OpenQuery;
end;

procedure TISFAddMetamorphismLink.iwDBnLinkInsert(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertMetamorphismLink(WasSuccessful);
  if WasSuccessful then
  begin
    dmStrat.cdsDomainQ.Close;
    dmStrat.cdsDomainQ.Open;
    dmStrat.cdsDomainMetamorphism.Close;
    dmStrat.cdsDomainMetamorphism.Open;
    {}
  end
  else begin
    {}
    WebApplication.ShowMessage('Not able to insert new record');
  end;
  {}
end;

end.
