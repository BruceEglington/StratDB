unit IWStrat_GrainSources;

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
  IWCompMemo, IWCompListbox;

type
  TISFGrainSources = class(TIWAppForm)
    iwrLeft: TIWRegion;
    iwrPageFull: TIWRegion;
    TopBar: TISFTopBarStrat;
    iwrRight: TIWRegion;
    iwrButtonsTop: TIWRegion;
    iwbReturn: TIWButton;
    iwrUnitsSamplesTop: TIWRegion;
    iwlUnitsSamples: TIWLabel;
    iwlUnitsSamplesSortedBy: TIWLabel;
    iwDBgUnitsSamples: TIWDBGrid;
    iwbDeleteUnitsSamplesRecord: TIWButton;
    iwrSourcesTop: TIWRegion;
    iwbFindSources: TIWButton;
    iwrSources: TIWRegion;
    IWRegion3: TIWRegion;
    IWRegion4: TIWRegion;
    IWRegion5: TIWRegion;
    IWRegion6: TIWRegion;
    IWRegion7: TIWRegion;
    IWRegion8: TIWRegion;
    iwdbgGrainSources: TIWDBGrid;
    iwrgIsotopeSystemVariable: TIWRadioGroup;
    iwcbAreas: TIWCheckBox;
    iwlAreas: TIWListbox;
    iwcbContinents: TIWCheckBox;
    iwlContinents: TIWListbox;
    iwrDownloadButtons: TIWRegion;
    iwbDownloadMatchingData: TIWButton;
    iwlUnitsSamplesPartialList: TIWLabel;
    IWLabel2: TIWLabel;
    iwbDeleteUserProvenanceData: TIWButton;
    iwrUserProject: TIWRegion;
    iwlUserProject: TIWComboBox;
    IWLabel1: TIWLabel;
    iwbDownloadDetritalSampleLocalities: TIWButton;
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbUnitsSamplesAddClick(Sender: TObject);
    procedure iwDBgUnitsSamplesColumns0TitleClick(Sender: TObject);
    procedure iwbDeleteUnitRecordClick(Sender: TObject);
    procedure iwbDeleteUnitsSamplesRecordClick(Sender: TObject);
    procedure iwDBgUnitsSamplesColumns6Click(ASender: TObject;
      const AValue: string);
    procedure iwbFindSourcesClick(Sender: TObject);
    procedure iwbDownloadMatchingDataClick(Sender: TObject);
    procedure iwlUserProjectChange(Sender: TObject);
    procedure iwbDeleteUserProvenanceDataClick(Sender: TObject);
    procedure iwbDownloadDetritalSampleLocalitiesClick(Sender: TObject);
  public
    UserProjectID : integer;
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
  ServerController, IWStrat_dm, IWStrat_details,DB_List_Combo,
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


procedure TISFGrainSources.iwbDeleteUnitRecordClick(Sender: TObject);
begin
  try
    dmStrat.cdsUserUnits.Delete;
    dmStrat.cdsUserUnits.Post;
    dmStrat.cdsUserUnits.ApplyUpdates(0);
  except
  end;
end;

procedure TISFGrainSources.iwbDeleteUnitsSamplesRecordClick(
  Sender: TObject);
begin
  try
    dmDV.cdsUserUnitSuiteSamples.Delete;
    //dmDV.cdsUserUnitSuiteSamples.Post;
    dmDV.cdsUserUnitSuiteSamples.ApplyUpdates(0);
  except
  end;
end;

procedure TISFGrainSources.iwbDeleteUserProvenanceDataClick(Sender: TObject);
var
  UserProjectIDstr : string;
begin
  GetComboBoxValue(iwlUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  dmDV.DeleteUserProvenanceData(UserProjectIDstr);
end;

procedure TISFGrainSources.iwbDownloadDetritalSampleLocalitiesClick(
  Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  UserProjectIDstr : string;
begin
  GetComboBoxValue(iwlUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  dmDV.cdsUserUnitSuiteSamples.Close;
  dmDV.qUserUnitSuiteSamples.Close;
  dmDV.qUserUnitSuiteSamples.ParamByName('ProjectID').AsString := UserProjectIDstr;
  dmDV.cdsUserUnitSuiteSamples.Open;
  dmDV.cdsUserUnitSuiteSamples.First;
  //dmDV.FlexcelReportUnitSuiteSamples.Template := DefaultFlexCellFolder+'FlxStratDBUserUnitSamples.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBUserUnitSamples.xlsx';
  frFileNameStr := 'Detrital Grain Sample Localities.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsUserUnitSuiteSamples',dmDV.cdsUserUnitSuiteSamples);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        //dmDV.FlexCelReportUnitSuiteSamples.SavetoStream(MemStream);
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

procedure TISFGrainSources.iwbDownloadMatchingDataClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  UserProjectIDstr : string;
begin
  GetComboBoxValue(iwlUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  dmDV.cdsUserSourceSamples.Close;
  dmDV.qUserSourceSamples.Close;
  dmDV.qUserSourceSamples.ParamByName('ProjectID').AsString := UserProjectIDstr;
  dmDV.cdsUserSourceSamples.Open;
  dmDV.cdsUserSourceSamples.First;
  //dmDV.FlexcelReportDetritalSOurces.Template := DefaultFlexCellFolder+'FlxStratDBGrainSources.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBGrainSources.xlsx';
  frFileNameStr := 'Detrital Grain Potential Provenances.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsUserSourceSamples',dmDV.cdsUserSourceSamples);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        //dmDV.FlexCelReportDetritalSources.SavetoStream(MemStream);
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

procedure TISFGrainSources.iwbFindSourcesClick(Sender: TObject);
var
  tUserID, tUnitName,
  tSampleNo, tUnitRank : string;
  tUnitID : integer;
  iCode : integer;
  tMinus, tPlus,
  tMinAge, tMaxAge,
  tUnitAge, tDetritalAge : double;
  i : integer;
  SourceRecordID, StratDBUnitID : integer;
  SourceIsotopeSystem,
  StratDBUnitName, StratDBUnitRank,
  CountryID, SourceCountryID,
  SourceInterpAbr, SourceSampleNo : string;
  Longitude, Latitude,
  SourceLongitude, SourceLatitude : double;
  SourceAge, SourceMinusAge, SourcePlusAge : double;
  UserProjectIDstr,tUnitIDstr,SourceRecordIDstr,
  StratDBUnitIDstr, StratDBUnitAgeStr,
  LongitudeStr,LatitudeStr,
  SourceAgePlus95Str, SourceAgeMinus95Str,
  SourceAgeStr, SourceLongitudeStr, SourceLatitudeStr,
  SourceUnitIDstr : string;
  SourceInterpMatching : integer;
  DoInsert : boolean;
begin
  GetComboBoxValue(iwlUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  Val(UserProjectIDstr,UserProjectID,iCode);
  tMinus := 10.0;
  tPlus := 10.0;
  UserSession.IncludeContinentValues := iwcbContinents.Checked;
  GetListBoxValues(iwlContinents,dmStrat.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
  UserSession.IncludeAreaValues := iwcbAreas.Checked;
  if (UserSession.IncludeAreaValues) then
    GetListBoxValues(iwlAreas,dmStrat.cdsCountries,'Country','CountryID',UserSession.AreaValues);
  tUserID := UserSession.UserID;
  dmDV.cdsUserUnitSuiteSamples.First;
  repeat
    tSampleNo := dmDV.cdsUserUnitSuiteSamplesSAMPLENO.AsString;
    tUnitIDstr := dmDV.cdsUserUnitSuiteSamplesUNITID.AsString;
    StratDBUnitIDstr := dmDV.cdsUserUnitSuiteSamplesSTRATDBUNITID.AsString;
    StratDBUnitName := dmDV.cdsUserUnitSuiteSamplesSTRATDBUNITNAME.AsString;
    StratDBUnitRank := dmDV.cdsUserUnitSuiteSamplesSTRATDBUNITRANK.AsString;
    StratDBUnitAgeStr := dmDV.cdsUserUnitSuiteSamplesSTRATDBUNITAGE.AsString;
    LongitudeStr := dmDV.cdsUserUnitSuiteSamplesLONGITUDE.AsString;
    LatitudeStr := dmDV.cdsUserUnitSuiteSamplesLATITUDE.AsString;
    dmDV.qSampleDetritalAges.Close;
    dmDV.cdsSampleDetritalAges.Close;
    dmDV.qSampleDetritalAges.ParamByName('UserID').AsString := tUserID;
    dmDV.qSampleDetritalAges.ParamByName('SampleID').AsString := tSampleNo;
    if (iwrgIsotopeSystemVariable.ItemIndex = 0) then
    begin
      dmDV.qSampleDetritalAges.ParamByName('IsotopeSystemID').AsString := 'UPb';
    end;
    if (iwrgIsotopeSystemVariable.ItemIndex = 1) then
    begin
      dmDV.qSampleDetritalAges.ParamByName('IsotopeSystemID').AsString := 'LuHf';
    end;
    dmDV.cdsSampleDetritalAges.Open;
    //dmUser.SetDeveloperData('Grain Provenance processing. Sample is '+tSampleNo);
    //cycle through all detrital records for the sample
    repeat
      tDetritalAge := dmDV.cdsSampleDetritalAgesRAGE.AsFloat;
      tMinAge := tDetritalAge - tMinus;
      tMaxAge := tDetritalAge + tPlus;
      //dmUser.SetDeveloperData('tDetritalAge is '+FormatFloat('###0.000',tDetritalAge));
      dmDV.qMatchingAges.Close;
      dmDV.cdsMatchingAges.Close;
      dmDV.qMatchingAges.SQL.Clear;
      dmDV.qMatchingAges.SQL.Add('SELECT distinct ISORGR30.recordid, isorgr30.countryabr, isorgr30.materialabr,');
      dmDV.qMatchingAges.SQL.Add('  isorgr30.isotopesystem, isorgr30.interpabr,');
      dmDV.qMatchingAges.SQL.Add('  isorgr30.rage, isorgr30.rageperror, isorgr30.ragemerror,');
      dmDV.qMatchingAges.SQL.Add('  smploc.sampleno, smploc.longitude,smploc.latitude,');
      dmDV.qMatchingAges.SQL.Add('  suite.unitname, suite.unitrank, suite.unitid, interpretation.interpmatching');
      dmDV.qMatchingAges.SQL.Add('FROM isorgr30, isofor, userswhofor, smpreg, smploc, interpretation, suite');
      dmDV.qMatchingAges.SQL.Add('WHERE userswhofor.USERID = :UserID');
      dmDV.qMatchingAges.SQL.Add('and isorgr30.rage >= :AgeMin');
      dmDV.qMatchingAges.SQL.Add('and isorgr30.rage <= :AgeMax');
      dmDV.qMatchingAges.SQL.Add('and isorgr30.unitid = suite.unitid');
      dmDV.qMatchingAges.SQL.Add('and isorgr30.recordid = smpreg.recordid');
      dmDV.qMatchingAges.SQL.Add('and isorgr30.recordid = isofor.recordid');
      dmDV.qMatchingAges.SQL.Add('and isofor.whoforid = userswhofor.whoforid');
      dmDV.qMatchingAges.SQL.Add('and smpreg.isosystem = isorgr30.isotopesystem');
      dmDV.qMatchingAges.SQL.Add('and smpreg.sampleno = smploc.sampleno');
      dmDV.qMatchingAges.SQL.Add('and isorgr30.interpabr = interpretation.interpabr');
      dmDV.qMatchingAges.SQL.Add('and interpretation.interpmatching > 0');
      UserSession.IncludeAreaValues := iwcbAreas.Checked;
      if (UserSession.IncludeAreaValues) then
        GetListBoxValues(iwlAreas,dmStrat.cdsCountries,'Country','CountryID',UserSession.AreaValues);
      if (UserSession.IncludeAreaValues) then
      begin
        dmDV.qMatchingAges.SQL.Add('AND ( ISORGR30.COUNTRYABR = '+''''+UserSession.AreaValues.Strings[0]+'''');
        if (UserSession.AreaValues.Count >1) then
        begin
          for i := 2 to UserSession.AreaValues.Count do
          begin
            dmDV.qMatchingAges.SQL.Add('OR ISORGR30.COUNTRYABR = '+''''+UserSession.AreaValues.Strings[i-1]+'''');
          end;
        end;
        dmDV.qMatchingAges.SQL.Add(' ) ');
      end;
      //dmUser.SetDeveloperData(dmDV.qMatchingAges.SQL.Text);
      //execute query to find matching records
      dmDV.qMatchingAges.ParamByName('UserID').AsString := tUserID;
      dmDV.qMatchingAges.ParamByName('AgeMin').AsFloat := tMinAge;
      dmDV.qMatchingAges.ParamByName('AgeMax').AsFloat := tMaxAge;
      dmDV.cdsMatchingAges.Open;
      dmDV.cdsMatchingAges.First;
      //dmUser.SetDeveloperData('after cdsMatchingAges.open');
      repeat
        SourceRecordIDstr := dmDV.cdsMatchingAgesRECORDID.AsString;
        SourceUnitIDstr := dmDV.cdsMatchingAgesUNITID.AsString;
        SourceCountryID := dmDV.cdsMatchingAgesCOUNTRYABR.AsString;
        SourceLongitudeStr := dmDV.cdsMatchingAgesLONGITUDE.AsString;
        SourceLatitudeStr := dmDV.cdsMatchingAgesLATITUDE.AsString;
        SourceSampleNo := dmDV.cdsMatchingAgesSAMPLENO.AsString;
        SourceInterpAbr := dmDV.cdsMatchingAgesINTERPABR.AsString;
        SourceInterpMatching := dmDV.cdsMatchingAgesINTERPMATCHING.AsInteger;
        SourceIsotopeSystem := dmDV.cdsMatchingAgesISOTOPESYSTEM.AsString;
        SourceAgeStr := dmDV.cdsMatchingAgesRAGE.AsString;
        SourceAgePlus95Str := dmDV.cdsMatchingAgesRAGEPERROR.AsString;
        SourceAgeMinus95Str := dmDV.cdsMatchingAgesRAGEMERROR.AsString;
        DoInsert := true;
        if (SourceInterpMatching = 2) then //Detri, Depos and Inher ages
        begin
          //construct query to check what the formation age is of the unit
          //for which sedimentation age applies. If the formation age of the
          //unit from which this specific peak comes is younger than the formation
          //age of the host sediment
          //then don't add record to dataset.
          //If the sediment does not have an associated  formation age then
          //ignore the result (do not include in the output file)
          //
          //if not allowed then set DoInsert to false;
          //first, find the GISID for the DV UnitID (this is the StratDB Unit ID
          dmDV.qStratDBUnitIDForDVUnitID.Close;
          dmDV.cdsStratDBUnitIDForDVUnitID.Close;
          dmDV.qStratDBUnitIDForDVUnitID.ParamByName('UnitID').AsString := SourceUnitIDstr;
          dmDV.cdsStratDBUnitIDForDVUnitID.Open;
          if (dmDV.cdsStratDBUnitIDForDVUnitID.RecordCount > 0) then
          begin
            //now run query to find the age of the unit
            //if StratDB unit age is greater than the age of the original unit
            //being checked for provenance then accept otherwise reject
          dmStrat.qThisUnitAge.Close;
          dmStrat.cdsThisUnitAge.Close;
          dmStrat.qThisUnitAge.ParamByName('UnitID').AsInteger := dmDV.cdsStratDBUnitIDForDVUnitIDGISID.AsInteger;
          dmStrat.cdsThisUnitAge.Open;
          if (dmStrat.cdsThisUnitAge.RecordCount > 0) then
          begin
            //now run query to find the age of the unit
            //if StratDB unit age is greater than the age of the original unit
            //being checked for provenance then accept otherwise reject
            if (dmStrat.cdsThisUnitAgeMINAGE.AsFloat <= dmDV.cdsMatchingAgesRAGE.AsFloat) then
            begin
              DoInsert := false;
            end;
          end;
          end;
        end;
        if (SourceInterpMatching = 3) then //CrsRs ages
        begin
          //will need something similar to the situation for detrital sediments
          //where younger sediments can also have older detrital peaks
          //
          //if not allowed then set DoInsert to false;
        end;
        if DoInsert then
        begin
          dmDV.InsertUserSourceSamples(UserProjectIDstr,tUserID, tUnitIDstr, tSampleNo, SourceRecordIDstr,
            StratDBUnitIDstr,StratDBUnitName,StratDBUnitRank,StratDBUnitAgeStr,
            LongitudeStr,LatitudeStr,SourceCountryID,SourceUnitIDstr,SourceInterpAbr,
            SourceAgeStr,SourceAgePlus95Str,SourceAgeMinus95Str,
            SourceSampleNo,SourceLongitudeStr, SourceLatitudeStr);
        end;
        dmDV.cdsMatchingAges.Next;
      until dmDV.cdsMatchingAges.Eof;
      dmDV.cdsSampleDetritalAges.Next;
    until dmDV.cdsSampleDetritalAges.Eof;
    dmDV.cdsUserUnitSuiteSamples.Next;
  until dmDV.cdsUserUnitSuiteSamples.Eof;
  dmDV.cdsUserUnitSuiteSamples.First;
  dmDV.cdsUserSourceSamples.Close;
  dmDV.qUserSourceSamples.Close;
  //run update query to set original reference sourcenum values so as to be able to output
  //reference details for the matching ages
  dmDV.qUpdateUserUnitSourceReferences.Close;
  dmDV.qUpdateUserUnitSourceReferences.SQL.Clear;
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('update userunitsuitesources s');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('set s.sourcenuma=(select a.refnum');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('from sourcea a');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('where s.sourcerecordid=a.recordid');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('and a.sourcetypeid='+Quotedstr('A'));
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('and s.userprojectid=:ProjectID');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add(')');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('where exists (select *');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('from sourcea a2');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('where a2.recordid=s.sourcerecordid');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('and s.userprojectid=:ProjectID');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('and a2.sourcetypeid='+QuotedStr('A'));
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add(')');
  dmDV.qUpdateUserUnitSourceReferences.ParamByName('ProjectID').AsString := UserProjectIDstr;
  dmDV.qUpdateUserUnitSourceReferences.ExecSQL;
  //run update query to set cited reference sourcenum values so as to be able to output
  //reference details for the matching ages
  dmDV.qUpdateUserUnitSourceReferences.Close;
  dmDV.qUpdateUserUnitSourceReferences.SQL.Clear;
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('update userunitsuitesources s');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('set s.sourcenumc=(select a.refnum');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('from sourcea a');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('where s.sourcerecordid=a.recordid');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('and a.sourcetypeid='+Quotedstr('C'));
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('and s.userprojectid=:ProjectID');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add(')');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('where exists (select *');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('from sourcea a2');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('where a2.recordid=s.sourcerecordid');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('and s.userprojectid=:ProjectID');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('and a2.sourcetypeid='+QuotedStr('C'));
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add(')');
  dmDV.qUpdateUserUnitSourceReferences.ParamByName('ProjectID').AsString := UserProjectIDstr;
  dmDV.qUpdateUserUnitSourceReferences.ExecSQL;
  //run update query to set reference sourcenum values for cited reference sources in
  //cases where no original source reference is available i.e. where
  //sourcenuma = 0, substitute the value for sourcenumc
  //This is done to facilitate ouptut of a single SOURCESHORT field content
  dmDV.qUpdateUserUnitSourceReferences.Close;
  dmDV.qUpdateUserUnitSourceReferences.SQL.Clear;
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('update userunitsuitesources s');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('set s.sourcenuma=(select a.refnum');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('from sourcea a');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('where s.sourcerecordid=a.recordid');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('and a.sourcetypeid='+Quotedstr('C'));
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('and s.sourcenuma=0');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('and s.userprojectid=:ProjectID');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add(')');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('where exists (select *');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('from sourcea a2');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('where a2.recordid=s.sourcerecordid');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('and s.userprojectid=:ProjectID');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('and a2.sourcetypeid='+QuotedStr('C'));
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add('and s.sourcenuma=0');
  dmDV.qUpdateUserUnitSourceReferences.SQL.Add(')');
  dmDV.qUpdateUserUnitSourceReferences.ParamByName('ProjectID').AsString := UserProjectIDstr;
  dmDV.qUpdateUserUnitSourceReferences.ExecSQL;
  dmDV.cdsUserSourceSamples.Close;
  dmDV.qUserSourceSamples.ParamByName('ProjectID').AsString := UserProjectIDstr;
  dmDV.cdsUserSourceSamples.Open;
  dmDV.cdsStratDBUnitIDForDVUnitID.Close;
  dmStrat.cdsThisUnitAge.Close;
  dmDV.cdsMatchingAges.Close;
end;

procedure TISFGrainSources.iwbReturnClick(Sender: TObject);
begin
  dmDV.cdsUserUnitSuiteSamples.Close;
  dmDV.cdsUserSourceSamples.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFGrainSources.iwbUnitsSamplesAddClick(
  Sender: TObject);
var
  tVariableID, tIsotopeSystemID : string;
  tUserID,tUnitIDstr,tStratDBUnitIDstr,tStratDBUnitName,tStratDBUnitRank,
  tSampleNo,
  tStratDBUnitAgeStr,tLongitudeStr,tLatitudeStr,tCountryID : string;
begin
end;

procedure TISFGrainSources.IWAppFormCreate(Sender: TObject);
var
  i, nRec : integer;
  UserProjectIDstr : string;
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  iwbDownloadMatchingData.Visible := false;
  iwbDownloadDetritalSampleLocalities.Visible := false;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := UserSession.UserDisplayName;
    iwbDownloadMatchingData.Visible := UserSession.CanExport;
    iwbDownloadMatchingData.Enabled := UserSession.CanExport;
    iwbDownloadDetritalSampleLocalities.Visible := UserSession.CanExport;
    iwbDownloadDetritalSampleLocalities.Enabled := UserSession.CanExport;
  end;
  UserSession.PageNum := 1;
  UserSession.PageNumTotal := 1;
  if UserSession.LoggedIn then
  begin
    //iwbDownload.Visible := UserSession.CanModifyPlus;
    //iwbDownload.Visible := UserSession.IsDeveloper;
    if (UserSession.ThisProgram = 'StratDB') then
    begin
      TopBar.lblProgTitle.Text := 'Stratigraphic Unit Database';
    end;
    if (UserSession.ThisProgram = 'IGCP509') then
    begin
      TopBar.lblProgTitle.Text := 'IGCP509 Stratigraphic Unit Database';
    end;
    dmDV.cdsUserProjects.Close;
    dmDV.qUserProjects.Close;
    dmDV.qUserProjects.ParamByName('USERID').AsString := UserSession.UserID;
    dmDV.cdsUserProjects.Close;
    dmStrat.qContinents.Close;
    dmStrat.qContinents.SQL.Clear;
    dmStrat.qContinents.SQL.Add('SELECT * FROM CONTINENTS');
    dmStrat.qContinents.SQL.Add('WHERE CONTINENTS.HASDATA='+''''+'Y'+'''');
    iwcbContinents.Checked := true;
    UpdateListBoxValues(iwlContinents,dmStrat.cdsContinents,'Continent','ContinentID',UserSession.ContinentValues);
    dmStrat.qCountries.Close;
    dmStrat.qCountries.SQL.Clear;
    dmStrat.qCountries.SQL.Add('SELECT COUNTRIES.COUNTRYID, COUNTRIES.COUNTRY, ');
    dmStrat.qCountries.SQL.Add('  COUNTRIES.CONTINENTID,');
    dmStrat.qCountries.SQL.Add('  CONTINENTS.CONTINENT, COUNTRIES.COUNTRYHASRECORDS,');
    dmStrat.qCountries.SQL.Add('  COUNTRIES.STARTINGVALUE,COUNTRIES.DEFAULTMAPID');
    dmStrat.qCountries.SQL.Add('from COUNTRIES, CONTINENTS');
    dmStrat.qCountries.SQL.Add('where COUNTRIES.CONTINENTID=CONTINENTS.CONTINENTID');
    dmStrat.qCountries.SQL.Add('and COUNTRIES.COUNTRYHASRECORDS = '+''''+'Y'+'''');
    if (UserSession.IncludeContinentValues and (UserSession.ContinentValues.Count=0)) then
    begin
      UserSession.IncludeContinentValues := false;
    end;
    if (UserSession.IncludeContinentValues) then
    begin
      dmStrat.qCountries.SQL.Add('AND ( COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[0]+'''');
      if (UserSession.ContinentValues.Count >1) then
      begin
        for i := 2 to UserSession.ContinentValues.Count do
        begin
          dmStrat.qCountries.SQL.Add('OR COUNTRIES.CONTINENTID = '+''''+UserSession.ContinentValues.Strings[i-1]+'''');
        end;
      end;
      dmStrat.qCountries.SQL.Add(' ) ');
    end;
    dmStrat.qCountries.SQL.Add('order by COUNTRIES.COUNTRY');
    dmStrat.cdsCountries.Close;
    dmStrat.cdsCountries.Open;
    UpdateListBoxValues(iwlAreas,dmStrat.cdsCountries,'Country','CountryID',UserSession.AreaValues);
    iwcbAreas.Checked := UserSession.IncludeAreaValues;
    iwbFindSources.Enabled := false;
    UpdateComboBoxValue(iwlUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  end;
end;

procedure TISFGrainSources.iwDBgUnitsSamplesColumns0TitleClick(
  Sender: TObject);
begin
  dmDV.cdsUserUnitSuiteSamples.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlUnitsSamplesSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFGrainSources.iwDBgUnitsSamplesColumns6Click(
  ASender: TObject; const AValue: string);
begin
  dmDV.cdsUserUnitSuiteSamples.Locate('SampleNo',AValue,[]);
end;



procedure TISFGrainSources.iwlUserProjectChange(Sender: TObject);
var
  UserProjectIDstr : string;
  iCount : integer;
begin
  iwbFindSources.Enabled := false;
  GetComboBoxValue(iwlUserProject,dmDV.cdsUserProjects,'UserProjectName','UserProjectID',UserProjectIDstr);
  dmDV.cdsUserUnitSuiteSamples.Close;
  dmDV.qUserUnitSuiteSamples.Close;
  dmDV.qUserUnitSuiteSamples.ParamByName('ProjectID').AsString := UserProjectIDstr;
  //dmDV.qUserUnitSuiteSamples.ParamByName('USERID').AsString := UserSession.UserID;
  dmDV.cdsUserUnitSuiteSamples.Close;
  dmDV.cdsUserUnitSuiteSamples.Open;
  iCount := dmDV.cdsUserUnitSuiteSamples.RecordCount;
  if (iCount > 0) then
  begin
    iwbFindSources.Enabled := true;
  end;
  iwbDeleteUserProvenanceData.Enabled := true;
end;

end.
