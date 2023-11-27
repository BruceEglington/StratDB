unit IWStrat_frGridGrainProbabilityUnits;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompLabel, IWCompGrids, IWDBGrids, IWDBStdCtrls,
  Forms, IWHTMLControls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompButton,
  IWStrat_frTopBar, jpeg, IWCompExtCtrls,
  IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWRegion, IWCompRectangle, IWStrat_framemenu,
  IWHTML40Container, FMTBcd, WideStrings, DB, SqlExpr,
  DBClient, Provider, VCLTee.TeEngine, Vcl.ExtCtrls, VCLTee.TeeProcs,
  VCLTee.Chart, IWCompTeeChart, VCLTee.Series, IWCompCheckbox, IWCompEdit,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWCompMemo, IWCompListbox, VclTee.TeeGDIPlus;

type
  TISFGridGrainProbabilityUnits = class(TIWAppForm)
    lblRecordCount: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwlSortedBy: TIWLabel;
    iwlPageNum: TIWLabel;
    iwlOf: TIWLabel;
    iwlPageNumTotal: TIWLabel;
    iwlFirstPage: TIWLink;
    iwlLastPage: TIWLink;
    iwrLeft: TIWRegion;
    iwrPageFull: TIWRegion;
    iwrUnitsQueryTop: TIWRegion;
    TopBar: TISFTopBarStrat;
    iwrRight: TIWRegion;
    iwlQueryResults: TIWLabel;
    iwrButtonsTop: TIWRegion;
    iwbReturn: TIWButton;
    iwrProjectSelect: TIWRegion;
    iwlUserProject: TIWLabel;
    iwcbUserProject: TIWComboBox;
    iwDBgResults: TIWDBGrid;
    iwrUnitsButtons: TIWRegion;
    iwbUnitsAdd: TIWButton;
    iwbUnitsClear: TIWButton;
    iwcbIncludeSubunits: TIWCheckBox;
    iwrUnitsTop: TIWRegion;
    iwlUnits: TIWLabel;
    iwlUnitsSortedBy: TIWLabel;
    iwbDeleteUnitRecord: TIWButton;
    iwlUnitsPartialList: TIWLabel;
    iwbDownloadUnits: TIWButton;
    iwbShowUnits: TIWButton;
    iwDBgUnits: TIWDBGrid;
    iwrUnitsSamplesButtons: TIWRegion;
    iwbUnitsSamplesAdd: TIWButton;
    iwbUnitsSamplesClear: TIWButton;
    iwrgIsotopeSystemVariable: TIWRadioGroup;
    iwrUnitsSamplesTop: TIWRegion;
    iwlUnitsSamples: TIWLabel;
    iwlUnitsSamplesSortedBy: TIWLabel;
    iwbDeleteUnitsSamplesRecord: TIWButton;
    iwlUnitsSamplesPartialList: TIWLabel;
    iwbDownloadUnitsSamples: TIWButton;
    iwbShowUnitsSamples: TIWButton;
    iwbUpdateUnitAge: TIWButton;
    iwDBgUnitsSamples: TIWDBGrid;
    iwrGraphOptions: TIWRegion;
    IWLabel1: TIWLabel;
    iweGraphAgeFrom: TIWEdit;
    IWLabel11: TIWLabel;
    iweGraphAgeTo: TIWEdit;
    iwbScalePDFAxes: TIWButton;
    iwcbGraphsAutoscale: TIWCheckBox;
    iweConcordanceFrom: TIWEdit;
    IWLabel5: TIWLabel;
    iweConcordanceTo: TIWEdit;
    iwbCalculateProbabilityCurves: TIWButton;
    IWLabel4: TIWLabel;
    iwcbExcludeDataWithoutAnalyses: TIWCheckBox;
    iwrgAndOr: TIWRadioGroup;
    IWLabel10: TIWLabel;
    iweMinimumUncertainty: TIWEdit;
    IWLabel7: TIWLabel;
    iwe1: TIWEdit;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    iwe2: TIWEdit;
    IWLabel6: TIWLabel;
    iwe3: TIWEdit;
    IWLabel8: TIWLabel;
    iwe4: TIWEdit;
    IWLabel9: TIWLabel;
    iwe5: TIWEdit;
    IWLabel13: TIWLabel;
    iweXMin: TIWEdit;
    iweYMin: TIWEdit;
    IWLabel25: TIWLabel;
    IWLabel26: TIWLabel;
    iweXMax: TIWEdit;
    iweYMax: TIWEdit;
    IWLabel12: TIWLabel;
    IWLabel14: TIWLabel;
    iweYIncrement: TIWEdit;
    iweXIncrement: TIWEdit;
    IWLabel15: TIWLabel;
    iwcbShow1: TIWCheckBox;
    iwcbShow2: TIWCheckBox;
    iwcbShow3: TIWCheckBox;
    iwcbShow4: TIWCheckBox;
    iwcbShow5: TIWCheckBox;
    iwbDeleteUserGrainAgePDF: TIWButton;
    iwbGraphExistingProbabilityCurves: TIWButton;
    iwrGraphDownloadPDF: TIWRegion;
    iwbDownloadGrainCurves: TIWButton;
    iwmGraphExplanation: TIWMemo;
    iwrGraphProbabilityGraph: TIWRegion;
    iwChartPDF: TIWChart;
    ChartPDF: TChart;
    Series1: TPointSeries;
    Series2: TPointSeries;
    Series3: TPointSeries;
    Series4: TPointSeries;
    Series5: TPointSeries;
    Series6: TLineSeries;
    iwrGraphChemistry: TIWRegion;
    iwChartChem: TIWChart;
    ChartChem: TChart;
    Series7: TPointSeries;
    PointSeries5: TPointSeries;
    iweVar1Cutoff: TIWEdit;
    iweVar2Cutoff: TIWEdit;
    iweVar3Cutoff: TIWEdit;
    IWLabel19: TIWLabel;
    iwcbVar1: TIWCheckBox;
    iwcbVar2: TIWCheckBox;
    iwcbVar3: TIWCheckBox;
    iwrectCutoffs: TIWRectangle;
    iwcbShowBelowCutoff: TIWCheckBox;
    iwcbShowAboveCutoff: TIWCheckBox;
    IWLabel16: TIWLabel;
    iwrGraphDownloadChem: TIWRegion;
    IWMemo1: TIWMemo;
    iwbDownloadGrainAgeData: TIWButton;
    iwbPopulateChemistryGraph: TIWButton;
    iwbGetChemistryAgeData: TIWButton;
    Series8: TLineSeries;
    iwlSampleZones: TIWListbox;
    iwcbIncludeSampleZones: TIWCheckBox;
    iwlbUserProject: TIWListbox;
    iwbDownloadData: TIWButton;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1ColumnsTitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwlFirstPageClick(Sender: TObject);
    procedure iwlLastPageClick(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbCalculateProbabilityCurvesClick(Sender: TObject);
    procedure iwDBgUnitsColumns0TitleClick(Sender: TObject);
    procedure iwbUnitsAddClick(Sender: TObject);
    procedure iwbUnitsClearClick(Sender: TObject);
    procedure iwbUnitsSamplesAddClick(Sender: TObject);
    procedure iwbUnitsSamplesClearClick(Sender: TObject);
    procedure iwbScalePDFAxesClick(Sender: TObject);
    procedure iwcbGraphsAutoscaleClick(Sender: TObject);
    procedure iwbDownloadGrainCurvesClick(Sender: TObject);
    procedure iwDBgUnitsSamplesColumns0TitleClick(Sender: TObject);
    procedure iwDBgUnitsColumns1Click(ASender: TObject; const AValue: string);
    procedure iwbDeleteUnitRecordClick(Sender: TObject);
    procedure iwbDeleteUnitsSamplesRecordClick(Sender: TObject);
    procedure iwDBgUnitsSamplesColumns6Click(ASender: TObject;
      const AValue: string);
    procedure iwcbGraphsAutoscaleChange(Sender: TObject);
    procedure iwbDownloadGrainAgeDataClick(Sender: TObject);
    procedure iwcbShow1Click(Sender: TObject);
    procedure iwbDownloadUnitsSamplesClick(Sender: TObject);
    procedure iwbDownloadUnitsClick(Sender: TObject);
    procedure iwlUserProject1Change(Sender: TObject);
    procedure iwbShowUnitsClick(Sender: TObject);
    procedure iwbShowUnitsSamplesClick(Sender: TObject);
    procedure iwbDeleteUserGrainAgePDFClick(Sender: TObject);
    procedure iwbGraphExistingProbabilityCurvesClick(Sender: TObject);
    procedure iwbUpdateUnitAgeClick(Sender: TObject);
    procedure iwcbVar1Click(Sender: TObject);
    procedure iwbPopulateChemistryGraphClick(Sender: TObject);
    procedure iwbGetChemistryAgeDataClick(Sender: TObject);
    procedure iwcbShowAboveCutoffClick(Sender: TObject);
    procedure iwcbShowBelowCutoffClick(Sender: TObject);
    procedure iwrgIsotopeSystemVariableClick(Sender: TObject);
    procedure iwbDownloadDataClick(Sender: TObject);
  public
    UserProjectIDstring : string;
    procedure CalculatePDF(ShowConcordantOnly : string; NumIncluded : integer);
    procedure GraphPDF(UnitID : integer; UnitAge : double);
    procedure GraphExistingPDF;
    procedure GraphChem(VarID : integer);
    function Gauss (Ratio, Mean, Dev : double) : double;
    procedure GetSampleData(tUserID, tRegAssocID, tSampleNo : string; var NumIncluded : integer);
    procedure SetUserGrainPDF(tProjectID,tUserID,tUnitIDstr,tStepNoStr,tRegAssocIDstr : string; tUnitAge : double; var tNo : integer);
  end;
  type TMyLineSeries=class(TLineSeries)   // allows override of TeeChart series linewidth, suggested by Steema staff
  private
    function GetValueWidth(ValueIndex:Integer):Integer;
    procedure SetValueWidth(ValueIndex:Integer; AWidth:Integer);
  protected
    FWidths: array of Integer;
    procedure DrawValue(ValueIndex:Integer); override;
  public
    property ValueWidth[Index:Integer]:Integer read GetValueWidth write SetValueWidth;
  end;

implementation

{$R *.dfm}

uses
  ServerController, IWStrat_dm, IWStrat_details, DB_List_Combo,
  IWStrat_uMain, IWStrat_constants, usrIW_dm, IWStrat_dmDV;


function TMyLineSeries.GetValueWidth(ValueIndex:Integer):Integer;
begin
  result:=FWidths[ValueIndex];
end;

Procedure TMyLineSeries.SetValueWidth(ValueIndex:Integer; AWidth:Integer);
var t : Integer;
begin
  if not Assigned(FWidths) then
  begin
    SetLength(FWidths, Count);
    for t:=0 to Count-1 do
      FWidths[t]:=1;
  end;
  FWidths[ValueIndex]:=AWidth;
  Repaint;
end;

procedure TMyLineSeries.DrawValue(ValueIndex:Integer);
begin
  LinePen.Width:=ValueWidth[ValueIndex];
  inherited;
end;

{
//only used for testing
procedure TForm1.FormCreate(Sender: TObject); var Series1: TMyLineSeries;
    i: Integer;
begin
  Chart1.View3D:=false;

  Series1:=Chart1.AddSeries(TMyLineSeries) as TMyLineSeries;
  Series1.FillSampleValues(5);
  Series1.Pointer.Visible:=true;

  for i:=0 to Series1.Count-1 do
  begin
    Series1.ValueColor[i]:=OperaPalette[i mod length(OperaPalette)];
    Series1.ValueWidth[i]:=i;
  end;
end;
}


procedure TISFGridGrainProbabilityUnits.IWAppFormRender(Sender: TObject);
begin
  iwlPageNum.Caption := IntToStr(UserSession.PageNum);
end;

procedure TISFGridGrainProbabilityUnits.iwbCalculateProbabilityCurvesClick(
  Sender: TObject);
const
  VariableToSelect = 'Age_preferred';
var
  tUserID, tRegAssocID, tSampleNo : string;
  tUnitAge : double;
  tUnitID : integer;
  tCountryID, tUnitName, tUnitRank : string;
  i, ii, imax, iStart : integer;
  MinX, MaxX, MinY, MaxY, MinXY, MaxXY, AgeValue : double;
  UserProjectIDstr : string;
  PDFtype : string;
  tmpStr : string;
  iCode : integer;
  MinimumUncertainty : double;
  tempmax : double;
  k : integer;
  NumFracTotal : integer;
  NumFracIncluded : integer;
  FromAge, ToAge : double;
  BottomAxisMin, BottomAxisMax,
  LeftAxisMin, LeftAxisMax : double;
  tXIncrement, tYIncrement : double;
  Cutoff1 : double;
  x1 : double;
  tUnitIDstr,
  tUnitAgeStr, tStepNoStr : string;
  tNo : integer;
begin
  //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbCalculateProbabilityCurvesClick - 0');
  iwbPopulateChemistryGraph.Enabled := false;
  tNo := 0;
  Val(iwe1.Text,Cutoff1,iCode);
  Val(iweGraphAgeFrom.Text,FromAge,iCode);
  Val(iweGraphAgeTo.Text,ToAge,iCode);
  Val(iweMinimumUncertainty.Text,MinimumUncertainty,iCode);
  if (iwrgAndOr.ItemIndex = 0) then PDFtype := 'AND';
  if (iwrgAndOr.ItemIndex = 1) then PDFtype := 'OR';
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  //GetListBoxValues(iwlbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserSession.UserProjectValues);
  //UserProjectIDstr := UserSession.UserProjectvalues[0];
  //UserProjectIDstr := UserProjectIDstring;
  if (UserProjectIDstr <> '') then
  begin
    if (UserSession.IncludeUnitValues) then
      GetListBoxValues(iwlSampleZones,dmDV.cdsSampleZones,'ZoneType','ZoneID',UserSession.SampleZoneValues);
    if ((UserSession.IncludeSampleZoneValues) and (UserSession.SampleZoneValues.Count=0)) then UserSession.IncludeSampleZoneValues := false;
    ii := 0;
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbCalculateProbabilityCurvesClick - 1a');
    dmDV.cdsUnitGrainAgeData.Open;
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbCalculateProbabilityCurvesClick - 1b');
    dmDV.cdsUnitGrainAgeData.EmptyDataSet;
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbCalculateProbabilityCurvesClick - 1c');
    dmDV.qDeleteGrainAgePDF.ParamByName('ProjectID').AsString := UserProjectIDstr;
    dmDV.qDeleteGrainAgePDF.ExecSQL(false);
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbCalculateProbabilityCurvesClick - 1d');
    iStart := 0;
    tRegAssocID := 'UPb';
    if (iwrgIsotopeSystemVariable.ItemIndex = 0) then
    begin
      tRegAssocID := 'UPb';
    end;
    if (iwrgIsotopeSystemVariable.ItemIndex = 1) then
    begin
      tRegAssocID := 'LuHf';
    end;
    if (iwrgIsotopeSystemVariable.ItemIndex = 2) then
    begin
      tRegAssocID := 'zrC';
    end;
    tUserID := UserSession.UserID;
    dmDV.ConstructRawDataSampleQuery;
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbCalculateProbabilityCurvesClick - 2');
    dmDV.cdsUserUnitGrainAgePDF.Close;
    dmDV.qUserUnitGrainAgePDF.Close;
    dmDV.qUserUnitGrainAgePDF.ParamByName('ProjectID').AsString := UserProjectIDstr;
    dmDV.cdsData.Open;
    dmDV.cdsSamplePDF.Open;
    dmDV.cdsUnitPDF.Open;
    dmDV.cdsUserUnitSuiteSamples.Close;
    dmDV.qUserUnitSuiteSamples.Close;
    dmDV.qUserUnitSuiteSamples.ParamByName('ProjectID').AsString := UserProjectIDstr;
    dmDV.cdsUserUnitSuiteSamples.Open;
    dmDV.cdsUserUnitSuiteSamples.First;
    dmDV.cdsUserUnitSuiteSamplesUnits.Close;
    dmDV.qUserUnitSuiteSamplesUnits.Close;
    dmDV.qUserUnitSuiteSamplesUnits.ParamByName('ProjectID').AsString := UserProjectIDstr;
    dmDV.cdsUserUnitSuiteSamplesUnits.Open;
    dmDV.cdsGrainUnits.Open;
    dmDV.cdsGrainUnits.EmptyDataSet;
    dmDV.cdsUnitPDF.EmptyDataSet;
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbCalculateProbabilityCurvesClick - 3');
    repeat
      tUnitID := dmDV.cdsUserUnitSuiteSamplesUnitsSTRATDBUNITID.AsInteger;
      tUnitIDstr := IntToStr(tUnitID);
      try
        dmDV.cdsGrainUnits.Append;
        dmDV.cdsGrainUnitsUnitID.AsInteger := tUnitID;
        dmDV.cdsGrainUnits.Post;
      except
      end;
      dmDV.cdsUserUnitSuiteSamplesUnits.Next;
    until dmDV.cdsUserUnitSuiteSamplesUnits.Eof;
    dmDV.cdsUserUnitSuiteSamplesUnits.Close;
    dmDV.cdsUserUnitSuiteSamples.First;
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbCalculateProbabilityCurvesClick - 4');
    //dmDV.cdsGrainUnits.First;
    //repeat
    //  WebApplication.ShowMessage('UnitID = '+dmDV.cdsGrainUnitsUnitID.AsString);
    //  dmDV.cdsGrainUnits.Next;
    //until dmDV.cdsGrainUnits.Eof;
    dmDV.cdsGrainUnits.First;
    repeat
      ii := ii + 1;
      dmDV.cdsUnitPDF.EmptyDataSet;
      tUnitID := dmDV.cdsGrainUnitsUnitID.AsInteger;
      tUnitIDstr := IntToStr(tUnitID);
      //dmUser.SetDeveloperData('iwbCalculateProbabilityCurves - '+tUnitIDstr);
      dmDV.cdsUnitPDF.Filtered := false;
      //WebApplication.ShowMessage('UnitID is '+dmDV.cdsGrainUnitsUnitID.AsString);
      dmDV.cdsSamplesForUnit.Close;
      dmDV.qSamplesForUnit.Close;
      dmDV.qSamplesForUnit.ParamByName('ProjectID').AsString := UserProjectIDstr;
      dmDV.qSamplesForUnit.ParamByName('UnitID').AsInteger := dmDV.cdsGrainUnitsUnitID.AsInteger;
      dmDV.cdsSamplesForUnit.Open;
      dmDV.cdsSamplesForUnit.First;
      //repeat
        //WebApplication.ShowMessage('Sample is '+dmDV.cdsSamplesForUnitSAMPLENO.AsString);
      // dmDV.cdsSamplesForUnit.Next;
      //until dmDV.cdsSamplesForUnit.Eof;
      //dmUser.SetDeveloperData('iwbCalculateProbabilityCurvesClick - 4a');
      for k := 0 to Steps do
      begin
        dmDV.cdsUnitPDF.Append;
        dmDV.cdsUnitPDFUnitID.AsInteger := dmDV.cdsGrainUnitsUnitID.AsInteger;
        dmDV.cdsUnitPDFUnitName.AsString := dmDV.cdsSamplesForUnitSTRATDBUNITNAME.AsString;
        dmDV.cdsUnitPDFUnitRank.AsString := dmDV.cdsSamplesForUnitSTRATDBUNITRANK.AsString;
        dmDV.cdsUnitPDFCountryID.AsString := dmDV.cdsSamplesForUnitCOUNTRYID.AsString;
        dmDV.cdsUnitPDFStepID.AsInteger := k;
        dmDV.cdsUnitPDFUnitAge.AsFloat := dmDV.cdsSamplesForUnitSTRATDBUNITAGE.AsFloat;
        x1 := FromAge + 1.0*k*(ToAge-FromAge)/Steps;
        dmDV.cdsUnitPDFGrainAge.AsFloat := x1;
        dmDV.cdsUnitPDFPDFvalue.AsFloat := 0.0;
        dmDV.cdsUnitPDF.Post;
      end;
      //dmUser.SetDeveloperData('iwbCalculateProbabilityCurvesClick - 4b');
      dmDV.cdsSamplesForUnit.First;
      repeat
        ii := ii + 1;
        NumFracTotal := 0;
        NumFracIncluded := 0;
        tCountryID := dmDV.cdsSamplesForUnitCOUNTRYID.AsString;
        tUnitName := dmDV.cdsSamplesForUnitSTRATDBUNITNAME.AsString;
        tUnitRank := dmDV.cdsSamplesForUnitSTRATDBUNITRANK.AsString;
        tSampleNo := dmDV.cdsSamplesForUnitSAMPLENO.AsString;
        tUnitAge := dmDV.cdsSamplesForUnitSTRATDBUNITAGE.AsFloat;
        tUnitAgeStr := FormatFloat('###0.000',tUnitAge);
        dmDV.cdsUserUnitSuiteSampleNumFrac.Close;
        dmDV.qUserUnitSuiteSampleNumFrac.Close;
        dmDV.qUserUnitSuiteSampleNumFrac.ParamByName('ProjectID').AsString := UserProjectIDstr;
        dmDV.qUserUnitSuiteSampleNumFrac.ParamByName('SampleNo').AsString := tSampleNo;
        dmDV.qUserUnitSuiteSampleNumFrac.ParamByName('VariableID').AsString := VariableToSelect;
        dmDV.qUserUnitSuiteSampleNumFrac.ParamByName('UserID').AsString := UserSession.UserID;
        dmDV.cdsUserUnitSuiteSampleNumFrac.Open;
        NumFracTotal := dmDV.cdsUserUnitSuiteSampleNumFracNUMFRAC.AsInteger;
        dmDV.cdsUserUnitSuiteSampleNumFrac.Close;
        //dmUser.SetDeveloperData('iwbCalculateProbabilityCurves - before UpdateNumFracTotal');
        dmDV.UpdateUserUnitSuiteSamplesNumFrac(NumFracTotal,UserProjectIDstr,tSampleNo);
        //dmUser.SetDeveloperData('iwbCalculateProbabilityCurves - before GetSampleData. Sample = '+tSampleNo);
        GetSampleData(tUserID,tRegAssocID,tSampleNo,NumFracIncluded);
        //dmUser.SetDeveloperData('iwbCalculateProbabilityCurves - before UpdateNumFracIncl');
        dmDV.UpdateUserUnitSuiteSamplesNumFracIncl('A',NumFracIncluded,UserProjectIDstr,tSampleNo);
        dmDV.cdsData.Filtered := false;
        dmDV.cdsUnitGrainAgeData.Filtered := false;
        dmDV.cdsData.First;
        repeat
          ii := ii + 1;
          dmDV.cdsUnitGrainAgeData.Append;
          dmDV.cdsUnitGrainAgeDataCountryID.AsString := tCountryID;
          dmDV.cdsUnitGrainAgeDataUnitID.AsInteger := tUnitID;
          dmDV.cdsUnitGrainAgeDataUnitName.AsString := tUnitName;
          dmDV.cdsUnitGrainAgeDataUnitRank.AsString := tUnitRank;
          dmDV.cdsUnitGrainAgeDataUnitAge.AsFloat := tUnitAge;
          dmDV.cdsUnitGrainAgeDataGrainAge.AsFloat := dmDV.cdsDataPreferredAge.AsFloat;
          dmDV.cdsUnitGrainAgeDataGrainAgeUncertainty.AsFloat := dmDV.cdsDataPreferredAgeSigma.AsFloat;
          dmDV.cdsUnitGrainAgeDataAnalysisNo.AsInteger := ii;
          dmDV.cdsUnitGrainAgeDataIncludeYN.AsString := dmDV.cdsDataIncludeYN.AsString;
          dmDV.cdsUnitGrainAgeDataSampleNo.AsString := dmDV.cdsDataSampleNo.AsString;
          dmDV.cdsUnitGrainAgeDataFrac.AsString := dmDV.cdsDataFrac.AsString;
          dmDV.cdsUnitGrainAgeDataZoneID.AsString := dmDV.cdsDataZoneID.AsString;
          dmDV.cdsUnitGrainAgeDataPercentConcordance.AsFloat := dmDV.cdsDataPercentConcordance.AsFloat;
          //dmDV.cdsUnitGrainAgeDataRegAssocID.AsString := tRegAssocID;
          dmDV.cdsUnitGrainAgeDataVar1.AsFloat := dmDV.cdsDataVar1.AsFloat;
          dmDV.cdsUnitGrainAgeDataVar2.AsFloat := dmDV.cdsDataVar2.AsFloat;
          dmDV.cdsUnitGrainAgeDataVar3.AsFloat := dmDV.cdsDataVar3.AsFloat;
          dmDV.cdsData.Next;
        until dmDV.cdsData.Eof;
        dmDV.cdsData.First;
        //WebApplication.ShowMessage(tSampleNo+' NumFracIncluded = '+IntToStr(NumFracIncluded));
        //calculate PDF for sample
        //dmUser.SetDeveloperData('iwbCalculateProbabilityCurves - before CalculatePDFY');
        CalculatePDF('Y',NumFracIncluded);
        //dmUser.SetDeveloperData('iwbCalculateProbabilityCurves - after CalculatePDFY');
        //combine multiple samples in a unit to one PDF for unit
        dmDV.cdsUnitPDF.Filtered := false;
        dmDV.cdsUnitPDF.Filter := 'UNITID = '+IntToStr(tUnitID);
        dmDV.cdsUnitPDF.Filtered := true;
        dmDV.cdsUnitPDF.First;
        dmDV.cdsSamplePDF.First;
        for k := 0 to Steps do
        begin
          //if (dmDV.cdsUnitPDFPDFvalue.AsFloat > 0.0001) then
          //begin
              //WebApplication.ShowMessage('UnitID = '+IntToStr(tUnitID)+' Step = '+IntToStr(k)+' Step samplepdf = '+IntToStr(dmDV.cdsSamplePDFStep.AsInteger)+' step unitpdf = '+IntToStr(dmDV.cdsUnitPDFStepID.AsInteger));
          //end;
          //if ((dmDV.cdsUnitPDFGrainAge.AsFloat <= 900.0) and (dmDV.cdsUnitPDFGrainAge.AsFloat >= 800.0) and (dmDV.cdsSamplePDFPDFValue.AsFloat > 0.00001)) then
          //begin
          //  WebApplication.ShowMessage('Sample compare Unit '+tSampleNo+' Unit Age = '+dmDV.cdsUnitPDFGrainAge.AsString+'  '+dmDV.cdsUnitPDFPDFvalue.AsString+' Sample Age = '+dmDV.cdsSamplePDFPDFDataValue.AsString+'  '+dmDV.cdsSamplePDFPDFValue.AsString);
          //end;
          dmDV.cdsUnitPDF.Edit;
          if (PDFtype = 'AND') then
          begin
            dmDV.cdsUnitPDFPDFvalue.AsFloat := dmDV.cdsUnitPDFPDFvalue.AsFloat + dmDV.cdsSamplePDFPDFValue.AsFloat;
            //if (dmDV.cdsUnitPDFPDFvalue.AsFloat > 0.0001) then
            //begin
              //WebApplication.ShowMessage('UnitID = '+IntToStr(tUnitID)+' Step = '+IntToStr(k)+' Age = '+FormatFloat('###0.000',dmDV.cdsUnitPDFGrainAge.AsFloat)+' PDF value = '+FormatFloat('###0.0000',dmDV.cdsUnitPDFPDFvalue.AsFloat));
            //end;
          end;
          if (PDFtype = 'OR') then
          begin
            if (dmDV.cdsSamplePDFPDFValue.AsFloat > dmDV.cdsUnitPDFPDFvalue.AsFloat) then
            begin
              dmDV.cdsUnitPDFPDFvalue.AsFloat := dmDV.cdsSamplePDFPDFValue.AsFloat;
            end;
          end;
          //if ((dmDV.cdsUnitPDFGrainAge.AsFloat <= 900.0) and (dmDV.cdsUnitPDFGrainAge.AsFloat >= 800.0) and (dmDV.cdsUnitPDFPDFvalue.AsFloat > 0.00001)) then
          //begin
          //  WebApplication.ShowMessage('Sample to Unit '+tSampleNo+' Age = '+dmDV.cdsUnitPDFGrainAge.AsString+'  '+dmDV.cdsUnitPDFPDFvalue.AsString);
          //end;
          dmDV.cdsUnitPDF.Next;
          dmDV.cdsSamplePDF.Next;
        end;
        dmDV.cdsSamplesForUnit.Next;
      until dmDV.cdsSamplesForUnit.Eof;
      dmDV.cdsUnitPDF.First;
      tempmax := 0.0;
      repeat
        if (tempmax < dmDV.cdsUnitPDFPDFvalue.AsFloat) then
        begin
          tempmax := dmDV.cdsUnitPDFPDFvalue.AsFloat;
        end;
        //WebApplication.ShowMessage(IntToStr(k)+'  tempmax = '+FormatFloat('###0.00000',tempmax));
        dmDV.cdsUnitPDF.Next;
      until dmDV.cdsUnitPDF.Eof;
      dmDV.cdsUnitPDF.First;
      //WebApplication.ShowMessage('UnitPDF '+IntToStr(k)+'  tempmax = '+FormatFloat('###0.00000',tempmax));
      if (tempmax <= 0.0) then tempmax := 1.0e-9;
      tempmax := 100.0/tempmax;
      if (tempmax <= 0.0) then tempmax := 1.0e-9;
      //WebApplication.ShowMessage('UnitPDF '+IntToStr(k)+'  tempmax = '+FormatFloat('###0.00000',tempmax));
      dmDV.cdsUnitPDF.First;
      repeat
        dmDV.cdsUnitPDF.Edit;
        dmDV.cdsUnitPDFPDFvalue.AsFloat := dmDV.cdsUnitPDFPDFvalue.AsFloat*tempmax;
        dmDV.cdsUnitPDF.Post;
        dmDV.cdsUnitPDF.Next;
      until dmDV.cdsUnitPDF.Eof;
      //delete all zero records to save space and time
      //WebApplication.ShowMessage('RecordCount = '+IntToStr(dmDV.cdsUnitPDF.RecordCount));
      //WebApplication.ShowMessage('Delete records with PDF values < '+FormatFloat('###0.00000',Cutoff1));
      dmDV.cdsUnitPDF.Last;
      repeat
        if (dmDV.cdsUnitPDFPDFvalue.AsFloat < Cutoff1) then dmDV.cdsUnitPDF.Delete;
        dmDV.cdsUnitPDF.Prior;
      until dmDV.cdsUnitPDF.Bof;
      //GraphPDF(tUnitID,tUnitAge);
      SetUserGrainPDF(UserProjectIDstr,tUserID,tUnitIDstr,tStepNoStr,tRegAssocID,tUnitAge,tNo);
      dmDV.cdsGrainUnits.Next;
    until dmDV.cdsGrainUnits.Eof;
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbCalculateProbabilityCurvesClick - 5');
    {
    Val(iweGraphAgeFrom.Text,FromAge,iCode);
    Val(iweGraphAgeTo.Text,ToAge,iCode);
    Val(iweXMin.Text,BottomAxisMin,iCode);
    Val(iweXMax.Text,BottomAxisMax,iCode);
    Val(iweYMin.Text,LeftAxisMin,iCode);
    Val(iweYMax.Text,LeftAxisMax,iCode);
    try
      ChartPDF.BottomAxis.SetMinMax(BottomAxisMin,BottomAxisMax);
      ChartPDF.LeftAxis.SetMinMax(LeftAxisMin,LeftAxisMax);
    except
    end;
    Val(iweXIncrement.Text,tXIncrement,iCode);
    Val(iweYIncrement.Text,tYIncrement,iCode);
    try
      ChartPDF.BottomAxis.Increment := tXIncrement;
      ChartPDF.LeftAxis.Increment := tYIncrement;
    except
    end;
    iwcbGraphsAutoscale.Checked := false;
    try
      MinX := ChartPDF.BottomAxis.Minimum;
      MaxX := ChartPDF.BottomAxis.Maximum;
      MinY := ChartPDF.LeftAxis.Minimum;
      MaxY := ChartPDF.LeftAxis.Maximum;
      MinXY := MinX;
      MaxXY := MaxX;
      if (MinY < MinXY) then MinXY := MinY;
      if (MaxY > MaxXY) then MaxXY := MaxY;
      i := Round(MinXY);
      imax := Round(MaxXY);
      while (i < MaxXY) do
      begin
        AgeValue := 1.0*i;
        ChartPDF.Series[5].AddXY(AgeValue,AgeValue);
        i := i + 20;
      end;
    except
    end;
    if PDFType='AND' then
    begin
      tmpStr := 'Gaussian AND ';
    end;
    if PDFType='OR' then
    begin
      tmpStr := 'Gaussian OR ';
    end;
    try
      ChartPDF.SubFoot.Text[0] := tmpStr;
      ChartPDF.SubFoot.Text[1] := 'Minimum age uncertainty = '+FormatFloat('###0.0',MinimumUncertainty)+' Ma';
      //dmDV.cdsData.Close;
      //dmDV.cdsSamplePDF.Close;
      //dmDV.cdsUnitPDF.Close;
      ChartPDF.Series[0].Title := Trim(iwe1.Text)+' - '+Trim(iwe2.Text);
      ChartPDF.Series[1].Title := Trim(iwe2.Text)+' - '+Trim(iwe3.Text);
      ChartPDF.Series[2].Title := Trim(iwe3.Text)+' - '+Trim(iwe4.Text);
      ChartPDF.Series[3].Title := Trim(iwe4.Text)+' - '+Trim(iwe5.Text);
      ChartPDF.Series[4].Title := Trim(iwe5.Text)+' - '+Trim('100.0');
    except
    end;
    iwbDownloadGrainCurves.Enabled := true;
    }
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbCalculateProbabilityCurvesClick - 6a');
    iwbGraphExistingProbabilityCurvesClick(Sender);
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbCalculateProbabilityCurvesClick - 6b');
    iwbPopulateChemistryGraphClick(Sender);
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbCalculateProbabilityCurvesClick - 6c');
    iwbPopulateChemistryGraph.Enabled := true;
    iwbDownloadGrainAgeData.Enabled := true;
  end else
  begin
    WebApplication.ShowMessage('A valid UserProject must be selected');
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwbDeleteUnitRecordClick(Sender: TObject);
begin
  try
    dmStrat.cdsUserUnits.Delete;
    dmStrat.cdsUserUnits.Post;
    dmStrat.cdsUserUnits.ApplyUpdates(0);
  except
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwbDeleteUnitsSamplesRecordClick(
  Sender: TObject);
begin
  try
    //dmUser.SetDeveloperData('1 before delete userunitsuitesamples');
    dmDV.cdsUserUnitSuiteSamples.Delete;
    //dmDV.cdsUserUnitSuiteSamples.Post;
    dmDV.cdsUserUnitSuiteSamples.ApplyUpdates(0);
    //dmUser.SetDeveloperData('2 after delete userunitsuitesamples');
  except
    dmUser.SetDeveloperData('3 except delete userunitsuitesamples');
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwbDeleteUserGrainAgePDFClick(
  Sender: TObject);
var
  UserProjectIDstr : string;
begin
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  //GetListBoxValues(iwlbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserSession.UserProjectValues);
  //UserProjectIDstr := UserSession.UserProjectvalues[0];
  //UserProjectIDstr := UserProjectIDstring;
  if (UserProjectIDstr <> '') then
  begin
    dmDV.DeleteUserGrainAgePDF(UserProjectIDstr);
    iwbDownloadGrainCurves.Enabled := false;
  end else
  begin
    WebApplication.ShowMessage('A valid UserProject must be selected');
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwbDownloadDataClick(Sender: TObject);
const
  VariableToSelect = 'Age_preferred';
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  UserProjectIDstr : string;
  tUserID, tRegAssocID, tSampleNo : string;
  tUnitAge : double;
  tUnitID : integer;
  tCountryID, tUnitName, tUnitRank : string;
  i, imax, iStart, ii : integer;
  MinX, MaxX, MinY, MaxY, MinXY, MaxXY, AgeValue : double;
  PDFtype : string;
  NumFracIncluded : integer;
  tmpStr : string;
  iCode : integer;
  k : integer;
  FromAge, ToAge : double;
  BottomAxisMin, BottomAxisMax,
  LeftAxisMin, LeftAxisMax : double;
  tXIncrement, tYIncrement : double;
  Cutoff : double;
  tGrainAge, tZ : double;
  x1 : double;
  tUnitIDstr,
  tUnitAgeStr, tStepNoStr : string;
  tNo : integer;
begin
  tNo := 0;
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  if (UserProjectIDstr <> '') then
  begin
    ii := 0;
    dmDV.cdsUnitGrainAgeData.Open;
    dmDV.cdsUnitGrainAgeData.Filtered := false;
    dmDV.cdsUnitGrainAgeData.EmptyDataSet;
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbGetChemistryDataClick - 1');
    iStart := 0;
    tRegAssocID := 'UPb';
    if (iwrgIsotopeSystemVariable.ItemIndex = 0) then
    begin
      tRegAssocID := 'UPb';
    end;
    if (iwrgIsotopeSystemVariable.ItemIndex = 1) then
    begin
      tRegAssocID := 'LuHf';
    end;
    if (iwrgIsotopeSystemVariable.ItemIndex = 2) then
    begin
      tRegAssocID := 'zrC';
    end;
    tUserID := UserSession.UserID;
    dmDV.ConstructRawDataSampleQuery;
    dmUser.SetDeveloperData('ConstructRawDataSampleQuery complete');
    dmUser.SetDeveloperData('tRegAssocID = '+tRegAssocID);
    dmUser.SetDeveloperData(dmDV.qRawSmp.SQL.Text);
    //dmDV.cdsData.Open;
    dmDV.cdsUserUnitSuiteSamplesUnits.Close;
    dmDV.qUserUnitSuiteSamplesUnits.Close;
    dmDV.qUserUnitSuiteSamplesUnits.ParamByName('ProjectID').AsString := UserProjectIDstr;
    dmDV.cdsUserUnitSuiteSamplesUnits.Open;
    //dmDV.cdsGrainUnits.Open;
    //dmDV.cdsGrainUnits.EmptyDataSet;
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbGetChemistryDataClick - 3');
    repeat
      tUnitID := dmDV.cdsUserUnitSuiteSamplesUnitsSTRATDBUNITID.AsInteger;
      tUnitIDstr := IntToStr(tUnitID);
      try
        dmDV.cdsGrainUnits.Append;
        dmDV.cdsGrainUnitsUnitID.AsInteger := tUnitID;
        dmDV.cdsGrainUnits.Post;
      except
      end;
      dmDV.cdsUserUnitSuiteSamplesUnits.Next;
    until dmDV.cdsUserUnitSuiteSamplesUnits.Eof;
    dmDV.cdsUserUnitSuiteSamplesUnits.Close;
    dmDV.cdsUserUnitSuiteSamples.First;
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbGetChemistryDataClick - 4');
    dmDV.cdsGrainUnits.First;
    i := 0;
    repeat
      ii := ii + 1;
      tUnitID := dmDV.cdsGrainUnitsUnitID.AsInteger;
      tUnitIDstr := IntToStr(tUnitID);
      //dmUser.SetDeveloperData('iwbGetChemistryDataClick - '+tUnitIDstr);
      //dmDV.cdsUnitGrainAgeData.Filtered := false;
      //WebApplication.ShowMessage('UnitID is '+dmDV.cdsGrainUnitsUnitID.AsString);
      dmDV.cdsSamplesForUnit.Close;
      dmDV.qSamplesForUnit.Close;
      dmUser.SetDeveloperData('qSamplesForUnit');
      dmUser.SetDeveloperData(dmDV.qSamplesForUnit.SQL.Text);
      dmDV.qSamplesForUnit.ParamByName('ProjectID').AsString := UserProjectIDstr;
      dmDV.qSamplesForUnit.ParamByName('UnitID').AsInteger := dmDV.cdsGrainUnitsUnitID.AsInteger;
      dmDV.cdsSamplesForUnit.Open;
      dmDV.cdsSamplesForUnit.First;
      repeat
        ii := ii + 1;
        tCountryID := dmDV.cdsSamplesForUnitCOUNTRYID.AsString;
        tUnitName := dmDV.cdsSamplesForUnitSTRATDBUNITNAME.AsString;
        tUnitID := dmDV.cdsSamplesForUnitSTRATDBUNITID.AsInteger;
        tUnitRank := dmDV.cdsSamplesForUnitSTRATDBUNITRANK.AsString;
        tSampleNo := dmDV.cdsSamplesForUnitSAMPLENO.AsString;
        tUnitAge := dmDV.cdsSamplesForUnitSTRATDBUNITAGE.AsFloat;
        tUnitAgeStr := FormatFloat('###0.000',tUnitAge);
        dmUser.SetDeveloperData('iwbGetChemistryDataClick - before GetSampleData. Unit age = '+tUnitAgeStr+'   Sample = '+tSampleNo);
        GetSampleData(tUserID,tRegAssocID,tSampleNo,NumFracIncluded);   //gets data and adds to cdsData in Var1, Var and Var3
        //dmUser.SetDeveloperData('iwbGetChemistryDataClick - before assign UnitGrainAgeData loop');
        dmDV.cdsData.Filtered := false;
        dmDV.cdsUnitGrainAgeData.Filtered := false;
        dmDV.cdsData.First;
        repeat
          ii := ii + 1;
          dmDV.cdsUnitGrainAgeData.Append;
          dmDV.cdsUnitGrainAgeDataCountryID.AsString := tCountryID;
          dmDV.cdsUnitGrainAgeDataUnitID.AsInteger := tUnitID;
          dmDV.cdsUnitGrainAgeDataUnitName.AsString := tUnitName;
          dmDV.cdsUnitGrainAgeDataUnitRank.AsString := tUnitRank;
          dmDV.cdsUnitGrainAgeDataUnitAge.AsFloat := tUnitAge;
          dmDV.cdsUnitGrainAgeDataGrainAge.AsFloat := dmDV.cdsDataPreferredAge.AsFloat;
          dmDV.cdsUnitGrainAgeDataGrainAgeUncertainty.AsFloat := dmDV.cdsDataPreferredAgeSigma.AsFloat;
          dmDV.cdsUnitGrainAgeDataAnalysisNo.AsInteger := ii;
          dmDV.cdsUnitGrainAgeDataIncludeYN.AsString := dmDV.cdsDataIncludeYN.AsString;
          dmDV.cdsUnitGrainAgeDataSampleNo.AsString := dmDV.cdsDataSampleNo.AsString;
          dmDV.cdsUnitGrainAgeDataFrac.AsString := dmDV.cdsDataFrac.AsString;
          dmDV.cdsUnitGrainAgeDataZoneID.AsString := dmDV.cdsDataZoneID.AsString;
          dmDV.cdsUnitGrainAgeDataPercentConcordance.AsFloat := dmDV.cdsDataPercentConcordance.AsFloat;
          //dmDV.cdsUnitGrainAgeDataRegAssocID.AsString := tRegAssocID;
          dmDV.cdsUnitGrainAgeDataVar1.AsFloat := dmDV.cdsDataVar1.AsFloat;
          dmDV.cdsUnitGrainAgeDataVar2.AsFloat := dmDV.cdsDataVar2.AsFloat;
          dmDV.cdsUnitGrainAgeDataVar3.AsFloat := dmDV.cdsDataVar3.AsFloat;
          dmDV.cdsData.Next;
        until dmDV.cdsData.Eof;
        dmDV.cdsSamplesForUnit.Next;
      until dmDV.cdsSamplesForUnit.Eof;
      //WebApplication.ShowMessage('Unit '+tUnitName+' '+tUnitRank+' ('+tUnitIDstr+') completed');
      dmDV.cdsGrainUnits.Next;
    until dmDV.cdsGrainUnits.Eof;
  end else
  begin
    WebApplication.ShowMessage('A valid UserProject must be selected');
  end;
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  dmDV.cdsUnitGrainAgeData.Open;
  dmDV.cdsUnitGrainAgeData.First;
  //dmDV.FlexcelReportGrainData.Template := DefaultFlexCellFolder+'FlxStratDBGrainData.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBCompleteGrainData.xlsx';
  frFileNameStr := 'Grain Data for Lithostratigraphic Units.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsUnitGrainAgeData',dmDV.cdsUnitGrainAgeData);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        //dmDV.FlexcelReportGrainData.SavetoStream(MemStream);
        //WebApplication.SendStream(MemStream,true,'','Grain Data for Lithostratigraphic Units.xlsx'); //save as an attachment
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
      end; //finally
    finally
      Instream.Free;
    end;
  finally
    fr.Free;
  end;
end;



procedure TISFGridGrainProbabilityUnits.iwbDownloadGrainAgeDataClick(
  Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  UserProjectIDstr : string;
begin
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  //UserProjectIDstr := UserProjectIDstring;
  //Val(UserProjectIDstr,UserProjectID,iCode);
  dmDV.cdsUnitGrainAgeData.Open;
  dmDV.cdsUnitGrainAgeData.First;
  //dmDV.FlexcelReportGrainData.Template := DefaultFlexCellFolder+'FlxStratDBGrainData.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBGrainData.xlsx';
  frFileNameStr := 'Grain Data for Lithostratigraphic Units.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsUnitGrainAgeData',dmDV.cdsUnitGrainAgeData);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        //dmDV.FlexcelReportGrainData.SavetoStream(MemStream);
        //WebApplication.SendStream(MemStream,true,'','Grain Data for Lithostratigraphic Units.xlsx'); //save as an attachment
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
      end; //finally
    finally
      Instream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwbDownloadGrainCurvesClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  UserProjectIDstr : string;
begin
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  //GetListBoxValues(iwlbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserSession.UserProjectValues);
  //UserProjectIDstr := UserSession.UserProjectvalues[0];
  //UserProjectIDstr := UserProjectIDstring;
  dmDV.cdsUserUnitGrainAgePDF.Close;
  dmDV.cdsUserUnitGrainAgePDF.Close;
  dmDV.qUserUnitGrainAgePDF.Close;
  dmDV.qUserUnitGrainAgePDF.ParamByName('ProjectID').AsString := UserProjectIDstr;
  dmDV.cdsUserUnitGrainAgePDF.Open;
  //dmDV.FlexcelReportGrainPDF.Template := DefaultFlexCellFolder+'FlxStratDBGrainPDF.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBGrainPDF.xlsx';
  frFileNameStr := 'Probabilities for Lithostratigraphic Units.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsUserUnitGrainAgePDF',dmDV.cdsUserUnitGrainAgePDF);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        //dmDV.FlexcelReportGrainPDF.SavetoStream(MemStream);
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwbDownloadUnitsClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmStrat.cdsUserUnits.Open;
  dmStrat.cdsUserUnits.First;
  //dmStrat.FlexcelReportUserUnits.Template := DefaultFlexCellFolder+'FlxStratDBUserUnits.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBUserUnits.xlsx';
  frFileNameStr := 'User Units.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsUserUnits',dmStrat.cdsUserUnits);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        //dmStrat.FlexcelReportUserUnits.SavetoStream(MemStream);
        //WebApplication.SendStream(MemStream,true,'','User Units.xlsx'); //save as an attachment
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwbDownloadUnitsSamplesClick(
  Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  UserProjectIDstr : string;
begin
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  //GetListBoxValues(iwlbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserSession.UserProjectValues);
  //UserProjectIDstr := UserSession.UserProjectvalues[0];
  //UserProjectIDstr := UserProjectIDstring;
  if (UserProjectIDstr <> '') then
  begin
    dmDV.cdsUserUnitSuiteSamples.Close;
    dmDV.qUserUnitSuiteSamples.Close;
    dmDV.qUserUnitSuiteSamples.ParamByName('ProjectID').AsString := UserProjectIDstr;
    //dmDV.qUserUnitSuiteSamples.ParamByName('UserID').AsString := UserSession.UserID;
    dmDV.cdsUserUnitSuiteSamples.Open;
    dmDV.cdsUserUnitSuiteSamples.First;
    //dmDV.FlexcelReportUnitSuiteSamples.Template := DefaultFlexCellFolder+'FlxStratDBUserUnitSamples.xlsx';
    frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBUserUnitSamples.xlsx';
    frFileNameStr := 'Units_Suites_Samples.xlsx';
    fr := TFlexCelReport.Create(true);
    try
      fr.AddTable('cdsUserUnitSuiteSamples',dmDV.cdsUserUnitSuiteSamples);
      InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
      try
        MemStream:=TMemoryStream.Create;
        try
          //dmDV.FlexcelReportUnitSuiteSamples.SavetoStream(MemStream);
          //WebApplication.SendStream(MemStream,true,'','Units_Suites_Samples.xlsx'); //save as an attachment
          fr.Run(InStream,MemStream);
          WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
          MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
        finally
          MemStream.Free;
        end; //finally
      finally
        InStream.Free;
      end;
    finally
      fr.Free;
    end;
  end else
  begin
    WebApplication.ShowMessage('A valid UserProject must be selected');
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwbGetChemistryAgeDataClick(
  Sender: TObject);
const
  VariableToSelect = 'Age_preferred';
var
  tUserID, tRegAssocID, tSampleNo : string;
  tUnitAge : double;
  tUnitID : integer;
  tCountryID, tUnitName, tUnitRank : string;
  i, imax, iStart, ii : integer;
  MinX, MaxX, MinY, MaxY, MinXY, MaxXY, AgeValue : double;
  UserProjectIDstr : string;
  PDFtype : string;
  NumFracIncluded : integer;
  tmpStr : string;
  iCode : integer;
  k : integer;
  FromAge, ToAge : double;
  BottomAxisMin, BottomAxisMax,
  LeftAxisMin, LeftAxisMax : double;
  tXIncrement, tYIncrement : double;
  Cutoff : double;
  tGrainAge, tZ : double;
  x1 : double;
  tUnitIDstr,
  tUnitAgeStr, tStepNoStr : string;
  tNo : integer;
begin
  //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbGetChemistryDataClick - 0');
  tNo := 0;
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  //GetListBoxValues(iwlbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserSession.UserProjectValues);
  //UserProjectIDstr := UserSession.UserProjectvalues[0];
  //UserProjectIDstr := UserProjectIDstring;
  if (UserProjectIDstr <> '') then
  begin
    ii := 0;
    dmDV.cdsUnitGrainAgeData.Open;
    dmDV.cdsUnitGrainAgeData.Filtered := false;
    dmDV.cdsUnitGrainAgeData.EmptyDataSet;
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbGetChemistryDataClick - 1');
    iStart := 0;
    tRegAssocID := 'UPb';
    if (iwrgIsotopeSystemVariable.ItemIndex = 0) then
    begin
      tRegAssocID := 'UPb';
    end;
    if (iwrgIsotopeSystemVariable.ItemIndex = 1) then
    begin
      tRegAssocID := 'LuHf';
    end;
    if (iwrgIsotopeSystemVariable.ItemIndex = 2) then
    begin
      tRegAssocID := 'zrC';
    end;
    tUserID := UserSession.UserID;
    dmDV.ConstructRawDataSampleQuery;
    dmUser.SetDeveloperData('ConstructRawDataSampleQuery');
    dmUser.SetDeveloperData('tRegAssocID = '+tRegAssocID);
    dmUser.SetDeveloperData(dmDV.qRawSmp.SQL.Text);
    dmDV.cdsData.Open;
    dmDV.cdsUserUnitSuiteSamplesUnits.Close;
    dmDV.qUserUnitSuiteSamplesUnits.Close;
    dmDV.qUserUnitSuiteSamplesUnits.ParamByName('ProjectID').AsString := UserProjectIDstr;
    dmDV.cdsUserUnitSuiteSamplesUnits.Open;
    dmDV.cdsGrainUnits.Open;
    dmDV.cdsGrainUnits.EmptyDataSet;
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbGetChemistryDataClick - 3');
    repeat
      tUnitID := dmDV.cdsUserUnitSuiteSamplesUnitsSTRATDBUNITID.AsInteger;
      tUnitIDstr := IntToStr(tUnitID);
      try
        dmDV.cdsGrainUnits.Append;
        dmDV.cdsGrainUnitsUnitID.AsInteger := tUnitID;
        dmDV.cdsGrainUnits.Post;
      except
      end;
      dmDV.cdsUserUnitSuiteSamplesUnits.Next;
    until dmDV.cdsUserUnitSuiteSamplesUnits.Eof;
    dmDV.cdsUserUnitSuiteSamplesUnits.Close;
    dmDV.cdsUserUnitSuiteSamples.First;
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbGetChemistryDataClick - 4');
    dmDV.cdsGrainUnits.First;
    i := 0;
    repeat
      ii := ii + 1;
      tUnitID := dmDV.cdsGrainUnitsUnitID.AsInteger;
      tUnitIDstr := IntToStr(tUnitID);
      //dmUser.SetDeveloperData('iwbGetChemistryDataClick - '+tUnitIDstr);
      dmDV.cdsUnitGrainAgeData.Filtered := false;
      //WebApplication.ShowMessage('UnitID is '+dmDV.cdsGrainUnitsUnitID.AsString);
      dmDV.cdsSamplesForUnit.Close;
      dmDV.qSamplesForUnit.Close;
      dmUser.SetDeveloperData('qSamplesForUnit');
      dmUser.SetDeveloperData(dmDV.qSamplesForUnit.SQL.Text);
      dmDV.qSamplesForUnit.ParamByName('ProjectID').AsString := UserProjectIDstr;
      dmDV.qSamplesForUnit.ParamByName('UnitID').AsInteger := dmDV.cdsGrainUnitsUnitID.AsInteger;
      dmDV.cdsSamplesForUnit.Open;
      dmDV.cdsSamplesForUnit.First;
      //repeat
        //WebApplication.ShowMessage('Sample is '+dmDV.cdsSamplesForUnitSAMPLENO.AsString);
      // dmDV.cdsSamplesForUnit.Next;
      //until dmDV.cdsSamplesForUnit.Eof;
      //dmUser.SetDeveloperData('iwbCalculateProbabilityCurvesClick - 4a');
      dmDV.cdsSamplesForUnit.First;
      repeat
        ii := ii + 1;
        tCountryID := dmDV.cdsSamplesForUnitCOUNTRYID.AsString;
        tUnitName := dmDV.cdsSamplesForUnitSTRATDBUNITNAME.AsString;
        tUnitID := dmDV.cdsSamplesForUnitSTRATDBUNITID.AsInteger;
        tUnitRank := dmDV.cdsSamplesForUnitSTRATDBUNITRANK.AsString;
        tSampleNo := dmDV.cdsSamplesForUnitSAMPLENO.AsString;
        tUnitAge := dmDV.cdsSamplesForUnitSTRATDBUNITAGE.AsFloat;
        tUnitAgeStr := FormatFloat('###0.000',tUnitAge);
        dmUser.SetDeveloperData('iwbGetChemistryDataClick - before GetSampleData. Unit age = '+tUnitAgeStr+'   Sample = '+tSampleNo);
        GetSampleData(tUserID,tRegAssocID,tSampleNo,NumFracIncluded);   //gets data and adds to cdsData in Var1, Var and Var3
        //dmUser.SetDeveloperData('iwbGetChemistryDataClick - before assign UnitGrainAgeData loop');
        dmDV.cdsData.Filtered := false;
        dmDV.cdsUnitGrainAgeData.Filtered := false;
        dmDV.cdsData.First;
        repeat
          ii := ii + 1;
          dmDV.cdsUnitGrainAgeData.Append;
          dmDV.cdsUnitGrainAgeDataCountryID.AsString := tCountryID;
          dmDV.cdsUnitGrainAgeDataUnitID.AsInteger := tUnitID;
          dmDV.cdsUnitGrainAgeDataUnitName.AsString := tUnitName;
          dmDV.cdsUnitGrainAgeDataUnitRank.AsString := tUnitRank;
          dmDV.cdsUnitGrainAgeDataUnitAge.AsFloat := tUnitAge;
          dmDV.cdsUnitGrainAgeDataGrainAge.AsFloat := dmDV.cdsDataPreferredAge.AsFloat;
          dmDV.cdsUnitGrainAgeDataGrainAgeUncertainty.AsFloat := dmDV.cdsDataPreferredAgeSigma.AsFloat;
          dmDV.cdsUnitGrainAgeDataAnalysisNo.AsInteger := ii;
          dmDV.cdsUnitGrainAgeDataIncludeYN.AsString := dmDV.cdsDataIncludeYN.AsString;
          dmDV.cdsUnitGrainAgeDataSampleNo.AsString := dmDV.cdsDataSampleNo.AsString;
          dmDV.cdsUnitGrainAgeDataFrac.AsString := dmDV.cdsDataFrac.AsString;
          dmDV.cdsUnitGrainAgeDataZoneID.AsString := dmDV.cdsDataZoneID.AsString;
          dmDV.cdsUnitGrainAgeDataPercentConcordance.AsFloat := dmDV.cdsDataPercentConcordance.AsFloat;
          //dmDV.cdsUnitGrainAgeDataRegAssocID.AsString := tRegAssocID;
          dmDV.cdsUnitGrainAgeDataVar1.AsFloat := dmDV.cdsDataVar1.AsFloat;
          dmDV.cdsUnitGrainAgeDataVar2.AsFloat := dmDV.cdsDataVar2.AsFloat;
          dmDV.cdsUnitGrainAgeDataVar3.AsFloat := dmDV.cdsDataVar3.AsFloat;
          dmDV.cdsData.Next;
        until dmDV.cdsData.Eof;
        dmDV.cdsSamplesForUnit.Next;
      until dmDV.cdsSamplesForUnit.Eof;
      //WebApplication.ShowMessage('Unit '+tUnitName+' '+tUnitRank+' ('+tUnitIDstr+') completed');
      dmDV.cdsGrainUnits.Next;
    until dmDV.cdsGrainUnits.Eof;
    iwbPopulateChemistryGraphClick(Sender);
  end else
  begin
    WebApplication.ShowMessage('A valid UserProject must be selected');
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwbGraphExistingProbabilityCurvesClick(
  Sender: TObject);
var
  tUserID, tRegAssocID : string;
  tUnitAge : double;
  tUnitID : integer;
  i, imax, iStart : integer;
  MinX, MaxX, MinY, MaxY, MinXY, MaxXY, AgeValue : double;
  UserProjectIDstr : string;
  PDFtype : string;
  tmpStr : string;
  iCode : integer;
  MinimumUncertainty : double;
  FromAge, ToAge : double;
  BottomAxisMin, BottomAxisMax,
  LeftAxisMin, LeftAxisMax : double;
  tXIncrement, tYIncrement : double;
  tNo : integer;
begin
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  //GetListBoxValues(iwlbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserSession.UserProjectValues);
  //UserProjectIDstr := UserSession.UserProjectvalues[0];
  //UserProjectIDstr := UserProjectIDstring;
  if (UserProjectIDstr <> '') then
  begin
    dmDV.cdsUserUnitGrainAgePDF.Close;
    dmDV.qUserUnitGrainAgePDF.Close;
    dmDV.qUserUnitGrainAgePDF.ParamByName('ProjectID').AsString := UserProjectIDstr;
    dmDV.cdsUserUnitGrainAgePDF.Open;
    tNo := 0;
    Val(iweGraphAgeFrom.Text,FromAge,iCode);
    Val(iweGraphAgeTo.Text,ToAge,iCode);
    Val(iweMinimumUncertainty.Text,MinimumUncertainty,iCode);
    if (iwrgAndOr.ItemIndex = 0) then PDFtype := 'AND';
    if (iwrgAndOr.ItemIndex = 1) then PDFtype := 'OR';
    iStart := 0;
    tRegAssocID := 'UPb';
    if (iwrgIsotopeSystemVariable.ItemIndex = 0) then
    begin
      tRegAssocID := 'UPb';
    end;
    if (iwrgIsotopeSystemVariable.ItemIndex = 1) then
    begin
      tRegAssocID := 'LuHf';
    end;
    if (iwrgIsotopeSystemVariable.ItemIndex = 2) then
    begin
      tRegAssocID := 'zrC';
    end;
    tUserID := UserSession.UserID;
    try
      ChartPDF.Series[0].Clear;
      ChartPDF.Series[1].Clear;
      ChartPDF.Series[2].Clear;
      ChartPDF.Series[3].Clear;
      ChartPDF.Series[4].Clear;
      ChartPDF.Series[5].Clear;
    except
    end;
    dmDV.cdsUserUnitGrainAgePDF.First;
    GraphExistingPDF;
    Val(iweGraphAgeFrom.Text,FromAge,iCode);
    Val(iweGraphAgeTo.Text,ToAge,iCode);
    Val(iweXMin.Text,BottomAxisMin,iCode);
    Val(iweXMax.Text,BottomAxisMax,iCode);
    Val(iweYMin.Text,LeftAxisMin,iCode);
    Val(iweYMax.Text,LeftAxisMax,iCode);
    try
      ChartPDF.BottomAxis.SetMinMax(BottomAxisMin,BottomAxisMax);
      ChartPDF.LeftAxis.SetMinMax(LeftAxisMin,LeftAxisMax);
    except
    end;
    Val(iweXIncrement.Text,tXIncrement,iCode);
    Val(iweYIncrement.Text,tYIncrement,iCode);
    try
      ChartPDF.BottomAxis.Increment := tXIncrement;
      ChartPDF.LeftAxis.Increment := tYIncrement;
    except
    end;
    iwcbGraphsAutoscale.Checked := false;
    try
      MinX := ChartPDF.BottomAxis.Minimum;
      MaxX := ChartPDF.BottomAxis.Maximum;
      MinY := ChartPDF.LeftAxis.Minimum;
      MaxY := ChartPDF.LeftAxis.Maximum;
      MinXY := MinX;
      MaxXY := MaxX;
      if (MinY < MinXY) then MinXY := MinY;
      if (MaxY > MaxXY) then MaxXY := MaxY;
      i := Round(MinXY);
      imax := Round(MaxXY);
      while (i < MaxXY) do
      begin
        AgeValue := 1.0*i;
        ChartPDF.Series[5].AddXY(AgeValue,AgeValue);
        i := i + 20;
      end;
    except
    end;
    if PDFType='AND' then
    begin
      tmpStr := 'Gaussian AND ';
    end;
    if PDFType='OR' then
    begin
      tmpStr := 'Gaussian OR ';
    end;
    try
      ChartPDF.SubFoot.Text[0] := tmpStr;
      ChartPDF.SubFoot.Text[1] := 'Minimum age uncertainty = '+FormatFloat('###0.0',MinimumUncertainty)+' Ma';
      ChartPDF.Series[0].Title := Trim(iwe1.Text)+' - '+Trim(iwe2.Text);
      ChartPDF.Series[1].Title := Trim(iwe2.Text)+' - '+Trim(iwe3.Text);
      ChartPDF.Series[2].Title := Trim(iwe3.Text)+' - '+Trim(iwe4.Text);
      ChartPDF.Series[3].Title := Trim(iwe4.Text)+' - '+Trim(iwe5.Text);
      ChartPDF.Series[4].Title := Trim(iwe5.Text)+' - '+Trim('100.0');
    except
    end;
    iwbDownloadGrainCurves.Enabled := true;
  end else
  begin
    WebApplication.ShowMessage('A valid UserProject must be selected');
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwbPopulateChemistryGraphClick(Sender: TObject);
var
  tUnitAge : double;
  tUnitID : integer;
  tIncludeYN : string;
  i, iMax : integer;
  iNabove, iNbelow : integer;
  MinX, MaxX, MinY, MaxY, MinXY, MaxXY, AgeValue : double;
  iCode : integer;
  BottomAxisMin, BottomAxisMax,
  LeftAxisMin, LeftAxisMax : double;
  tXIncrement, tYIncrement : double;
  Cutoff : double;
  tGrainAge, tZ : double;
  tNabove, tNbelow : integer;
begin
  //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbPopulateChemistryGraphClick - 0');
  dmDV.cdsUnitGrainAgeData.Open;
  ChartChem.Series[0].Clear;
  ChartChem.Series[1].Clear;
  ChartChem.Series[2].Clear;
  ChartChem.Series[2].Visible := true;
  //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbPopulateChemistryGraphClick - 1');
  if (iwcbVar1.Checked) then
  begin
    Val(iweVar1Cutoff.Text,Cutoff,iCode);
    ChartChem.Series[0].Title := 'Th/U > Chosen value';
    ChartChem.Series[1].Title := 'Th/U <= Chosen value';
  end;
  if (iwcbVar2.Checked) then
  begin
    Val(iweVar2Cutoff.Text,Cutoff,iCode);
    ChartChem.Series[0].Title := 'Temperature > Chosen value';
    ChartChem.Series[1].Title := 'Temperature <= Chosen value';
  end;
  if (iwcbVar3.Checked) then
  begin
    Val(iweVar3Cutoff.Text,Cutoff,iCode);
    ChartChem.Series[0].Title := 'delta 18 Oxygen > Chosen value';
    ChartChem.Series[1].Title := 'delta 18 Oxygen <= Chosen value';
  end;
  //dmUser.SetDeveloperData('Cutoff = '+FormatFloat('####0.0000',Cutoff));
  //dmDV.cdsUnitGrainAgeData.Filtered := false;
  //dmDV.cdsUnitGrainAgeData.Filter := 'Var1 > 0.1';
  //dmDV.cdsUnitGrainAgeData.Filtered := true;
  //tNabove := dmDV.cdsUnitGrainAgeData.RecordCount;
  //dmUser.SetDeveloperData('tNabove = '+IntToStr(tNabove));
  //dmDV.cdsUnitGrainAgeData.Filtered := false;
  //dmDV.cdsUnitGrainAgeData.Filter := 'Var1 <= 0.1 and Var1 > -999.99';
  //dmDV.cdsUnitGrainAgeData.Filtered := true;
  //tNbelow := dmDV.cdsUnitGrainAgeData.RecordCount;
  //dmUser.SetDeveloperData('tNbelow = '+IntToStr(tNbelow));
  dmDV.cdsUnitGrainAgeData.Filtered := false;
  iNabove := 0;
  iNbelow := 0;
  dmDV.cdsUnitGrainAgeData.First;
  repeat
    tUnitAge := dmDV.cdsUnitGrainAgeDataUnitAge.AsFloat;
    tGrainAge := dmDV.cdsUnitGrainAgeDataGrainAge.AsFloat;
    tIncludeYN := dmDV.cdsUnitGrainAgeDataIncludeYN.AsString;
    if (iwcbVar1.Checked) then
    begin
      tZ  := dmDV.cdsUnitGrainAgeDataVar1.AsFloat;
    end;
    if (iwcbVar2.Checked) then
    begin
      tZ  := dmDV.cdsUnitGrainAgeDataVar2.AsFloat;
    end;
    if (iwcbVar3.Checked) then
    begin
      tZ  := dmDV.cdsUnitGrainAgeDataVar3.AsFloat;
    end;
    if ((tZ > Cutoff) and (tZ > DefaultMissingValue) and (tIncludeYN = 'Y')) then
    begin
      ChartChem.Series[0].AddXY(tGrainAge,tUnitAge);
      iNabove := iNabove + 1;
    end;
    if ((tZ <= Cutoff) and (tZ > DefaultMissingValue) and (tIncludeYN = 'Y')) then
    begin
      ChartChem.Series[1].AddXY(tGrainAge,tUnitAge);
      iNbelow := iNbelow + 1;
    end;
    dmDV.cdsUnitGrainAgeData.Next;
  until dmDV.cdsUnitGrainAgeData.Eof;
  //dmUser.SetDeveloperData('iNabove = '+IntToStr(iNabove));
  //dmUser.SetDeveloperData('iNbelow = '+IntToStr(iNbelow));
  Val(iweXMin.Text,BottomAxisMin,iCode);
  Val(iweXMax.Text,BottomAxisMax,iCode);
  Val(iweYMin.Text,LeftAxisMin,iCode);
  Val(iweYMax.Text,LeftAxisMax,iCode);
  try
    ChartChem.BottomAxis.SetMinMax(BottomAxisMin,BottomAxisMax);
    ChartChem.LeftAxis.SetMinMax(LeftAxisMin,LeftAxisMax);
  except
  end;
  Val(iweXIncrement.Text,tXIncrement,iCode);
  Val(iweYIncrement.Text,tYIncrement,iCode);
  try
    ChartChem.BottomAxis.Increment := tXIncrement;
    ChartChem.LeftAxis.Increment := tYIncrement;
  except
  end;
  iwcbGraphsAutoscale.Checked := false;
  if (iwcbShowAboveCutoff.Checked) then ChartChem.Series[0].Visible := true
                                   else ChartChem.Series[0].Visible := false;
  if (iwcbShowBelowCutoff.Checked) then ChartChem.Series[1].Visible := true
                                   else ChartChem.Series[1].Visible := false;
  try
    MinX := ChartChem.BottomAxis.Minimum;
    MaxX := ChartChem.BottomAxis.Maximum;
    MinY := ChartChem.LeftAxis.Minimum;
    MaxY := ChartChem.LeftAxis.Maximum;
    MinXY := MinX;
    MaxXY := MaxX;
    if (MinY < MinXY) then MinXY := MinY;
    if (MaxY > MaxXY) then MaxXY := MaxY;
    i := Round(MinXY);
    imax := Round(MaxXY);
    while (i < MaxXY) do
    begin
      AgeValue := 1.0*i;
      ChartChem.Series[2].AddXY(AgeValue,AgeValue);
      i := i + 20;
    end;
  except
  end;
  iwbDownloadGrainAgeData.Enabled := true;
end;

procedure TISFGridGrainProbabilityUnits.iwbReturnClick(Sender: TObject);
begin
  try
    dmStrat.cdsUserUnits.Close;
    dmDV.cdsUserUnitSuiteSamples.Close;
    dmDV.cdsUserUnitGrainAgePDF.Close;
    dmDV.cdsSamplePDF.EmptyDataSet;
    dmDV.cdsUnitPDF.EmptyDataSet;
    dmDV.cdsData.EmptyDataSet;
    dmDV.cdsGrainUnits.EmptyDataSet;
  except
  end;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFGridGrainProbabilityUnits.iwbScalePDFAxesClick(
  Sender: TObject);
var
  tXIncrement, tYIncrement,
  tXMin, tXMax,
  tYMin, tYMax : double;
  iCode : integer;
begin
  Val(iweXMin.Text,tXMin,iCode);
  Val(iweYMin.Text,tYMin,iCode);
  Val(iweXMax.Text,tXMax,iCode);
  Val(iweYMax.Text,tYMax,iCode);
  Val(iweXIncrement.Text,tXIncrement,iCode);
  Val(iweYIncrement.Text,tYIncrement,iCode);
  try
    ChartPDF.BottomAxis.SetMinMax(tXMin,tXMax);
    ChartPDF.LeftAxis.SetMinMax(tYMin,tYMax);
    ChartPDF.BottomAxis.Increment := tXIncrement;
    ChartPDF.LeftAxis.Increment := tYIncrement;
    ChartChem.BottomAxis.SetMinMax(tXMin,tXMax);
    ChartChem.LeftAxis.SetMinMax(tYMin,tYMax);
    ChartChem.BottomAxis.Increment := tXIncrement;
    ChartChem.LeftAxis.Increment := tYIncrement;
  except
  end;
  iwcbGraphsAutoscale.Checked := false;
end;

procedure TISFGridGrainProbabilityUnits.iwbShowUnitsClick(Sender: TObject);
begin
    dmStrat.qUserUnits.Close;
    dmStrat.qUserUnits.ParamByName('UserID').AsString := UserSession.UserID;
    dmStrat.cdsUserUnits.Close;
    dmStrat.cdsUserUnits.Open;
end;

procedure TISFGridGrainProbabilityUnits.iwbShowUnitsSamplesClick(
  Sender: TObject);
var
  tProjectIDstr : string;
begin
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',tProjectIDstr);
  //GetListBoxValues(iwlbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserSession.UserProjectValues);
  //tProjectIDstr := UserSession.UserProjectvalues[0];
  //tProjectIDstr := UserProjectIDstring;
  if (tProjectIDstr <> '') then
  begin
    dmDV.cdsUserUnitSuiteSamples.Close;
    dmDV.qUserUnitSuiteSamples.Close;
    dmDV.qUserUnitSuiteSamples.ParamByName('ProjectID').AsString := tProjectIDstr;
    //dmDV.qUserUnitSuiteSamples.ParamByName('UserID').AsString := UserSession.UserID;
    dmDV.cdsUserUnitSuiteSamples.Open;
  end else
  begin
    WebApplication.ShowMessage('A valid UserProject must be selected');
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwbUnitsAddClick(Sender: TObject);
begin
  dmStrat.qUserUnits.Close;
  dmStrat.qUserUnits.ParamByName('UserID').AsString := UserSession.UserID;
  dmStrat.cdsUserUnits.Close;
  dmStrat.cdsUserUnits.Open;
  dmStrat.InsertUserUnits(iwcbIncludeSubunits.Checked);
  dmStrat.cdsUserUnits.Refresh;
  dmStrat.cdsUserUnits.First;
  repeat
    if (dmStrat.cdsUserUnitsDVUNITID.AsInteger = 0) then
    begin
      dmDV.qUserSuiteForUnit.Close;
      dmDV.qUserSuiteForUnit.ParamByName('STRATDBUNITID').AsString := dmStrat.cdsUserUnitsUNITID.AsString;
      dmDV.cdsUserSuiteForUnit.Close;
      dmDV.cdsUserSuiteForUnit.Open;
      if (dmDV.cdsUserSuiteForUnitUNITID.AsInteger > 0) then
      begin
        dmStrat.cdsUserUnits.Edit;
        dmStrat.cdsUserUnitsDVUNITID.AsInteger := dmDV.cdsUserSuiteForUnitUNITID.AsInteger;
        try
          dmStrat.cdsUserUnits.ApplyUpdates(0);
        except
        end;
      end;
    end;
    dmStrat.cdsUserUnits.Next;
  until dmStrat.cdsUserUnits.Eof;
  dmDV.cdsUserSuiteForUnit.Close;
end;

procedure TISFGridGrainProbabilityUnits.iwbUnitsClearClick(Sender: TObject);
begin
  dmStrat.DeleteUserUnits;
  dmStrat.cdsUserUnits.Refresh;
end;

procedure TISFGridGrainProbabilityUnits.iwbUnitsSamplesAddClick(
  Sender: TObject);
var
  tVariableID, tIsotopeSystem, tRegAssocID : string;
  tUserID,tUnitIDstr,tStratDBUnitIDstr,tStratDBUnitName,tStratDBUnitRank,
  tSampleNo, tProjectIDstr,
  tStratDBUnitAgeStr,tLongitudeStr,tLatitudeStr,tCountryID : string;
begin
  dmStrat.qUserUnits.Close;
  dmStrat.qUserUnits.ParamByName('UserID').AsString := UserSession.UserID;
  dmStrat.cdsUserUnits.Close;
  dmStrat.cdsUserUnits.Open;
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',tProjectIDstr);
  //GetListBoxValues(iwlbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserSession.UserProjectValues);
  //tProjectIDstr := UserSession.UserProjectvalues[0];
  //tProjectIDstr := UserProjectIDstring;
  tVariableID := 'Age_preferred';
  tRegAssocID := 'UPb';
  tIsotopeSystem := 'UPb';
  if (iwrgIsotopeSystemVariable.ItemIndex = 0) then
  begin
    tVariableID := 'Age_preferred';
    tRegAssocID := 'UPb';
    tIsotopeSystem := 'UPb';
  end;
  if (iwrgIsotopeSystemVariable.ItemIndex = 1) then
  begin
    tVariableID := 'TDM2Ma';
    tRegAssocID := 'LuHf';
    tIsotopeSystem := 'LuHf';
  end;
  if (iwrgIsotopeSystemVariable.ItemIndex = 2) then
  begin
    tVariableID := 'Age_preferred';
    tRegAssocID := 'zrC';
    tIsotopeSystem := 'UPb';
  end;
  tUserID := UserSession.UserID;
  dmDV.cdsUserUnitSuiteSamples.Close;
  dmDV.qUserUnitSuiteSamples.Close;
  dmDV.qUserUnitSuiteSamples.ParamByName('ProjectID').AsString := tProjectIDstr;
  //dmDV.qUserUnitSuiteSamples.ParamByName('UserID').AsString := UserSession.UserID;
  dmDV.cdsUserUnitSuiteSamples.Open;
  //dmUser.SetDeveloperData(tVariableID+' '+tRegAssocID+' '+tUserID);
  dmStrat.cdsUserUnits.First;
  repeat
    //dmUser.SetDeveloperData('1 repeat before if');
    if (dmStrat.cdsUserUnitsDVUNITID.AsInteger > 0) then
    begin
      //dmUser.SetDeveloperData('1a repeat inside if');
      tUnitIDstr := dmStrat.cdsUserUnitsDVUNITID.AsString;
      tStratDBUnitIDstr := dmStrat.cdsUserUnitsUNITID.AsString;
      tStratDBUnitName := dmStrat.cdsUserUnitsSTRATDBUNITNAME.AsString;
      tStratDBUnitRank := dmStrat.cdsUserUnitsSTRATDBUNITRANK.AsString;
      tStratDBUnitAgestr := dmStrat.cdsUserUnitsUNITAGE.AsString;
      tCountryID := dmStrat.cdsUserUnitsCOUNTRYID.AsString;
      //dmUser.SetDeveloperData(tUnitIDstr+' '+tStratDBUnitIDstr+' '+tStratDBUnitName);
      dmDV.qUserSamplesForUnit.Close;
      dmDV.qUserSamplesForUnit.ParamByName('USERID').AsString := UserSession.USERID;
      dmDV.qUserSamplesForUnit.ParamByName('UNITID').AsString := tUnitIDstr;
      dmDV.qUserSamplesForUnit.ParamByName('VARIABLEID').AsString := tVariableID;
      dmDV.qUserSamplesForUnit.ParamByName('IsotopeSystemID').AsString := tIsotopeSystem;
      //dmUser.SetDeveloperData(dmDV.qUserSamplesForUnit.SQL.Text);
      dmDV.cdsUserSamplesForUnit.Close;
      dmDV.cdsUserSamplesForUnit.Open;
      if (dmDV.cdsUserSamplesForUnit.RecordCount > 0) then
      begin
        //dmUser.SetDeveloperData('1b no records in cdsUserSamplesForUnit');
        repeat
          tSampleNo := dmDV.cdsUserSamplesForUnitSAMPLENO.AsString;
          tLongitudeStr := dmDV.cdsUserSamplesForUnitLONGITUDE.AsString;
          tLatitudeStr := dmDV.cdsUserSamplesForUnitLATITUDE.AsString;
          dmDV.InsertUserUnitSamples(tProjectIDstr,tUserID,tUnitIDstr,tSampleNo,tStratDBUnitIDstr,tStratDBUnitName,tStratDBUnitRank,tStratDBUnitAgeStr,tLongitudeStr,tLatitudeStr,tCountryID);
          dmDV.cdsUserSamplesForUnit.Next;
        until dmDV.cdsUserSamplesForUnit.Eof;
      end;
    end;
    dmStrat.cdsUserUnits.Next;
  until dmStrat.cdsUserUnits.Eof;
  //dmUser.SetDeveloperData('2 after if');
  dmDV.cdsUserUnitSuiteSamples.Refresh;
end;

procedure TISFGridGrainProbabilityUnits.iwbUnitsSamplesClearClick(
  Sender: TObject);
var
  UserProjectIDstr : string;
begin
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  //GetListBoxValues(iwlbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserSession.UserProjectValues);
  //UserProjectIDstr := UserSession.UserProjectvalues[0];
  //UserProjectIDstr := UserProjectIDstring;
  //dmDV.qDeleteAny(UserProjectIDstr);
  dmDV.cdsUserUnitSuiteSamples.Refresh;
end;

procedure TISFGridGrainProbabilityUnits.iwbUpdateUnitAgeClick(Sender: TObject);
var
  UserProjectIDstr : string;
begin
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  //GetListBoxValues(iwlbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserSession.UserProjectValues);
  //UserProjectIDstr := UserSession.UserProjectvalues[0];
  //UserProjectIDstr := UserProjectIDstring;
  if (UserProjectIDstr <> '') then
  begin
    dmDV.cdsUserUnitSuiteSamples.Close;
    dmDV.qUserUnitSuiteSamples.Close;
    dmDV.qUserUnitSuiteSamples.ParamByName('ProjectID').AsString := UserProjectIDstr;
    //dmDV.qUserUnitSuiteSamples.ParamByName('UserID').AsString := UserSession.UserID;
    dmDV.cdsUserUnitSuiteSamples.Open;
    dmDV.cdsUserUnitSuiteSamples.First;
    repeat
      dmStrat.qThisUnitAge.Close;
      dmStrat.cdsThisUnitAge.Close;
      dmStrat.qThisUnitAge.ParamByName('UnitID').AsInteger := dmDV.cdsUserUnitSuiteSamplesSTRATDBUNITID.AsInteger;
      dmStrat.cdsThisUnitAge.Open;
      if (dmStrat.cdsThisUnitAge.RecordCount > 0) then
      begin
        if (dmStrat.cdsThisUnitAgeMINAGE.AsFloat <> dmDV.cdsUserUnitSuiteSamplesSTRATDBUNITAGE.AsFloat) then
        begin
          //WebApplication.ShowMessage('UserUnitSuiteSamples '+dmDV.cdsUserUnitSuiteSamplesSTRATDBUNITID.AsString+'  '+dmDV.cdsUserUnitSuiteSamplesSTRATDBUNITAGE.AsString+'   Age should be '+dmStrat.cdsThisUnitAgeMINAGE.AsString);
          dmDV.UpdateUserUnitSuiteSamples(dmDV.cdsUserUnitSuiteSamplesSTRATDBUNITID.AsInteger,dmStrat.cdsThisUnitAgeMINAGE.AsFloat);
        end;
      end;
      dmDV.cdsUserUnitSuiteSamples.Next;
    until dmDV.cdsUserUnitSuiteSamples.Eof;
    dmDV.cdsUserUnitSuiteSamples.First;
    dmStrat.cdsThisUnitAge.Close;
  end else
  begin
    WebApplication.ShowMessage('A valid UserProject must be selected');
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwcbGraphsAutoscaleChange(Sender: TObject);
begin
  if iwcbGraphsAutoscale.Checked then
  begin
    try
      ChartPDF.LeftAxis.Automatic := true;
      ChartPDF.BottomAxis.Automatic := true;
      ChartChem.LeftAxis.Automatic := true;
      ChartChem.BottomAxis.Automatic := true;
    except
    end;
    iwcbGraphsAutoscale.Checked := true;
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwcbGraphsAutoscaleClick(Sender: TObject);
begin
 if not iwcbGraphsAutoscale.checked then
 begin
    try
      ChartPDF.BottomAxis.Automatic := true;
      ChartPDF.LeftAxis.Automatic := true;
      ChartChem.LeftAxis.Automatic := true;
      ChartChem.BottomAxis.Automatic := true;
    except
    end;
    iwcbGraphsAutoscale.Checked := true;
 end;
end;

procedure TISFGridGrainProbabilityUnits.iwcbShow1Click(Sender: TObject);
begin
  try
    if (Sender = iwcbShow1) then ChartPDF.Series[0].Visible := iwcbShow1.Checked;
    if (Sender = iwcbShow2) then ChartPDF.Series[1].Visible := iwcbShow2.Checked;
    if (Sender = iwcbShow3) then ChartPDF.Series[2].Visible := iwcbShow3.Checked;
    if (Sender = iwcbShow4) then ChartPDF.Series[3].Visible := iwcbShow4.Checked;
    if (Sender = iwcbShow5) then ChartPDF.Series[4].Visible := iwcbShow5.Checked;
  except
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwcbShowAboveCutoffClick(
  Sender: TObject);
begin
  //iwcbShowAboveCutoff.Checked := not iwcbShowAboveCutoff.Checked;
  ChartChem.Series[0].Visible := iwcbShowAboveCutoff.Checked;
end;

procedure TISFGridGrainProbabilityUnits.iwcbShowBelowCutoffClick(
  Sender: TObject);
begin
  //iwcbShowBelowCutoff.Checked := not iwcbShowBelowCutoff.Checked;
  ChartChem.Series[1].Visible := iwcbShowBelowCutoff.Checked;
end;

procedure TISFGridGrainProbabilityUnits.iwcbVar1Click(Sender: TObject);
begin
  if (Sender = iwcbVar1) then
  begin
    iwcbVar1.Checked := not iwcbVar1.Checked;
    if iwcbVar1.Checked then
    begin
      iwcbVar2.Checked := false;
      iwcbVar3.Checked := false;
    end;
  end;
  if (Sender = iwcbVar2) then
  begin
    iwcbVar2.Checked := not iwcbVar2.Checked;
    if iwcbVar2.Checked then
    begin
      iwcbVar1.Checked := false;
      iwcbVar3.Checked := false;
    end;
  end;
  if (Sender = iwcbVar3) then
  begin
    iwcbVar3.Checked := not iwcbVar3.Checked;
    if iwcbVar3.Checked then
    begin
      iwcbVar1.Checked := false;
      iwcbVar2.Checked := false;
    end;
  end;
end;

procedure TISFGridGrainProbabilityUnits.IWDBGrid1ColumnsTitleClick(Sender: TObject);
begin
  dmStrat.cdsQuery1.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFGridGrainProbabilityUnits.iwlPrevPageClick(Sender: TObject);
begin
  dmStrat.cdsQuery1.MoveBy(-1*iwDBgResults.RowLimit);
  UserSession.PageNum := UserSession.PageNum - 1;
  if (UserSession.PageNum < 1) then UserSession.PageNum := 1;
end;

procedure TISFGridGrainProbabilityUnits.iwlUserProject1Change(Sender: TObject);
var
  ItemID : integer;
  tProjectIDstr : string;
begin
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',tProjectIDstr);
  //GetListBoxValues(iwlbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserSession.UserProjectValues);
  //tProjectIDstr := UserSession.UserProjectvalues[0];
  iwbCalculateProbabilityCurves.Enabled := true;
  iwbPopulateChemistryGraph.Enabled := false;
  iwbDeleteUserGrainAgePDF.Enabled := true;
  UserProjectIDstring := tProjectIDstr;
  //dmUser.SetDeveloperData('UserProjectIDstring = '+UserProjectIDstring);
  //ItemID := iwcbUserProject.ItemIndex;
  ItemID := iwlbUserProject.ItemIndex;
  //dmUser.SetDeveloperData('UserProjectID = '+IntToStr(UserProjectID));
  if (ItemID >= 0) then
  begin
    iwrUnitsTop.Enabled := true;
    iwDBgUnits.Enabled := true;
    iwrUnitsSamplesButtons.Enabled := true;
    iwrUnitsSamplesTop.Enabled := true;
    iwDBgUnitsSamples.Enabled := true;
    iwrGraphOptions.Enabled := true;
    iwrGraphProbabilityGraph.Enabled := true;
    iwrGraphDownloadPDF.Enabled := true;
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwrgIsotopeSystemVariableClick(
  Sender: TObject);
var
  tRegAssocID : integer;
begin
  if (iwrgIsotopeSystemVariable.ItemIndex = 0) then
  begin
    iwcbVar1.Text := 'Th/U';
    iwcbVar1.Text := 'T from Ti in zircon';
    iwcbVar1.Text := 'delta 18 oxygen';
    iweVar1Cutoff.Text := '0.1';
    iweVar2Cutoff.Text := '600.0';
    iweVar3Cutoff.Text := '10.0';
  end;
  if (iwrgIsotopeSystemVariable.ItemIndex = 1) then
  begin
    iwcbVar1.Text := 'T(DM2) Ma';
    iwcbVar1.Text := 'sigma T(DM2)';
    iwcbVar1.Text := 'Initial ratio';
    iweVar1Cutoff.Text := '1000.0';
    iweVar2Cutoff.Text := '30.0';
    iweVar3Cutoff.Text := '0.28100';
  end;
  if (iwrgIsotopeSystemVariable.ItemIndex = 2) then
  begin
    iwcbVar1.Text := 'Th/U';
    iwcbVar1.Text := 'T(DM2) Ma';
    iwcbVar1.Text := 'sigma T(DM2) Ma';
    iweVar1Cutoff.Text := '0.1';
    iweVar2Cutoff.Text := '1000.0';
    iweVar3Cutoff.Text := '30.0';
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwlNextPageClick(Sender: TObject);
begin
  dmStrat.cdsQuery1.MoveBy(iwDBgResults.RowLimit);
  UserSession.PageNum := UserSession.PageNum + 1;
  if (UserSession.PageNum > UserSession.PageNumTotal) then UserSession.PageNum := UserSession.PageNumTotal;
end;

procedure TISFGridGrainProbabilityUnits.IWAppFormCreate(Sender: TObject);
var
  i, nRec : integer;
  UserProjectIDstr : string;
begin
  //dmUser.SetDeveloperData('0 start AppFormCreate');
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := UserSession.UserDisplayName;
    iwlPageNum.Caption := IntToStr(UserSession.PageNum);
  end;
  iwrUnitsTop.Enabled := false;
  iwrUnitsSamplesButtons.Enabled := false;
  iwrUnitsSamplesTop.Enabled := false;
  iwDBgUnits.Enabled := false;
  iwDBgUnitsSamples.Enabled := false;
  iwrGraphOptions.Enabled := false;
  iwrGraphProbabilityGraph.Enabled := false;
  iwrGraphDownloadPDF.Enabled := false;
  iwlPrevPage.Visible := false;
  iwlNextPage.Visible := false;
  iwlFirstPage.Visible := false;
  iwlLastPage.Visible := false;
  UserSession.PageNum := 1;
  UserSession.PageNumTotal := 1;
  if UserSession.LoggedIn then
  begin
    iwbCalculateProbabilityCurves.Enabled := false;
    //iwbDownload.Visible := UserSession.CanModifyPlus;
    //iwbDownload.Visible := UserSession.IsDeveloper;
    {
    dmUser.qThisProgram.Close;
    dmUser.qThisProgram.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsThisProgram.Close;
    dmUser.cdsThisProgram.Open;
    }
    if (UserSession.ThisProgram = 'StratDB') then
    begin
      //TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
      TopBar.lblProgTitle.Text := UserSession.ThisProgramName;
    end;
    if (UserSession.ThisProgram = 'IGCP509') then
    begin
      TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
    end;
    //iwbDownloadGrainCurves.Enabled := UserSession.CanExport;
    //iwbDownloadGrainAgeData.Enabled := UserSession.CanExport;
    iwbDownloadGrainCurves.Enabled := false; //only becomes true once data are graphed
    iwbDownloadGrainAgeData.Enabled := false;  //temporary until properly coded
    //dmUser.SetDeveloperData('4 before Query1');
    dmStrat.Query1.Close;
    dmStrat.cdsQuery1.Close;
    dmStrat.Query1.ParamByName('USERID').AsString := UserSession.UserID;
    dmStrat.cdsQuery1.Open;
    //dmUser.SetDeveloperData('5 after Query1');
    UserSession.NumRecordsFound := 0;
    dmStrat.Query1RecordCount;
    //dmUser.SetDeveloperData('6 after Query1RecordCount');
    if (uppercase(UserSession.UserID) = 'GUEST') then
    begin
      nRec := UserSession.NumRecordsFound;
      if (nRec > MaxGuestRecords) then
      begin
        dmStrat.cdsQuery1.Last;
        for i := nRec downto MaxGuestRecords+1 do
        begin
          dmStrat.cdsQuery1.Delete;
        end;
      end;
    end;
    iwlPrevPage.Visible := (UserSession.NumRecordsFound > iwDBgResults.RowLimit);
    iwlNextPage.Visible := (UserSession.NumRecordsFound > iwDBgResults.RowLimit);
    iwlFirstPage.Visible := (UserSession.NumRecordsFound > iwDBgResults.RowLimit);
    iwlLastPage.Visible := (UserSession.NumRecordsFound > iwDBgResults.RowLimit);
    UserSession.PageNum := 1;
    UserSession.PageNumTotal := UserSession.NumRecordsFound div iwDBgResults.RowLimit;
    if ((UserSession.NumRecordsFound mod iwDBgResults.RowLimit) <> 0) then UserSession.PageNumTotal := UserSession.PageNumTotal +1;
    iwlPageNum.Caption := IntToStr(UserSession.PageNum);
    iwlPageNumTotal.Caption := IntToStr(UserSession.PageNumTotal);
    lblRecordCount.Text := IntToStr(UserSession.NumRecordsFound)+' records match the query specified';
    if (uppercase(UserSession.UserID) = 'GUEST') then lblRecordCount.Text := lblRecordCount.Text + ' (guest is limited to 10 records)';
    //dmUser.SetDeveloperData('7 before UserProjects');
    //dmUser.SetDeveloperData(UserSession.UserID);
    //dmUser.SetDeveloperData(dmDV.qUserProjects.SQL.Text);
    dmDV.cdsUserProjects.Close;
    dmDV.qUserProjects.Close;
    dmDV.qUserProjects.ParamByName('USERID').AsString := UserSession.UserID;
    dmDV.cdsUserProjects.Close;
    UpdateComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
    //UpdateListBoxValues(iwlbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserSession.UserProjectValues);
    //UserProjectIDstr := UserSession.UserProjectvalues[0];
    if (UserSession.SampleZonevalues.Count < 1) then
    begin
      UserSession.IncludeSampleZoneValues := false;
    end;
    iwcbIncludeSampleZones.Checked := UserSession.IncludeSampleZoneValues;
    UpdateListBoxValues(iwlSampleZones,dmDV.cdsSampleZones,'ZoneType','ZoneID',UserSession.SampleZoneValues);
    //dmUser.SetDeveloperData('8 after UserProjects');
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwDBgUnitsColumns0TitleClick(
  Sender: TObject);
begin
  dmStrat.cdsUserUnits.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlUnitsSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFGridGrainProbabilityUnits.iwDBgUnitsColumns1Click(
  ASender: TObject; const AValue: string);
begin
  dmStrat.cdsUserUnits.Locate('UnitID',AValue,[]);
end;

procedure TISFGridGrainProbabilityUnits.iwDBgUnitsSamplesColumns0TitleClick(
  Sender: TObject);
begin
  dmDV.cdsUserUnitSuiteSamples.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlUnitsSamplesSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFGridGrainProbabilityUnits.iwDBgUnitsSamplesColumns6Click(
  ASender: TObject; const AValue: string);
begin
  dmDV.cdsUserUnitSuiteSamples.Locate('SampleNo',AValue,[]);
end;

procedure TISFGridGrainProbabilityUnits.iwlFirstPageClick(Sender: TObject);
begin
  dmStrat.cdsQuery1.First;
  UserSession.PageNum := 1;
end;

procedure TISFGridGrainProbabilityUnits.iwlLastPageClick(Sender: TObject);
begin
  dmStrat.cdsQuery1.Last;
  UserSession.PageNum := UserSession.PageNumTotal;
end;

procedure TISFGridGrainProbabilityUnits.CalculatePDF(ShowConcordantOnly : string; NumIncluded : integer);
var
  i, j, k, l : integer;
  X1, X2, Y2 : double;
  tempmax : double;
  Spectrum2d : array[0..Steps,1..2] of double;
  tx, tx1 : double;
  iCode : integer;
  MinimumUncertainty : double;
  MinimumCurveValue : double;
  tmpStr : string;
  tempGauss : double;
  tmpBinWidth, tmpBinCentre : double;
  FromAge, ToAge : double;
  PDFtype : string;
  Cutoff1, Cutoff2, Cutoff3, Cutoff4, Cutoff5 : double;
begin
  //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.CalculatePDF - 0');
  ShowConcordantOnly := 'Y';
  Val(iweGraphAgeFrom.Text,FromAge,iCode);
  Val(iweGraphAgeTo.Text,ToAge,iCode);
  Val(iweMinimumUncertainty.Text,MinimumUncertainty,iCode);
  if (iwrgAndOr.ItemIndex = 0) then PDFtype := 'AND';
  if (iwrgAndOr.ItemIndex = 1) then PDFtype := 'OR';
  dmDV.cdsSamplePDF.EmptyDataSet;
  MinimumCurveValue := 0.0000001;
  for k := 0 to Steps do
  begin
    Spectrum2d[k,1] := 0.0;
    Spectrum2d[k,2] := 0.0;
  end;
  //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.CalculatePDF - 1');
  dmDV.cdsData.First;
  //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.CalculatePDF - '+dmDV.cdsDataSampleNo.AsString);
  //dmUser.SetDeveloperData('Steps = '+IntToStr(Steps));
  repeat
    if (ShowConcordantOnly = 'Y') then
    begin
      if ((dmDV.cdsDataIncludeYN.AsString = 'Y')) then
      begin
        tx := dmDV.cdsDataPreferredAge.AsFloat;
        tx1 := dmDV.cdsDataPreferredAgeSigma.AsFloat;
        //if ((tx <= 900.0) and (tx >= 800.0)) then
        //begin
        //  WebApplication.ShowMessage('CalcPDF '+dmDV.cdsDataSampleNo.AsString+' '+dmDV.cdsDataFrac.AsString+' Age = '+dmDV.cdsDataPreferredAge.AsString);
        //end;
        if (tx1 < MinimumUncertainty) then tx1 := MinimumUncertainty;
        for l := 0 to Steps do
        begin
          x1 := FromAge + 1.0*l*(ToAge-FromAge)/Steps;
          Spectrum2d[l,1] := x1;
          tempGauss := Gauss(x1,tx,tx1);
          //if ((x1 <= 900.0) and (x1 >= 800.0) and (tempGauss > 0.00001)) then
          //begin
          //  WebApplication.ShowMessage('tempGauss '+FormatFloat('####0.000',x1)+' Gauss = '+FormatFloat('####0.00000',tempGauss));
          //end;
          if (PDFType = 'AND') then Spectrum2d[l,2] := Spectrum2d[l,2] + tempGauss;
          if (PDFType = 'OR') then
          begin
            if (Spectrum2d[l,2] < tempGauss) then Spectrum2d[l,2] := tempGauss;
          end;
        end;
      end;
    end;
    dmDV.cdsData.Next;
  until dmDV.cdsData.EOF;
  dmDV.cdsData.First;
  //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.CalculatePDF - 2');
  tempmax := 0.0;
  {
  for l := 0 to Steps do
  begin
    dmUser.SetDeveloperData('CalculatePDF - 2 - '+IntToStr(l)+' - '+FormatFloat('#####0.0000',tempmax));
    if (Spectrum2d[l,2] > 1.0e6) then Spectrum2d[l,2] := 0.0;
    if (tempmax < Spectrum2d[l,2]) then
    begin
      tempmax := Spectrum2d[l,2];
      //WebApplication.ShowMessage(IntToStr(l)+'  tempmax = '+FormatFloat('###0.00000',tempmax));
    end;
  end;
  }
  //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.CalculatePDF - 3');
  //WebApplication.ShowMessage('tempmax = '+FormatFloat('###0.00000',tempmax));
  {
  if (tempmax <= 0.0) then tempmax := 1.0e-9;
  if (tempmax > 0.0) then tempmax := 100.0/tempmax;
  //if (tempmax <= 0.0) then tempmax := 1.0e-9;
  }
  //WebApplication.ShowMessage('tempmax = '+FormatFloat('###0.00000',tempmax));
  if (NumIncluded <= 0) then NumIncluded := -1;
  //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.CalculatePDF - 4 - '+IntToStr(NumIncluded));
  tempmax := 1.0/(1.0*abs(NumIncluded));
  //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.CalculatePDF - 5'+' - '+FormatFloat('#####0.0000',tempmax));
  for l := 0 to Steps do
  begin
    Spectrum2d[l,2] := Spectrum2d[l,2]*tempmax;
  end;
  for l := 0 to Steps do
  begin
    //dmUser.SetDeveloperData('CalculatePDF - 2 - '+IntToStr(l)+' - '+FormatFloat('#####0.0000',tempmax));
    if (Spectrum2d[l,2] > 1.0e6) then Spectrum2d[l,2] := 0.0;
    if (tempmax < Spectrum2d[l,2]) then
    begin
      tempmax := Spectrum2d[l,2];
      //WebApplication.ShowMessage(IntToStr(l)+'  tempmax = '+FormatFloat('###0.00000',tempmax));
    end;
  end;
  //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.CalculatePDF - 6'+' - '+FormatFloat('#####0.0000',tempmax));
  if (tempmax > 0.0) then tempmax := 100.0/tempmax;
  if (tempmax <= 0.0) then tempmax := 1.0e-9;
  for l := 0 to Steps do
  begin
    Spectrum2d[l,2] := Spectrum2d[l,2]*tempmax;
  end;
  //dmUser.SetDeveloperData('MinimumCurveValue = '+FormatFloat('####0.000000',MinimumCurveValue));
  for k := 0 to Steps do
  begin
    dmDV.cdsSamplePDF.Append;
    dmDV.cdsSamplePDFStep.AsInteger := k;
    x2 := Spectrum2d[k,1];
    y2 := Spectrum2d[k,2];
    if (y2 < MinimumCurveValue) then y2 := 0.0;
    dmDV.cdsSamplePDFPDFDataValue.AsFloat := x2;
    dmDV.cdsSamplePDFPDFValue.AsFloat := y2;
    dmDV.cdsSamplePDF.Post;
  end;
  dmDV.cdsSamplePDF.First;
  //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.CalculatePDF - 7');
end;

procedure TISFGridGrainProbabilityUnits.GraphPDF(UnitID : integer; UnitAge : double);
var
  i, j, k, l : integer;
  X1, X2, Y2 : double;
  tempmax : double;
  tx, tx1 : double;
  iCode : integer;
  MinimumCurveValue : double;
  tempGauss : double;
  tmpBinWidth, tmpBinCentre : double;
  Cutoff1, Cutoff2, Cutoff3, Cutoff4, Cutoff5 : double;
begin
  Val(iwe1.Text,Cutoff1,iCode);
  Val(iwe2.Text,Cutoff2,iCode);
  Val(iwe3.Text,Cutoff3,iCode);
  Val(iwe4.Text,Cutoff4,iCode);
  Val(iwe5.Text,Cutoff5,iCode);
  MinimumCurveValue := 0.0;
  dmDV.cdsUnitPDF.First;
  repeat
    x2 := dmDV.cdsUnitPDFGrainAge.AsFloat;
    y2 := dmDV.cdsUnitPDFPDFvalue.AsFloat;
    if (y2 < MinimumCurveValue) then y2 := 0.0;
    try
      if ((y2 < Cutoff2) and (y2 >= Cutoff1)) then ChartPDF.Series[0].AddXY(x2,UnitAge);
      if ((y2 < Cutoff3) and (y2 >= Cutoff2)) then ChartPDF.Series[1].AddXY(x2,UnitAge);
      if ((y2 < Cutoff4) and (y2 >= Cutoff3)) then ChartPDF.Series[2].AddXY(x2,UnitAge);
      if ((y2 < Cutoff5) and (y2 >= Cutoff4)) then ChartPDF.Series[3].AddXY(x2,UnitAge);
      if (y2 >= Cutoff5) then ChartPDF.Series[4].AddXY(x2,UnitAge);
    except
    end;
    dmDV.cdsUnitPDF.Next;
  until dmDV.cdsUnitPDF.Eof;
  dmDV.cdsUnitPDF.First;
end;

procedure TISFGridGrainProbabilityUnits.GraphExistingPDF;
var
  i, j, k, l : integer;
  X1, X2, Y2 : double;
  tempmax : double;
  tx, tx1 : double;
  iCode : integer;
  MinimumCurveValue : double;
  tempGauss : double;
  tmpBinWidth, tmpBinCentre : double;
  Cutoff1, Cutoff2, Cutoff3, Cutoff4, Cutoff5 : double;
  tUnitAge : double;
begin
  Val(iwe1.Text,Cutoff1,iCode);
  Val(iwe2.Text,Cutoff2,iCode);
  Val(iwe3.Text,Cutoff3,iCode);
  Val(iwe4.Text,Cutoff4,iCode);
  Val(iwe5.Text,Cutoff5,iCode);
  MinimumCurveValue := 0.0;
  dmDV.cdsUserUnitGrainAgePDF.First;
  repeat
    x2 := dmDV.cdsUserUnitGrainAgePDFPDFAGE.AsFloat;
    y2 := dmDV.cdsUserUnitGrainAgePDFPDFvalue.AsFloat;
    tUnitAge := dmDV.cdsUserUnitGrainAgePDFSTRATDBUNITAGE.AsFloat;
    if (y2 < MinimumCurveValue) then y2 := 0.0;
    try
      if ((y2 < Cutoff2) and (y2 >= Cutoff1)) then ChartPDF.Series[0].AddXY(x2,tUnitAge);
      if ((y2 < Cutoff3) and (y2 >= Cutoff2)) then ChartPDF.Series[1].AddXY(x2,tUnitAge);
      if ((y2 < Cutoff4) and (y2 >= Cutoff3)) then ChartPDF.Series[2].AddXY(x2,tUnitAge);
      if ((y2 < Cutoff5) and (y2 >= Cutoff4)) then ChartPDF.Series[3].AddXY(x2,tUnitAge);
      if (y2 >= Cutoff5) then ChartPDF.Series[4].AddXY(x2,tUnitAge);
    except
    end;
    dmDV.cdsUserUnitGrainAgePDF.Next;
  until dmDV.cdsUserUnitGrainAgePDF.Eof;
  dmDV.cdsUserUnitGrainAgePDF.First;
end;

procedure TISFGridGrainProbabilityUnits.GraphChem(VarID : integer);
var
  i, j, k, l : integer;
  InclYN : string;
  x2, y2, z2 : double;
  tx, tx1 : double;
  iCode : integer;
  Cutoff, Cutoff1, Cutoff2, Cutoff3 : double;
begin
  if (VarID = 1) then
  begin
    Val(iweVar1Cutoff.Text,Cutoff,iCode);
  end;
  if (VarID = 1) then
  begin
    Val(iweVar2Cutoff.Text,Cutoff,iCode);
  end;
  if (VarID = 1) then
  begin
    Val(iweVar3Cutoff.Text,Cutoff,iCode);
  end;
  dmDV.cdsUnitGrainAgeData.First;
  repeat
    InclYN := dmDV.cdsUnitGrainAgeDataIncludeYN.AsString;
    x2 := dmDV.cdsUnitGrainAgeDataGrainAge.AsFloat;
    y2 := dmDV.cdsUnitGrainAgeDataUnitAge.AsFloat;
    if (VarID = 1) then
    begin
      z2 := dmDV.cdsUnitGrainAgeDataVar1.AsFloat;
    end;
    if (VarID = 2) then
    begin
      z2 := dmDV.cdsUnitGrainAgeDataVar2.AsFloat;
    end;
    if (VarID = 3) then
    begin
      z2 := dmDV.cdsUnitGrainAgeDataVar3.AsFloat;
    end;
    if (InclYN = 'Y') then
    begin
      try
        if ((z2 < Cutoff)) then ChartChem.Series[0].AddXY(x2,y2);
        if ((z2 >= Cutoff)) then ChartChem.Series[1].AddXY(x2,y2);
      except
      end;
    end;
    dmDV.cdsUnitGrainAgeData.Next;
  until dmDV.cdsUnitGrainAgeData.Eof;
  dmDV.cdsUnitGrainAgeData.First;
end;

function TISFGridGrainProbabilityUnits.Gauss (Ratio, Mean, Dev : double) : double;
begin
  if (Abs(Dev) > 0.0) then
  begin
    if (sqr((Ratio-Mean)/Dev) < 20000.0) then
      Gauss := (1.0/(Dev*sqrt(2.0*Pi))) * exp(-1.0*(sqr(Ratio-Mean))/(2.0*Dev*Dev))
    else
      Gauss := 0.0;
    end else Gauss := 0.0;
end;

procedure TISFGridGrainProbabilityUnits.GetSampleData(tUserID, tRegAssocID, tSampleNo : string; var NumIncluded : integer);
var
  iCnt, iCntIncluded, i : integer;
  tIncludeYN : string;
  iCode : integer;
  tConcordance,
  ConcordanceFrom, ConcordanceTo : double;
  iErrTypX, iErrTypY, iErrTypZ : integer;
  tErrValX, tDataValX,
  tErrValY, tDataValY,
  tErrValZ, tDataValZ : double;
  tDataVal1, tDataVal2, tDataVal3,
  tCutoff1, tCutoff2, tCutoff3,
  tPreferredAge : double;
begin
  tIncludeYN := 'Y';
  iCnt := 0;
  iCntIncluded := 0;
  Val(iweConcordanceFrom.Text,ConcordanceFrom,iCode);
  Val(iweConcordanceTo.Text,ConcordanceTo,iCode);
  dmDV.qRawSmp.Close;
  dmDV.cdsRawSmp.Close;
  dmDV.qRawSmp.ParamByName('UserID').AsString := tUserID;
  dmDV.qRawSmp.ParamByName('RegAssocID').AsString := tRegAssocID;
  dmDV.qRawSmp.ParamByName('SampleNo').AsString := tSampleNo;
  dmDV.cdsRawSmp.Open;
  dmDV.cdsData.Open;
  dmDV.cdsData.EmptyDataSet;
  dmDV.cdsRawSmp.First;
  Val(iweVar1Cutoff.Text,tCutoff1,iCode);
  Val(iweVar2Cutoff.Text,tCutoff2,iCode);
  Val(iweVar3Cutoff.Text,tCutoff3,iCode);
  i := 1;
  repeat
    tConcordance := 100.0 - dmDV.cdsRawDiscordanceDATAVALUE.AsFloat;
    if ((tConcordance >= ConcordanceFrom) and (tConcordance <= ConcordanceTo)) then tIncludeYN := 'Y'
                                                                               else tIncludeYN := 'N';
    iErrTypX := Trunc(dmDV.cdsRawErrTypeXDATAVALUE.AsFloat);
    tErrValX := dmDV.cdsRawDataXerrDATAVALUE.AsFloat;
    tDataValX := dmDV.cdsRawNormalisedValueXNORMALISEDVALUE.AsFloat;
    iErrTypY := Trunc(dmDV.cdsRawErrTypeYDATAVALUE.AsFloat);
    tErrValY := dmDV.cdsRawDataYerrDATAVALUE.AsFloat;
    tDataValY := dmDV.cdsRawNormalisedValueYNORMALISEDVALUE.AsFloat;
    iErrTypZ := Trunc(dmDV.cdsRawErrTypeZDATAVALUE.AsFloat);
    tErrValZ := dmDV.cdsRawDataZerrDATAVALUE.AsFloat;
    tDataValZ := dmDV.cdsRawNormalisedValueZNORMALISEDVALUE.AsFloat;
    if (dmDV.cdsRawDataVar1DATAVALUE.AsString = '') then tDataVal1 := DefaultMissingValue
    else tDataVal1 := dmDV.cdsRawDataVar1DATAVALUE.AsFloat;
    if (dmDV.cdsRawDataVar2DATAVALUE.AsString = '') then tDataVal2 := DefaultMissingValue
    else tDataVal2 := dmDV.cdsRawDataVar2DATAVALUE.AsFloat;
    if (dmDV.cdsRawDataVar3DATAVALUE.AsString = '') then tDataVal3 := DefaultMissingValue
    else tDataVal3 := dmDV.cdsRawDataVar3DATAVALUE.AsFloat;
    if (iwcbExcludeDataWithoutAnalyses.Checked) then
    begin
      if ((tDataValX < 0.00001) or (tDataValY < 0.00001) or (tDataValZ < 0.00001)) then
      begin
        tIncludeYN := 'N';
        tConcordance := 0.0;
      end;
    end else
    begin
      if ((tDataValX < 0.00001) and (tDataValY < 0.00001) and (tDataValZ > 0.00001)) then
      begin
        tIncludeYN := 'Y';
        tConcordance := 0.0;
      end;
    end;
    tPreferredAge := dmDV.cdsRawAgePrefDATAVALUE.AsFloat;
    if (tPreferredAge < 0.001) then
    begin
      tIncludeYN := 'N';
    end;
    if (dmDV.cdsRawDataIncludeDATAVALUE.AsFloat < 0.5) then
    begin
      tIncludeYN := 'N';
    end;
    if (iErrTypX = 1) then tErrValX := tErrValX*tDataValX/100.0;
    if (iErrTypY = 1) then tErrValY := tErrValY*tDataValY/100.0;
    if (iErrTypZ = 1) then tErrValZ := tErrValZ*tDataValZ/100.0;
    if (tPreferredAge >= 0.001) then
    begin
      try
        dmDV.cdsData.Append;
        dmDV.cdsDatatRec.AsInteger := i;
        dmDV.cdsDataSampleNo.AsString := dmDV.cdsRawSmpSAMPLENO.AsString;
        dmDV.cdsDataFrac.AsString := dmDV.cdsRawSmpFRAC.AsString;
        dmDV.cdsDataZoneID.AsString := dmDV.cdsRawSmpZONEID.AsString;
        dmDV.cdsDataPb207U235.AsFloat := tDataValX;
        dmDV.cdsDataPb207U235Sigma.AsFloat := tErrValX;
        dmDV.cdsDataPb206U238.AsFloat := tDataValY;
        dmDV.cdsDataPb206U238Sigma.AsFloat := tErrValY;
        if (tDataValY > 0.0) then
        begin
          dmDV.cdsDataU238Pb206.AsFloat := 1.0/tDataValY;
          dmDV.cdsDataU238Pb206Sigma.AsFloat := (1.0/tDataValY)*tErrValY/tDataValY;
        end else
        begin
          dmDV.cdsDataU238Pb206.AsFloat := 0.0;
          dmDV.cdsDataU238Pb206Sigma.AsFloat := 1000.0;
          if (iwcbExcludeDataWithoutAnalyses.Checked) then tIncludeYN := 'N';
        end;
        dmDV.cdsDataPb207Pb206.AsFloat := tDataValZ;
        dmDV.cdsDataPb207Pb206Sigma.AsFloat := tErrValZ;
        dmDV.cdsDataIncludeYN.AsString := tIncludeYN;
        dmDV.cdsDataPercentConcordance.AsFloat := tConcordance;
        dmDV.cdsDataPreferredAge.AsFloat := dmDV.cdsRawAgePrefDATAVALUE.AsFloat;
        dmDV.cdsDataPreferredAgeSigma.AsFloat := dmDV.cdsRawDataAgeerrDATAVALUE.AsFloat;
        dmDV.cdsDataVar1.AsFloat := tDataVal1;
        dmDV.cdsDataVar2.AsFloat := tDataVal2;
        dmDV.cdsDataVar3.AsFloat := tDataVal3;
        dmDV.cdsData.Post;
      except
      end;
      i := i + 1;
      if (tIncludeYN = 'Y') then iCntIncluded := iCntIncluded + 1;
      iCnt := iCnt + 1;
    end;
    dmDV.cdsRawSmp.Next;
  until dmDV.cdsRawSmp.Eof;
  dmDV.cdsData.First;
  dmDV.cdsRawSmp.Close;
  NumIncluded := iCntIncluded;
  //iwlCount.Caption := IntToStr(iCntIncluded)+' of '+IntToStr(iCnt)+' analyses match the criteria for concordance';
end;

procedure TISFGridGrainProbabilityUnits.SetUserGrainPDF(tProjectID, tUserID, tUnitIDstr, tStepNoStr,
  tRegAssocIDstr : string; tUnitAge : double; var tNo : integer);
var
  i : integer;
  MaxAllowed : integer;
  tUnitAgeStr : string;
  PDFage, PDFvalue : double;
begin
  tUnitAgeStr := FormatFloat('###0.000',tUnitAge);
  MaxAllowed := dmUser.GetUserRowLimit(UserSession.UserID,3);
  dmDV.cdsUnitPDF.First;
  i := 1;
  repeat
    tStepNoStr := IntToStr(dmDV.cdsUnitPDFStepID.AsInteger);
    PDFage := dmDV.cdsUnitPDFGrainAge.AsFloat;
    PDFvalue := dmDV.cdsUnitPDFPDFvalue.AsFloat;
    try
      dmDV.InsertUserGrainAgePDF(tProjectID,tUserID,tUnitIDstr,tStepNoStr,tUnitAgeStr,tRegAssocIDstr,PDFAge,PDFvalue);
    except
    end;
    i := i + 1;
    tNo := tNo + 1;
    dmDV.cdsUnitPDF.Next;
  until ((dmDV.cdsUnitPDF.Eof) or (tNo > MaxAllowed));
end;

end.
