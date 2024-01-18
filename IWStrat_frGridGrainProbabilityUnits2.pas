unit IWStrat_frGridGrainProbabilityUnits2;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompLabel, IWCompGrids, IWDBGrids, IWDBStdCtrls,
  Forms, IWHTMLControls,
  IWVCLBaseControl, IWBaseHTMLControl, IWCompButton, UFlxMemTable,
  UCustomFlexCelReport, UFlexCelReport, UExcelAdapter,
  IWStrat_frTopBar, jpeg, IWCompExtCtrls,
  IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWRegion, IWCompRectangle, IWStrat_framemenu,
  IWHTML40Container, FMTBcd, WideStrings, DBXDevartInterBase, DB, SqlExpr,
  DBClient, Provider, VCLTee.TeEngine, Vcl.ExtCtrls, VCLTee.TeeProcs,
  VCLTee.Chart, IWCompTeeChart, VCLTee.Series, IWCompCheckbox, IWCompEdit,
  IWCompMemo, IWCompListbox, VclTee.TeeGDIPlus;

type
  TISFGridGrainProbabilityUnits = class(TIWAppForm)
    lblRecordCount: TIWLabel;
    iwDBgResults: TIWDBGrid;
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
    iwrUnitsButtons: TIWRegion;
    iwlQueryResults: TIWLabel;
    iwrUnitsTop: TIWRegion;
    iwlUnits: TIWLabel;
    iwrGraph: TIWRegion;
    iwrGraphGraph: TIWRegion;
    iwChartPDF: TIWChart;
    ChartPDF: TChart;
    iwrButtonsTop: TIWRegion;
    iwDBgUnits: TIWDBGrid;
    iwbReturn: TIWButton;
    iwbUnitsAdd: TIWButton;
    iwbUnitsClear: TIWButton;
    iwlUnitsSortedBy: TIWLabel;
    iwrUnitsSamplesButtons: TIWRegion;
    iwbUnitsSamplesAdd: TIWButton;
    iwbUnitsSamplesClear: TIWButton;
    iwrUnitsSamplesTop: TIWRegion;
    iwlUnitsSamples: TIWLabel;
    iwlUnitsSamplesSortedBy: TIWLabel;
    iwDBgUnitsSamples: TIWDBGrid;
    iwrgIsotopeSystemVariable: TIWRadioGroup;
    iwrGraphOptions: TIWRegion;
    IWLabel1: TIWLabel;
    iweGraphAgeFrom: TIWEdit;
    IWLabel11: TIWLabel;
    iweGraphAgeTo: TIWEdit;
    iwbScaleConcordiaAxes: TIWButton;
    iwcbPDFAutoscale: TIWCheckBox;
    iweConcordanceFrom: TIWEdit;
    IWLabel5: TIWLabel;
    iweConcordanceTo: TIWEdit;
    iwbCalculateProbabilityCurves: TIWButton;
    Series1: TPointSeries;
    Series2: TPointSeries;
    Series3: TPointSeries;
    Series4: TPointSeries;
    Series5: TPointSeries;
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
    iwrGraphDownload: TIWRegion;
    iwbDownloadGrainCurves: TIWButton;
    Series6: TLineSeries;
    iwbDeleteUnitRecord: TIWButton;
    iwbDeleteUnitsSamplesRecord: TIWButton;
    iwmGraphExplanation: TIWMemo;
    IWLabel12: TIWLabel;
    IWLabel14: TIWLabel;
    iweYIncrement: TIWEdit;
    iweXIncrement: TIWEdit;
    IWLabel15: TIWLabel;
    iwbDownloadGrainAgeData: TIWButton;
    iwcbIncludeSubunits: TIWCheckBox;
    iwlUnitsPartialList: TIWLabel;
    iwlUnitsSamplesPartialList: TIWLabel;
    iwbDownloadUnitsSamples: TIWButton;
    iwbDownloadUnits: TIWButton;
    iwcbShow1: TIWCheckBox;
    iwcbShow2: TIWCheckBox;
    iwcbShow3: TIWCheckBox;
    iwcbShow4: TIWCheckBox;
    iwcbShow5: TIWCheckBox;
    iwbShowUnits: TIWButton;
    iwbShowUnitsSamples: TIWButton;
    iwbDeleteUserGrainAgePDF: TIWButton;
    iwbGraphExistingProbabilityCurves: TIWButton;
    iwbUpdateUnitAge: TIWButton;
    iwrProjectSelect: TIWRegion;
    iwlUserProject: TIWLabel;
    iwcbUserProject: TIWComboBox;
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
    procedure iwbScaleConcordiaAxesClick(Sender: TObject);
    procedure iwcbPDFAutoscaleClick(Sender: TObject);
    procedure iwbDownloadGrainCurvesClick(Sender: TObject);
    procedure iwDBgUnitsSamplesColumns0TitleClick(Sender: TObject);
    procedure iwDBgUnitsColumns1Click(ASender: TObject; const AValue: string);
    procedure iwbDeleteUnitRecordClick(Sender: TObject);
    procedure iwbDeleteUnitsSamplesRecordClick(Sender: TObject);
    procedure iwDBgUnitsSamplesColumns6Click(ASender: TObject;
      const AValue: string);
    procedure iwcbPDFAutoscaleChange(Sender: TObject);
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
  public
    UserProjectIDstring : string;
    procedure CalculatePDF(ShowConcordantOnly : string; NumIncluded : integer);
    procedure GraphPDF(UnitID : integer; UnitAge : double);
    procedure GraphExistingPDF;
    function Gauss (Ratio, Mean, Dev : double) : double;
    procedure GetSampleData(tUserID, tIsotopeSystemID, tSampleNo : string; var NumIncluded : integer);
    procedure SetUserGrainPDF(tProjectID,tUserID,tUnitIDstr,tStepNoStr,tIsotopeSystemIDstr : string; tUnitAge : double; var tNo : integer);
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
  tUserID, tIsotopeSystemID, tSampleNo : string;
  tUnitAge : double;
  tUnitID : integer;
  tCountryID, tUnitName, tUnitRank : string;
  i, imax, iStart : integer;
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
  tNo := 0;
  Val(iwe1.Text,Cutoff1,iCode);
  Val(iweGraphAgeFrom.Text,FromAge,iCode);
  Val(iweGraphAgeTo.Text,ToAge,iCode);
  Val(iweMinimumUncertainty.Text,MinimumUncertainty,iCode);
  if (iwrgAndOr.ItemIndex = 0) then PDFtype := 'AND';
  if (iwrgAndOr.ItemIndex = 1) then PDFtype := 'OR';
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  UserProjectIDstr := UserProjectIDstring;
  if (UserProjectIDstr <> '') then
  begin
    dmDV.qDeleteGrainAgePDF.ParamByName('ProjectID').AsString := UserProjectIDstr;
    dmDV.qDeleteGrainAgePDF.ExecSQL(false);
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbCalculateProbabilityCurvesClick - 1');
    iStart := 0;
    tIsotopeSystemID := 'UPb';
    if (iwrgIsotopeSystemVariable.ItemIndex = 0) then
    begin
      tIsotopeSystemID := 'UPb';
    end;
    if (iwrgIsotopeSystemVariable.ItemIndex = 1) then
    begin
      tIsotopeSystemID := 'LuHf';
    end;
    tUserID := UserSession.UserID;
    dmDV.ConstructRawDataSampleQuery;
    //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.iwbCalculateProbabilityCurvesClick - 2');
    ChartPDF.Series[0].Clear;
    ChartPDF.Series[1].Clear;
    ChartPDF.Series[2].Clear;
    ChartPDF.Series[3].Clear;
    ChartPDF.Series[4].Clear;
    ChartPDF.Series[5].Clear;
    dmDV.cdsUserUnitGrainAgePDF.Close;
    dmDV.qUserUnitGrainAgePDF.Close;
    dmDV.qUserUnitGrainAgePDF.ParamByName('ProjectID').AsString := UserProjectIDstr;
    dmDV.cdsData.Open;
    dmDV.cdsSamplePDF.Open;
    dmDV.cdsUnitPDF.Open;
    dmDV.cdsUserUnitSuiteSamples.Close;
    dmDV.qUserUnitSuiteSamples.Close;
    dmDV.qUserUnitSuiteSamples.ParamByName('ProjectID').AsString := UserProjectIDstr;
    //dmDV.qUserUnitSuiteSamples.ParamByName('UserID').AsString := UserSession.UserID;
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
      dmDV.cdsUnitPDF.EmptyDataSet;
      tUnitID := dmDV.cdsGrainUnitsUnitID.AsInteger;
      tUnitIDstr := IntToStr(tUnitID);
      dmUser.SetDeveloperData('iwbCalculateProbabilityCurves - '+tUnitIDstr);
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
        dmUser.SetDeveloperData('iwbCalculateProbabilityCurves - before UpdateNumFracTotal');
        dmDV.UpdateUserUnitSuiteSamplesNumFrac(NumFracTotal,UserProjectIDstr,tSampleNo);
        dmUser.SetDeveloperData('iwbCalculateProbabilityCurves - before GetSampleData');
        GetSampleData(tUserID,tIsotopeSystemID,tSampleNo,NumFracIncluded);
        dmUser.SetDeveloperData('iwbCalculateProbabilityCurves - before UpdateNumFracIncl');
        dmDV.UpdateUserUnitSuiteSamplesNumFracIncl('A',NumFracTotal,UserProjectIDstr,tSampleNo);
        //WebApplication.ShowMessage(tSampleNo+' NumFracIncluded = '+IntToStr(NumFracIncluded));
        //calculate PDF for sample
        dmUser.SetDeveloperData('iwbCalculateProbabilityCurves - before CalculatePDFY');
        CalculatePDF('Y',NumFracIncluded);
        dmUser.SetDeveloperData('iwbCalculateProbabilityCurves - after CalculatePDFY');
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
      //WebApplication.ShowMessage('RecordCount = '+IntToStr(dmDV.cdsUnitPDF.RecordCount));
      //WebApplication.ShowMessage('Graph Unit '+tUnitName+' '+tUnitRank+' ('+tUnitIDstr+')    RecordCount = '+IntToStr(dmDV.cdsUnitPDF.RecordCount));
      GraphPDF(tUnitID,tUnitAge);
      //WebApplication.ShowMessage('Store Unit '+tUnitName+' '+tUnitRank+' ('+tUnitIDstr+')');
      SetUserGrainPDF(UserProjectIDstr,tUserID,tUnitIDstr,tStepNoStr,tIsotopeSystemID,tUnitAge,tNo);
      //WebApplication.ShowMessage('Unit '+tUnitName+' '+tUnitRank+' ('+tUnitIDstr+') completed');
      dmDV.cdsGrainUnits.Next;
    until dmDV.cdsGrainUnits.Eof;
    Val(iweGraphAgeFrom.Text,FromAge,iCode);
    Val(iweGraphAgeTo.Text,ToAge,iCode);
    Val(iweXMin.Text,BottomAxisMin,iCode);
    Val(iweXMax.Text,BottomAxisMax,iCode);
    Val(iweYMin.Text,LeftAxisMin,iCode);
    Val(iweYMax.Text,LeftAxisMax,iCode);
    ChartPDF.BottomAxis.SetMinMax(BottomAxisMin,BottomAxisMax);
    ChartPDF.LeftAxis.SetMinMax(LeftAxisMin,LeftAxisMax);
    Val(iweXIncrement.Text,tXIncrement,iCode);
    Val(iweYIncrement.Text,tYIncrement,iCode);
    ChartPDF.BottomAxis.Increment := tXIncrement;
    ChartPDF.LeftAxis.Increment := tYIncrement;
    iwcbPDFAutoscale.Checked := false;
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
    if PDFType='AND' then
    begin
      tmpStr := 'Gaussian AND ';
    end;
    if PDFType='OR' then
    begin
      tmpStr := 'Gaussian OR ';
    end;
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
  UserProjectIDstr := UserProjectIDstring;
  if (UserProjectIDstr <> '') then
  begin
    dmDV.DeleteUserGrainAgePDF(UserProjectIDstr);
  end else
  begin
    WebApplication.ShowMessage('A valid UserProject must be selected');
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwbDownloadGrainAgeDataClick(
  Sender: TObject);
var
  MemStream: TMemoryStream;
  UserProjectIDstr : string;
begin
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  UserProjectIDstr := UserProjectIDstring;
  //Val(UserProjectIDstr,UserProjectID,iCode);
  //dmDV.cdsUserUnitGrainAgeData.Open;
  //dmDV.cdsUserUnitGrainAgeData.First;
  //dmDV.FlexcelReportGrainData.Template := DefaultFlexCellFolder+'FlxStratDBGrainData.xls';
  //MemStream:=TMemoryStream.Create;
  //try
  //  dmDV.FlexcelReportGrainData.SavetoStream(MemStream);
  //  WebApplication.SendStream(MemStream,true,'','Grain Data for Lithostratigraphic Units.xls'); //save as an attachment
  //  MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
  //finally
  //  FreeAndNil(MemStream);
  //end; //finally
end;

procedure TISFGridGrainProbabilityUnits.iwbDownloadGrainCurvesClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  UserProjectIDstr : string;
begin
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  UserProjectIDstr := UserProjectIDstring;
  dmDV.cdsUserUnitGrainAgePDF.Close;
  dmDV.qUserUnitGrainAgePDF.Close;
  dmDV.qUserUnitGrainAgePDF.ParamByName('ProjectID').AsString := UserProjectIDstr;
  dmDV.FlexcelReportGrainPDF.Template := DefaultFlexCellFolder+'FlxStratDBGrainPDF.xls';
  MemStream:=TMemoryStream.Create;
  try
    dmDV.FlexcelReportGrainPDF.SavetoStream(MemStream);
    WebApplication.SendStream(MemStream,true,'','Probabilities for Lithostratigraphic Units.xls'); //save as an attachment
    MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
  finally
    FreeAndNil(MemStream);
  end; //finally
end;

procedure TISFGridGrainProbabilityUnits.iwbDownloadUnitsClick(Sender: TObject);
var
  MemStream: TMemoryStream;
begin
  dmStrat.cdsUserUnits.Open;
  dmStrat.cdsUserUnits.First;
  dmStrat.FlexcelReportUserUnits.Template := DefaultFlexCellFolder+'FlxStratDBUserUnits.xls';
  MemStream:=TMemoryStream.Create;
  try
    dmStrat.FlexcelReportUserUnits.SavetoStream(MemStream);
    WebApplication.SendStream(MemStream,true,'','User Units.xls'); //save as an attachment
    MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
  finally
    FreeAndNil(MemStream);
  end; //finally
end;

procedure TISFGridGrainProbabilityUnits.iwbDownloadUnitsSamplesClick(
  Sender: TObject);
var
  MemStream: TMemoryStream;
  UserProjectIDstr : string;
begin
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  UserProjectIDstr := UserProjectIDstring;
  if (UserProjectIDstr <> '') then
  begin
    dmDV.cdsUserUnitSuiteSamples.Close;
    dmDV.qUserUnitSuiteSamples.Close;
    dmDV.qUserUnitSuiteSamples.ParamByName('ProjectID').AsString := UserProjectIDstr;
    //dmDV.qUserUnitSuiteSamples.ParamByName('UserID').AsString := UserSession.UserID;
    dmDV.cdsUserUnitSuiteSamples.Open;
    dmDV.cdsUserUnitSuiteSamples.First;
    dmDV.FlexcelReportUnitSuiteSamples.Template := DefaultFlexCellFolder+'FlxStratDBUserUnitSamples.xls';
    MemStream:=TMemoryStream.Create;
    try
      dmDV.FlexcelReportUnitSuiteSamples.SavetoStream(MemStream);
      WebApplication.SendStream(MemStream,true,'','Units_Suites_Samples.xls'); //save as an attachment
      MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
    finally
      FreeAndNil(MemStream);
    end; //finally
  end else
  begin
    WebApplication.ShowMessage('A valid UserProject must be selected');
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwbGraphExistingProbabilityCurvesClick(
  Sender: TObject);
var
  tUserID, tIsotopeSystemID : string;
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
  UserProjectIDstr := UserProjectIDstring;
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
    tIsotopeSystemID := 'UPb';
    if (iwrgIsotopeSystemVariable.ItemIndex = 0) then
    begin
      tIsotopeSystemID := 'UPb';
    end;
    if (iwrgIsotopeSystemVariable.ItemIndex = 1) then
    begin
      tIsotopeSystemID := 'LuHf';
    end;
    tUserID := UserSession.UserID;
    ChartPDF.Series[0].Clear;
    ChartPDF.Series[1].Clear;
    ChartPDF.Series[2].Clear;
    ChartPDF.Series[3].Clear;
    ChartPDF.Series[4].Clear;
    ChartPDF.Series[5].Clear;
    dmDV.cdsUserUnitGrainAgePDF.First;
    GraphExistingPDF;
    Val(iweGraphAgeFrom.Text,FromAge,iCode);
    Val(iweGraphAgeTo.Text,ToAge,iCode);
    Val(iweXMin.Text,BottomAxisMin,iCode);
    Val(iweXMax.Text,BottomAxisMax,iCode);
    Val(iweYMin.Text,LeftAxisMin,iCode);
    Val(iweYMax.Text,LeftAxisMax,iCode);
    ChartPDF.BottomAxis.SetMinMax(BottomAxisMin,BottomAxisMax);
    ChartPDF.LeftAxis.SetMinMax(LeftAxisMin,LeftAxisMax);
    Val(iweXIncrement.Text,tXIncrement,iCode);
    Val(iweYIncrement.Text,tYIncrement,iCode);
    ChartPDF.BottomAxis.Increment := tXIncrement;
    ChartPDF.LeftAxis.Increment := tYIncrement;
    iwcbPDFAutoscale.Checked := false;
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
    if PDFType='AND' then
    begin
      tmpStr := 'Gaussian AND ';
    end;
    if PDFType='OR' then
    begin
      tmpStr := 'Gaussian OR ';
    end;
    ChartPDF.SubFoot.Text[0] := tmpStr;
    ChartPDF.SubFoot.Text[1] := 'Minimum age uncertainty = '+FormatFloat('###0.0',MinimumUncertainty)+' Ma';
    ChartPDF.Series[0].Title := Trim(iwe1.Text)+' - '+Trim(iwe2.Text);
    ChartPDF.Series[1].Title := Trim(iwe2.Text)+' - '+Trim(iwe3.Text);
    ChartPDF.Series[2].Title := Trim(iwe3.Text)+' - '+Trim(iwe4.Text);
    ChartPDF.Series[3].Title := Trim(iwe4.Text)+' - '+Trim(iwe5.Text);
    ChartPDF.Series[4].Title := Trim(iwe5.Text)+' - '+Trim('100.0');
  end else
  begin
    WebApplication.ShowMessage('A valid UserProject must be selected');
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwbReturnClick(Sender: TObject);
begin
  dmStrat.cdsUserUnits.Close;
  dmDV.cdsUserUnitSuiteSamples.Close;
  dmDV.cdsUserUnitGrainAgePDF.Close;
  dmDV.cdsSamplePDF.EmptyDataSet;
  dmDV.cdsUnitPDF.EmptyDataSet;
  dmDV.cdsData.EmptyDataSet;
  dmDV.cdsGrainUnits.EmptyDataSet;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFGridGrainProbabilityUnits.iwbScaleConcordiaAxesClick(
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
  ChartPDF.BottomAxis.SetMinMax(tXMin,tXMax);
  ChartPDF.LeftAxis.SetMinMax(tYMin,tYMax);
  ChartPDF.BottomAxis.Increment := tXIncrement;
  ChartPDF.LeftAxis.Increment := tYIncrement;
  iwcbPDFAutoscale.Checked := false;
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
  tProjectIDstr := UserProjectIDstring;
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
  tVariableID, tIsotopeSystemID : string;
  tUserID,tUnitIDstr,tStratDBUnitIDstr,tStratDBUnitName,tStratDBUnitRank,
  tSampleNo, tProjectIDstr,
  tStratDBUnitAgeStr,tLongitudeStr,tLatitudeStr,tCountryID : string;
begin
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',tProjectIDstr);
  tProjectIDstr := UserProjectIDstring;
  tVariableID := 'Age_preferred';
  tIsotopeSystemID := 'UPb';
  if (iwrgIsotopeSystemVariable.ItemIndex = 0) then
  begin
    tVariableID := 'Age_preferred';
    tIsotopeSystemID := 'UPb';
  end;
  if (iwrgIsotopeSystemVariable.ItemIndex = 1) then
  begin
    tVariableID := 'TDMMa';
    tIsotopeSystemID := 'LuHf';
  end;
  tUserID := UserSession.UserID;
  dmDV.cdsUserUnitSuiteSamples.Close;
  dmDV.qUserUnitSuiteSamples.Close;
  dmDV.qUserUnitSuiteSamples.ParamByName('ProjectID').AsString := tProjectIDstr;
  //dmDV.qUserUnitSuiteSamples.ParamByName('UserID').AsString := UserSession.UserID;
  dmDV.cdsUserUnitSuiteSamples.Open;
  //dmUser.SetDeveloperData(tVariableID+' '+tIsotopeSystemID+' '+tUserID);
  dmStrat.cdsUserUnits.First;
  repeat
    //dmUser.SetDeveloperData('1 repeat before if');
    if (dmStrat.cdsUserUnitsDVUNITID.AsInteger > 0) then
    begin
      tUnitIDstr := dmStrat.cdsUserUnitsDVUNITID.AsString;
      tStratDBUnitIDstr := dmStrat.cdsUserUnitsUNITID.AsString;
      tStratDBUnitName := dmStrat.cdsUserUnitsSTRATDBUNITNAME.AsString;
      tStratDBUnitRank := dmStrat.cdsUserUnitsSTRATDBUNITRANK.AsString;
      tStratDBUnitAgestr := dmStrat.cdsUserUnitsUNITAGE.AsString;
      tCountryID := dmStrat.cdsUserUnitsCOUNTRYID.AsString;
      //dmUser.SetDeveloperData(tUnitIDstr+' '+tStratDBUnitIDstr+' '+tStratDBUnitName);
      dmDV.qUserSamplesForUnit.Close;
      dmDV.qUserSamplesForUnit.ParamByName('USERID').AsString := dmStrat.cdsUserUnitsUSERID.AsString;
      dmDV.qUserSamplesForUnit.ParamByName('UNITID').AsString := dmStrat.cdsUserUnitsDVUNITID.AsString;
      dmDV.qUserSamplesForUnit.ParamByName('VARIABLEID').AsString := tVariableID;
      dmDV.qUserSamplesForUnit.ParamByName('ISOTOPESYSTEMID').AsString := tIsotopeSystemID;
      dmDV.cdsUserSamplesForUnit.Close;
      dmDV.cdsUserSamplesForUnit.Open;
      if (dmDV.cdsUserSamplesForUnit.RecordCount > 0) then
      begin
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
  dmDV.cdsUserUnitSuiteSamples.Refresh;
end;

procedure TISFGridGrainProbabilityUnits.iwbUnitsSamplesClearClick(
  Sender: TObject);
var
  UserProjectIDstr : string;
begin
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  UserProjectIDstr := UserProjectIDstring;
  //dmDV.qDeleteAny(UserProjectIDstr);
  dmDV.cdsUserUnitSuiteSamples.Refresh;
end;

procedure TISFGridGrainProbabilityUnits.iwbUpdateUnitAgeClick(Sender: TObject);
var
  UserProjectIDstr : string;
begin
  GetComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  UserProjectIDstr := UserProjectIDstring;
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

procedure TISFGridGrainProbabilityUnits.iwcbPDFAutoscaleChange(Sender: TObject);
begin
  if iwcbPDFAutoscale.Checked then
  begin
    ChartPDF.LeftAxis.Automatic := true;
    ChartPDF.BottomAxis.Automatic := true;
  end;
end;

procedure TISFGridGrainProbabilityUnits.iwcbPDFAutoscaleClick(Sender: TObject);
begin
  if not iwcbPDFAutoscale.checked then
  begin
    ChartPDF.BottomAxis.Automatic := true;
    ChartPDF.LeftAxis.Automatic := true;
 end;
end;

procedure TISFGridGrainProbabilityUnits.iwcbShow1Click(Sender: TObject);
begin
  if (Sender = iwcbShow1) then ChartPDF.Series[0].Visible := iwcbShow1.Checked;
  if (Sender = iwcbShow2) then ChartPDF.Series[1].Visible := iwcbShow2.Checked;
  if (Sender = iwcbShow3) then ChartPDF.Series[2].Visible := iwcbShow3.Checked;
  if (Sender = iwcbShow4) then ChartPDF.Series[3].Visible := iwcbShow4.Checked;
  if (Sender = iwcbShow5) then ChartPDF.Series[4].Visible := iwcbShow5.Checked;
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
begin
  iwbCalculateProbabilityCurves.Enabled := true;
  iwbDeleteUserGrainAgePDF.Enabled := true;
  UserProjectIDstring := iwcbUserProject.SelectedValue;
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
  iwlPrevPage.Visible := false;
  iwlNextPage.Visible := false;
  iwlFirstPage.Visible := false;
  iwlLastPage.Visible := false;
  UserSession.PageNum := 1;
  UserSession.PageNumTotal := 1;
  {
  if UserSession.LoggedIn then
  begin
    //iwbDownload.Visible := UserSession.CanModifyPlus;
    //iwbDownload.Visible := UserSession.IsDeveloper;
    dmUser.qThisProgram.Close;
    dmUser.qThisProgram.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
    dmUser.cdsThisProgram.Close;
    dmUser.cdsThisProgram.Open;
    if (UserSession.ThisProgram = 'StratDB') then
    begin
      //TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
      TopBar.lblProgTitle.Text := dmUser.cdsThisProgramSOFTWARENAME.AsString;
    end;
    if (UserSession.ThisProgram = 'IGCP509') then
    begin
      TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
    end;
    iwbDownloadGrainCurves.Enabled := UserSession.CanExport;
    iwbDownloadGrainAgeData.Enabled := UserSession.CanExport;
    iwbDownloadGrainAgeData.Enabled := false;  //temporary until properly coded
    dmUser.SetDeveloperData('4 before Query1');
    dmStrat.Query1.Close;
    dmStrat.cdsQuery1.Close;
    dmStrat.Query1.ParamByName('USERID').AsString := UserSession.UserID;
    dmStrat.cdsQuery1.Open;
    dmUser.SetDeveloperData('5 after Query1');
    UserSession.NumRecordsFound := 0;
    dmStrat.Query1RecordCount;
    dmUser.SetDeveloperData('6 after Query1RecordCount');
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
    dmUser.SetDeveloperData('7 before UserProjects');
    dmUser.SetDeveloperData(UserSession.UserID);
    dmUser.SetDeveloperData(dmDV.qUserProjects.SQL.Text);
    dmDV.cdsUserProjects.Close;
    dmDV.qUserProjects.Close;
    dmDV.qUserProjects.ParamByName('USERID').AsString := UserSession.UserID;
    dmDV.cdsUserProjects.Close;
    UpdateComboBoxValue(iwcbUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
    dmUser.SetDeveloperData('8 after UserProjects');
    iwbCalculateProbabilityCurves.Enabled := false;
  end;
  }
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
  end;
  //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.CalculatePDF - 1');
  dmDV.cdsData.First;
  dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.CalculatePDF - '+dmDV.cdsDataSampleNo.AsString);
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
  {
  tempmax := 0.0;
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
  //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.CalculatePDF - 5');
  for l := 0 to Steps do
  begin
    Spectrum2d[l,2] := Spectrum2d[l,2]*tempmax;
  end;
  //dmUser.SetDeveloperData('TISFGridGrainProbabilityUnits.CalculatePDF - 6');
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
  Spectrum2d : array[0..Steps,1..2] of double;
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
    if ((y2 < Cutoff2) and (y2 >= Cutoff1)) then ChartPDF.Series[0].AddXY(x2,UnitAge);
    if ((y2 < Cutoff3) and (y2 >= Cutoff2)) then ChartPDF.Series[1].AddXY(x2,UnitAge);
    if ((y2 < Cutoff4) and (y2 >= Cutoff3)) then ChartPDF.Series[2].AddXY(x2,UnitAge);
    if ((y2 < Cutoff5) and (y2 >= Cutoff4)) then ChartPDF.Series[3].AddXY(x2,UnitAge);
    if (y2 >= Cutoff5) then ChartPDF.Series[4].AddXY(x2,UnitAge);
    dmDV.cdsUnitPDF.Next;
  until dmDV.cdsUnitPDF.Eof;
  dmDV.cdsUnitPDF.First;
end;

procedure TISFGridGrainProbabilityUnits.GraphExistingPDF;
var
  i, j, k, l : integer;
  X1, X2, Y2 : double;
  tempmax : double;
  Spectrum2d : array[0..Steps,1..2] of double;
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
    if ((y2 < Cutoff2) and (y2 >= Cutoff1)) then ChartPDF.Series[0].AddXY(x2,tUnitAge);
    if ((y2 < Cutoff3) and (y2 >= Cutoff2)) then ChartPDF.Series[1].AddXY(x2,tUnitAge);
    if ((y2 < Cutoff4) and (y2 >= Cutoff3)) then ChartPDF.Series[2].AddXY(x2,tUnitAge);
    if ((y2 < Cutoff5) and (y2 >= Cutoff4)) then ChartPDF.Series[3].AddXY(x2,tUnitAge);
    if (y2 >= Cutoff5) then ChartPDF.Series[4].AddXY(x2,tUnitAge);
    dmDV.cdsUserUnitGrainAgePDF.Next;
  until dmDV.cdsUserUnitGrainAgePDF.Eof;
  dmDV.cdsUserUnitGrainAgePDF.First;
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

procedure TISFGridGrainProbabilityUnits.GetSampleData(tUserID, tIsotopeSystemID, tSampleNo : string; var NumIncluded : integer);
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
  dmDV.qRawSmp.ParamByName('IsotopeSystem').AsString := tIsotopeSystemID;
  dmDV.qRawSmp.ParamByName('SampleNo').AsString := tSampleNo;
  dmDV.cdsRawSmp.Open;
  dmDV.cdsData.Open;
  dmDV.cdsData.EmptyDataSet;
  dmDV.cdsRawSmp.First;
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
  tIsotopeSystemIDstr : string; tUnitAge : double; var tNo : integer);
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
      dmDV.InsertUserGrainAgePDF(tProjectID,tUserID,tUnitIDstr,tStepNoStr,tUnitAgeStr,tIsotopeSystemIDstr,PDFAge,PDFvalue);
    except
    end;
    i := i + 1;
    tNo := tNo + 1;
    dmDV.cdsUnitPDF.Next;
  until ((dmDV.cdsUnitPDF.Eof) or (tNo > MaxAllowed));
end;

end.
