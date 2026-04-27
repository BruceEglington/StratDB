unit IWStrat_addlipmorphologylink2;

interface

uses
  Classes, SysUtils, DB, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompLabel, IWCompButton, IWCompMemo, IWDBStdCtrls, IWCompEdit,
  IWVCLBaseControl, IWBaseHTMLControl, IWStrat_frTopBar, IWGrids,
  IWDBGrids, IWCompListbox;

type
  TISFAddLIPMorphologyLink2 = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    iwbReturn: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    iwbCancelUpdates: TIWButton;
    rectLeft: TIWRectangle;
    TopBar: TISFTopBarStrat;
    iwbDeleteLink: TIWButton;
    iwbEdit: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwDBeOrder: TIWDBEdit;
    IWLabel3: TIWLabel;
    iwbClose: TIWButton;
    IiwbOpen: TIWButton;
    iwDBlcbMorphology: TIWDBLookupComboBox;
    iwbEditable: TIWButton;
    iwDBnLink: TIWDBNavigator;
    iwDBgLink: TIWDBGrid;
    IWDBLabel1: TIWDBLabel;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbEditClick(Sender: TObject);
    procedure iwbDeleteLinkClick(Sender: TObject);
    procedure iwDBnLinkInsert(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbOpenClick(Sender: TObject);
    procedure iwbEditableClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_dmLIP, IWStrat_LIPdetails;




procedure TISFAddLIPMorphologyLink2.IWAppFormRender(Sender: TObject);
begin
  iwbReturn.Visible := true;
  iwbEdit.Visible := (UserSession.CanModify and (dmLIP.cdsLIPForm.State in [dsBrowse]));
  iwbApplyUpdates.Visible := (UserSession.CanModify and (dmLIP.cdsLIPForm.State in [dsEdit]));
  iwbCancelUpdates.Visible := (UserSession.CanModify and (dmLIP.cdsLIPForm.State in [dsEdit]));
  iwbDeleteLink.Visible := (UserSession.CanDelete and (dmLIP.cdsLIPForm.State in [dsBrowse]));
  iwDBeOrder.Editable := (UserSession.CanModify and (dmLIP.cdsLIPForm.State in [dsEdit]));
  //iwDBeMorpholID.Editable := (UserSession.CanModify and (dmLIP.cdsLIPForm.State in [dsEdit]));
  //iwDBlcbMorphology.Editable := true;
  iwDBlcbMorphology.Editable := (UserSession.CanModify and (dmLIP.cdsLIPForm.State in [dsEdit]));
end;

procedure TISFAddLIPMorphologyLink2.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
  end;
  dmLIP.cdsLIPForms.Close;
  dmLIP.cdsLIPForms.Open;
end;

procedure TISFAddLIPMorphologyLink2.iwbApplyUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbApplyUpdates) then
  begin
    dmLIP.cdsLIPForm.Post;
    dmLIP.cdsLIPForm.ApplyUpdates(0);
    dmLIP.cdsLIPQ.Close;
    dmLIP.cdsLIPQ.Open;
    dmLIP.cdsLIPForm.Close;
    dmLIP.cdsLIPForm.Open;
  end;
end;

procedure TISFAddLIPMorphologyLink2.iwbCancelUpdatesClick(Sender: TObject);
begin
  if(Sender = iwbCancelUpdates) then
  begin
    dmLIP.cdsLIPForm.CancelUpdates;
  end;
end;

procedure TISFAddLIPMorphologyLink2.iwbDeleteLinkClick(Sender: TObject);
begin
  dmLIP.cdsLIPForm.Delete;
  dmLIP.cdsLIPForm.ApplyUpdates(0);
end;

procedure TISFAddLIPMorphologyLink2.iwbEditableClick(Sender: TObject);
begin
  iwDBlcbMorphology.Editable := true;
end;

procedure TISFAddLIPMorphologyLink2.iwbEditClick(Sender: TObject);
begin
  dmLIP.cdsLIPForm.Edit;
end;

procedure TISFAddLIPMorphologyLink2.iwbReturnClick(Sender: TObject);
begin
  dmLIP.cdsLIPForms.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFLIPDetails.Create(WebApplication).Show;
end;

procedure TISFAddLIPMorphologyLink2.iwbOpenClick(Sender: TObject);
begin
  try
    dmLIP.cdsLIPForms.Open;
  except
    WebApplication.ShowMessage('not able to open cdsLIPForms');
  end;
end;

procedure TISFAddLIPMorphologyLink2.iwbCloseClick(Sender: TObject);
begin
  dmLIP.cdsLIPForms.Close;
end;

procedure TISFAddLIPMorphologyLink2.iwDBnLinkInsert(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  //dmLIP.InsertLIPMorphologyLink(WasSuccessful);
  if WasSuccessful then
  begin
    dmLIP.cdsLIPForm.Close;
    dmLIP.cdsLIPForm.Open;
    dmLIP.cdsLIPForm.Edit;
  end
  else begin
    WebApplication.ShowMessage('Not able to insert new link record');
  end;
end;

end.
