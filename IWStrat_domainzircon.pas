unit IWStrat_domainzircon;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWCompButton, IWCompLabel, IWBaseControl,
  IWControl, IWCompEdit, IWDBStdCtrls, IWCompGrids, IWDBGrids, IWCompMemo,
  IWCompListbox, IWVCLBaseControl,
  DB, IWBaseHTMLControl, IWCompRectangle, IWCompCheckbox,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWRegion,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWStrat_frTopBar, IWHTML40Container, IWCompExtCtrls;

type
  TISFDomainZircon = class(TIWAppForm)
    iwbReturn: TIWButton;
    iwbDetailsEdit: TIWButton;
    iwbReturn2: TIWButton;
    iwbDetailsEdit2: TIWButton;
    IWLabel66: TIWLabel;
    IWLabel67: TIWLabel;
    rectLeft: TIWRectangle;
    iwrLeftRegion: TIWRegion;
    iwrTopButtons: TIWRegion;
    iwbApplyUpdates: TIWButton;
    iwrClientAll: TIWRegion;
    iwrBottomButtons: TIWRegion;
    iwbCancel: TIWButton;
    iwrCopyRight: TIWRegion;
    TopBar: TISFTopBarStrat;
    iwrUnitDetails: TIWRegion;
    IWLabel5: TIWLabel;
    IWLabel3: TIWLabel;
    IWDBEdit3: TIWDBEdit;
    IWDBEdit7: TIWDBEdit;
    IWLabel4: TIWLabel;
    IWLabel2: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    IWLabel1: TIWLabel;
    IWDBEdit1: TIWDBEdit;
    IWLabel10: TIWLabel;
    IWDBEdit8: TIWDBEdit;
    IWDBEdit9: TIWDBEdit;
    IWLabel8: TIWLabel;
    iwbGoToParent: TIWButton;
    IWLabel16: TIWLabel;
    iwbAddDomainToDateView: TIWButton;
    IWLabel21: TIWLabel;
    IWDBEdit5: TIWDBEdit;
    IWLabel23: TIWLabel;
    IWDBEdit6: TIWDBEdit;
    iwDBlcbDomainType: TIWDBLookupComboBox;
    iwrDatesAvailable: TIWRegion;
    IWLabel30: TIWLabel;
    IWDBEdit10: TIWDBEdit;
    IWLabel31: TIWLabel;
    IWDBEdit12: TIWDBEdit;
    IWLabel32: TIWLabel;
    iwlDatesAvailable: TIWLabel;
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
  public
    RecordValues : TStringList;
  end;

implementation

{$R *.dfm}

uses
  ServerController, Graphics, IWColor,
  IWStrat_constants, IWStrat_uMain, IWStrat_chartdomain,
  IWStrat_definenewcontinent, usrIW_dm, IWStrat_dmDV, DVIW_mathproc,
  IWStrat_dmC;

procedure TISFDomainZircon.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwbDetailsEdit.Visible := (dmStratC.cdsChart.State in [dsBrowse]);
  iwbApplyUpdates.Visible := (dmStratC.cdsChart.State in [dsEdit]);
  iwbCancel.Visible := (dmStratC.cdsChart.State in [dsEdit]);
  //iwbAddDomain.Visible := (dmStratC.cdsChart.State in [dsBrowse]);
  //iwbDeleteDomain.Visible := (dmStratC.cdsChart.State in [dsBrowse]);
  //iwrUsers.Visible := (dmStratC.cdsChartOWNERID.AsString=UserSession.UserID);
  //iwbAddUser.Visible := (dmStratC.cdsChartOWNERID.AsString=UserSession.UserID);
  //iwbDeleteUser.Visible := (dmStratC.cdsChartOWNERID.AsString=UserSession.UserID);
end;

procedure TISFDomainZircon.iwbReturnClick(Sender: TObject);
begin
  dmStratC.cdsChart.Close;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFDomainZircon.iwbCancelClick(Sender: TObject);
begin
  dmStratC.cdsChart.CancelUpdates;
end;


procedure TISFDomainZircon.IWAppFormCreate(Sender: TObject);
var
  i, iRec : integer;
begin
  {
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    if (UserSession.ThisProgram = 'StratDB') then TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    if (UserSession.ThisProgram = 'IGCP509') then TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
    //iwbDetailsEdit.Visible := UserSession.CanModify;
    //iwbDetailsEdit2.Visible := UserSession.CanModify;
    //iwbAddDomain.Visible := UserSession.CanModifyPlus;
    //iwbDeleteDomain.Visible := UserSession.CanModifyPlus;
    iwbApplyUpdates.Visible := false;
    //iwbTimeSpaceUnits.Visible := UserSession.CanViewPlus;
    //iwbTimeSpaceMetamorphism.Visible := UserSession.CanViewPlus;
    //iwbTimeSpaceDeformation.Visible := UserSession.CanViewPlus;
    dmStratC.qChart.Close;
    dmStratC.qChart.ParamByName('ChartID').AsString := UserSession.ChartValue;
    dmStratC.cdsChart.Close;
    dmStratC.cdsChart.Open;
    iweChartMinAge.Text := FormatFloat('####0.00',dmStratC.cdsChartDEFAULTMINAGE.AsFloat);
    iweChartMaxAge.Text := FormatFloat('####0.00',dmStratC.cdsChartDEFAULTMAXAGE.AsFloat);
    if (UserSession.CanModify) then
    begin
      iwDBgDomain.RowCurrentColor := clWebYellow;
    end else
    begin
      iwDBgDomain.RowCurrentColor := clNone;
    end;
    //dmStratC.cdsChartDomain.Open;
    //dmStratC.cdsChartDomain.Last;
    iweDomOrderGE.Text := '1';
    iRec := 80;
    //iRec := dmStratC.cdsChartDomainDOMAINORDER.AsInteger;
    if (iRec > 80) then iRec := 80;
    iweDomOrderLT.Text := IntToStr(iRec);
    //dmStratC.cdsChartDomain.First;
  end;
  }
end;


procedure TISFDomainZircon.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStratC.cdsChart.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update record');
  end;
end;

end.
