unit IWStrat_selectgraph;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  Controls, Forms, IWCompButton,
  IWCompCheckbox, IWCompLabel, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompExtCtrls, IWCompListbox, IWCompRectangle,
  IWCompEdit, IWCompMemo, IWStrat_frTopBar;

type
  TISFSelectGraph = class(TIWAppForm)
    iwrgPlotType: TIWRadioGroup;
    IWLabel1: TIWLabel;
    iwbSubmitGraphSelection: TIWButton;
    iwrgNormalisationType: TIWRadioGroup;
    IWLabel3: TIWLabel;
    rectLeft: TIWRectangle;
    iwlSpectrumAgeHeading: TIWLabel;
    iwlFromAge: TIWLabel;
    iweFromAge: TIWEdit;
    iwlToAge: TIWLabel;
    iwetoAge: TIWEdit;
    iwcbSpectrumAges: TIWCheckBox;
    iwrgPDFType: TIWRadioGroup;
    IWLabel4: TIWLabel;
    iwbReturn: TIWButton;
    TopBar: TISFTopBarStrat;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbSubmitGraphSelectionClick(Sender: TObject);
    procedure iwcbSpectrumAgesClick(Sender: TObject);
    procedure iwrgPDFChangeClick(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
  public
  end;

implementation

uses ServerController, IWStrat_uMain, IWStrat_dmDV, 
  IWStrat_constants, IWStrat_chartcurve;

{$R *.dfm}


procedure TISFSelectGraph.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iweFromAge.Text := FormatFloat('###0.00',UserSession.FromAge);
  iweToAge.Text := FormatFloat('###0.00',UserSession.ToAge);
end;

procedure TISFSelectGraph.IWAppFormCreate(Sender: TObject);
var
  i : integer;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  //iwlSpectrumAgeHeading.Visible := UserSession.CanViewPlus;
  //iwlFromAge.Visible := UserSession.CanViewPlus;
  //iwlToAge.Visible := UserSession.CanViewPlus;
  //iweFromAge.Visible := UserSession.CanViewPlus;
  //iweToAge.Visible := UserSession.CanViewPlus;
  //iwcbSpectrumAges.Visible := UserSession.CanViewPlus;
  if (UserSession.NormalisationType = nt100Percent) then
  begin
    iwrgNormalisationType.ItemIndex := 0;
  end else
  begin
    iwrgNormalisationType.ItemIndex := 1;
  end;
  if (UserSession.PDFType = 'AND') then
  begin
    iwrgPDFType.ItemIndex := 0;
  end else
  begin
    iwrgPDFType.ItemIndex := 1;
  end;
end;

procedure TISFSelectGraph.iwbSubmitGraphSelectionClick(Sender: TObject);
var
  AllOkay : boolean;
  iCode : integer;
  i : integer;
begin
  //if UserSession.CanViewPlus then
  //begin
    Val(iweFromAge.Text,UserSession.FromAge,iCode);
      if (iCode <> 0) then UserSession.FromAge := SpectrumEndAge;
    Val(iweToAge.Text,UserSession.ToAge,iCode);
      if (iCode <> 0) then UserSession.ToAge := SpectrumStartAge;
  //end;
  AllOkay := true;
  {
  dmDV.cdsQuerydm.Close;
  dmDV.cdsTempDataMap.Close;
  dmDV.cdsTempDataDI.Close;
  dmDV.cdsTempDataDT.Close;
  dmDV.cdsTempDataDG.Close;
  dmDV.cdsTempDataI.Close;
  }
  case iwrgPlotType.ItemIndex of
    0 : begin
      UserSession.GraphType := gtInterpretationProbabilityCurves;
    end;
    1 : begin
      if not UserSession.IsDeveloper then WebApplication.ShowMessage('This option is not activated for general use');
    end;
  end;
  case iwrgNormalisationType.ItemIndex of
    0 : UserSession.NormalisationType := nt100Percent;
    1 : UserSession.NormalisationType := ntTrueProbability;
  end;
  case iwrgPDFType.ItemIndex of
    0 : UserSession.PDFType := 'AND';
    1 : UserSession.PDFType := 'OR';
  end;
  if ((UserSession.IsDeveloper) and (iwrgPlotType.ItemIndex in [1])) then  // test new query with UserOpts
  begin
    if AllOkay then
    begin
    {
      UserSession.AxisChoiceX := 'DATE';
      UserSession.AxisChoiceY := 'I';
      if not iwcbPlotTypeGrouped.Checked then
      begin
        dmgDV.cdsTempDataMap.Open;
        dmgDV.AllocateMapDataInterp2;
      end;
      if iwcbPlotTypeGrouped.Checked then
      begin
        UserSession.NumRecordsFound := 9;
        dmgDV.cdsTempDataMap.Open;
        dmgDV.AllocateMapDataInterp2Grouped;
      end;
      }
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      //TIWAppForm(WebApplication.ActiveForm).Release;
      //TISFTestAllocate.Create(WebApplication).Show;
    end;
  end;
  WebApplication.ShowMessage('Not yet implemented');
  if iwrgPlotType.ItemIndex in [0] then  // probability plots
  begin
    UserSession.NumRecordsFound := 0;
    if AllOkay then
    begin
      //dmDV.cdsTempDataDI.Open;
      //dmDV.AllocateDataByInterpretation2;
      UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
      //TIWAppForm(WebApplication.ActiveForm).Release;
      //TIWChartInterpretation.Create(WebApplication).Show;
    end;
  end;
end;

procedure TISFSelectGraph.iwcbSpectrumAgesClick(Sender: TObject);
begin
  if iwcbSpectrumAges.Checked then
  begin
    iweFromAge.Text := FormatFloat('###0.00',SpectrumEndAge);
    iweToAge.Text := FormatFloat('###0.00',SpectrumStartAge);
    iwcbSpectrumAges.Checked := false;
  end;
  UserSession.PDFHasChanged := true;
end;

procedure TISFSelectGraph.iwrgPDFChangeClick(Sender: TObject);
begin
  UserSession.PDFHasChanged := true;
end;

procedure TISFSelectGraph.iwbReturnClick(Sender: TObject);
begin
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show;
end;

end.
