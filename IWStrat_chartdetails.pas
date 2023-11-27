unit IWStrat_chartdetails;

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
  TISFChartDetails = class(TIWAppForm)
    IWDBEdit1: TIWDBEdit;
    IWLabel1: TIWLabel;
    iwbReturn: TIWButton;
    IWLabel3: TIWLabel;
    iwbDetailsEdit: TIWButton;
    IWDBEdit3: TIWDBEdit;
    iwbReturn2: TIWButton;
    iwbDetailsEdit2: TIWButton;
    IWLabel66: TIWLabel;
    IWLabel67: TIWLabel;
    rectLeft: TIWRectangle;
    IWLabel5: TIWLabel;
    IWLabel9: TIWLabel;
    IWLabel12: TIWLabel;
    iwDBmDescription: TIWDBMemo;
    iwDBgDomain: TIWDBGrid;
    iwrLeftRegion: TIWRegion;
    iwrTopButtons: TIWRegion;
    iwrUnitDetails: TIWRegion;
    iwrDomains: TIWRegion;
    iwlSortedBy: TIWLabel;
    iwbApplyUpdates: TIWButton;
    iwrClientAll: TIWRegion;
    iwrBottomButtons: TIWRegion;
    iwDBnDomains: TIWDBNavigator;
    iwbCancel: TIWButton;
    IWLabel2: TIWLabel;
    IWDBEdit2: TIWDBEdit;
    iwbAddDomain: TIWButton;
    iwbDeleteDomain: TIWButton;
    IWLabel4: TIWLabel;
    IWDBEdit4: TIWDBEdit;
    iwrCopyRight: TIWRegion;
    IWLabel10: TIWLabel;
    iwrTimeSpace: TIWRegion;
    IWLabel6: TIWLabel;
    iwbTimeSpaceUnits: TIWButton;
    iwbTimeSpaceMetamorphism: TIWButton;
    iwbTimeSpaceDeformation: TIWButton;
    iwbTimeSpaceDomainHeadings: TIWButton;
    iweChartMinAge: TIWEdit;
    IWLabel7: TIWLabel;
    iweChartMaxAge: TIWEdit;
    IWLabel8: TIWLabel;
    iwbTimeSpaceUnitFeatures: TIWButton;
    iwbTimeSpaceEconomic: TIWButton;
    iwbTimeSpaceDomainColumns: TIWButton;
    iwbGeochronology: TIWButton;
    iwbTimeSpaceLIP: TIWButton;
    iwrDomainContentLists: TIWRegion;
    IWLabel11: TIWLabel;
    iwbDownloadUnits: TIWButton;
    iwbDownloadLIPs: TIWButton;
    IWLabel13: TIWLabel;
    iwbTimeSpaceDomainBoxes: TIWButton;
    iwbTimeSpaceDomainBoxes2: TIWButton;
    IWLabel14: TIWLabel;
    IWDBEdit5: TIWDBEdit;
    IWLabel15: TIWLabel;
    IWDBEdit6: TIWDBEdit;
    iwbLIPDVCurves: TIWButton;
    iwrUsers: TIWRegion;
    IWLabel16: TIWLabel;
    IWDBGrid1: TIWDBGrid;
    IWLabel17: TIWLabel;
    iwDBnUsers: TIWDBNavigator;
    iwbAddUser: TIWButton;
    iwbDeleteUser: TIWButton;
    IWLabel18: TIWLabel;
    IWDBEdit7: TIWDBEdit;
    iwbLIPDVCurvesExportUPb: TIWButton;
    iwbLIPDVCurvesExportArAr: TIWButton;
    iwbLIPDVCurvesExportOther: TIWButton;
    iwbLIPDVCurvesExportnd: TIWButton;
    iwbTimeSpaceDomainHeadingsLIP: TIWButton;
    IWLabel19: TIWLabel;
    IWLabel20: TIWLabel;
    iwbDomainDVCurves: TIWButton;
    iwbDomainDVCurvesExportCryst: TIWButton;
    iwbDomainDVCurvesExportCool: TIWButton;
    iwbDomainDVCurvesExportDetri: TIWButton;
    iwbDomainDVCurvesExportMetpR: TIWButton;
    iwbDomainDVCurvesExportCrsRs: TIWButton;
    iwrgOrAnd: TIWRadioGroup;
    IWLabel21: TIWLabel;
    iwbDownloadLIPUnits: TIWButton;
    IWLabel22: TIWLabel;
    iwbMapUnits: TIWButton;
    iwbTimeSpaceUnconformities: TIWButton;
    iwbMapLIPs: TIWButton;
    iwbDomainDVCurvesExportCombined: TIWButton;
    IWLabel23: TIWLabel;
    IWLabel24: TIWLabel;
    iweDomOrderGE: TIWEdit;
    iweDomOrderLT: TIWEdit;
    IWLabel25: TIWLabel;
    IWLabel26: TIWLabel;
    iwbAgeLines: TIWButton;
    IWLabel27: TIWLabel;
    iweChartAgeLineIncrement: TIWEdit;
    IWLabel28: TIWLabel;
    iweChartPrefLevel: TIWEdit;
    TopBar: TISFTopBarStrat;
    iwbGeochronologyLIP: TIWButton;
    IWLabel29: TIWLabel;
    procedure IWAppFormRender(Sender: TObject);
    procedure iwbReturnClick(Sender: TObject);
    procedure iwbDetailsEditClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure iwDBgResultsColumns0TitleClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelClick(Sender: TObject);
    procedure iwbAddDomainClick(Sender: TObject);
    procedure iwbDeleteDomainClick(Sender: TObject);
    procedure iwbTimeSpaceUnitsClick(Sender: TObject);
    procedure iwDBgDomainColumns5Click(ASender: TObject; const AValue: string);
    procedure iwbTimeSpaceMetamorphismClick(Sender: TObject);
    procedure iwbTimeSpaceDeformationClick(Sender: TObject);
    procedure iwbTimeSpaceDomainHeadingsClick(Sender: TObject);
    procedure iwbDownloadUnitsClick(Sender: TObject);
    procedure iwbTimeSpaceUnitFeaturesClick(Sender: TObject);
    procedure iwbTimeSpaceEconomicClick(Sender: TObject);
    procedure iwbTimeSpaceDomainColumnsClick(Sender: TObject);
    procedure iwbGeochronologyStratClick(Sender: TObject);
    procedure iwbTimeSpaceLIPClick(Sender: TObject);
    procedure iwbDownloadLIPsClick(Sender: TObject);
    procedure iwbTimeSpaceDomainBoxesClick(Sender: TObject);
    procedure iwbDVCurvesClick(Sender: TObject);
    procedure iwbAddUserClick(Sender: TObject);
    procedure iwbDeleteUserClick(Sender: TObject);
    procedure iwbLIPDVCurvesExportUPbClick(Sender: TObject);
    procedure iwbLIPDVCurvesExportArArClick(Sender: TObject);
    procedure iwbLIPDVCurvesExportOtherClick(Sender: TObject);
    procedure iwbLIPDVCurvesExportndClick(Sender: TObject);
    procedure iwbDomainDVCurvesExportCrystClick(Sender: TObject);
    procedure iwbDomainDVCurvesExportCoolClick(Sender: TObject);
    procedure iwbDomainDVCurvesExportDetriClick(Sender: TObject);
    procedure iwbDomainDVCurvesExportMetpRClick(Sender: TObject);
    procedure iwbDomainDVCurvesExportCrsRsClick(Sender: TObject);
    procedure iwbDownloadLIPUnitsClick(Sender: TObject);
    procedure iwbMapUnitsClick(Sender: TObject);
    procedure iwbTimeSpaceUnconformitiesClick(Sender: TObject);
    procedure iwbMapLIPsClick(Sender: TObject);
    procedure iwbDomainDVCurvesExportCombinedClick(Sender: TObject);
    procedure iwbAgeLinesClick(Sender: TObject);
    procedure iwbGeochronologyLIPClick(Sender: TObject);
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

procedure TISFChartDetails.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwbDetailsEdit.Visible := (dmStratC.cdsChart.State in [dsBrowse]);
  iwbReturn.Visible := (dmStratC.cdsChart.State in [dsBrowse]);
  iwbApplyUpdates.Visible := (dmStratC.cdsChart.State in [dsEdit,dsInsert]);
  iwbCancel.Visible := (dmStratC.cdsChart.State in [dsEdit,dsInsert]);
  iwbAddDomain.Visible := (dmStratC.cdsChart.State in [dsBrowse]);
  iwbDeleteDomain.Visible := (dmStratC.cdsChart.State in [dsBrowse]);
  iwrUsers.Visible := (dmStratC.cdsChartOWNERID.AsString=UserSession.UserID);
  iwbAddUser.Visible := (dmStratC.cdsChartOWNERID.AsString=UserSession.UserID);
  iwbDeleteUser.Visible := (dmStratC.cdsChartOWNERID.AsString=UserSession.UserID);
end;

procedure TISFChartDetails.iwbReturnClick(Sender: TObject);
begin
  dmStratC.cdsChart.Close;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFChartDetails.iwbTimeSpaceDeformationClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
begin
  dmStratC.qTimeSpaceDeformation.Close;
  dmStratC.qTimeSpaceDeformation.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceDeformation.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qTimeSpaceDeformation.ParamByName('ChartMinAge').AsString := iweChartMinAge.Text;
  dmStratC.qTimeSpaceDeformation.ParamByName('ChartMaxAge').AsString := iweChartMaxAge.Text;
  dmStratC.cdsTimeSpaceDeformation.Close;
  dmStratC.cdsTimeSpaceDeformation.Open;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceDeformation.SQL.Text);
  end;
  //dmStratC.FlexCelReportTimeSpaceDeformation.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceDeformation.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceDeformation.xlsx';
  frFileNameStr := 'TimeSpace_Deformation.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceDeformation',dmStratC.cdsTimeSpaceDeformation);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceDeformation.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbTimeSpaceDomainBoxesClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
begin
  dmStratC.qTimeSpaceDomainBoxes.Close;
  dmStratC.qTimeSpaceDomainBoxes.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.cdsTimeSpaceDomainBoxes.Close;
  dmStratC.cdsTimeSpaceDomainBoxes.Open;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceDomainBoxes.SQL.Text);
  end;
  //dmStratC.FlexCelReportTimeSpaceDomainBoxes.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceDomainBoxes.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceDomainBoxes.xlsx';
  frFileNameStr := 'TimeSpace_DomainBoxes.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceDomainBoxes',dmStratC.cdsTimeSpaceDomainBoxes);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceDomainBoxes.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbTimeSpaceDomainColumnsClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
begin
  dmStratC.qTimeSpaceDomainColumns.Close;
  dmStratC.qTimeSpaceDomainColumns.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.cdsTimeSpaceDomainColumns.Close;
  dmStratC.cdsTimeSpaceDomainColumns.Open;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceDomainColumns.SQL.Text);
  end;
  //dmStratC.FlexCelReportTimeSpaceDomainColumns.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceDomainColumns.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceDomainColumns.xlsx';
  frFileNameStr := 'TimeSpace_DomainColumns.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceDomainColumns',dmStratC.cdsTimeSpaceDomainColumns);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceDomainColumns.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbTimeSpaceDomainHeadingsClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
begin
  dmStratC.qTimeSpaceDomainHeadings.Close;
  dmStratC.qTimeSpaceDomainHeadings.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.cdsTimeSpaceDomainHeadings.Close;
  dmStratC.cdsTimeSpaceDomainHeadings.Open;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceDomainHeadings.SQL.Text);
  end;
  //dmStratC.FlexCelReportTimeSpaceDomainHeadings.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceDomainHeadings.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceDomainHeadings.xlsx';
  frFileNameStr := 'TimeSpace_DomainHeadings.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceDomainHeadings',dmStratC.cdsTimeSpaceDomainHeadings);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceDomainHeadings.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbTimeSpaceEconomicClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
begin
  dmStratC.qTimeSpaceDeposit.Close;
  dmStratC.qTimeSpaceDeposit.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceDeposit.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qTimeSpaceDeposit.ParamByName('ChartMinAge').AsString := iweChartMinAge.Text;
  dmStratC.qTimeSpaceDeposit.ParamByName('ChartMaxAge').AsString := iweChartMaxAge.Text;
  dmStratC.cdsTimeSpaceDeposit.Close;
  dmStratC.cdsTimeSpaceDeposit.Open;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceDeposit.SQL.Text);
  end;
  //dmStratC.FlexCelReportTimeSpaceDeposit.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceDeposits.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceDeposits.xlsx';
  frFileNameStr := 'TimeSpace_Economic.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceDeposit',dmStratC.cdsTimeSpaceDeposit);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceDeposit.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbTimeSpaceLIPClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
begin
  dmStratC.qTimeSpaceLIP.Close;
  dmStratC.qTimeSpaceLIP.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceLIP.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qTimeSpaceLIP.ParamByName('ChartMinAge').AsString := iweChartMinAge.Text;
  dmStratC.qTimeSpaceLIP.ParamByName('ChartMaxAge').AsString := iweChartMaxAge.Text;
  dmStratC.cdsTimeSpaceLIP.Close;
  dmStratC.cdsTimeSpaceLIP.Open;

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceLIP.SQL.Text);
  end;

  //dmStratC.FlexCelReportTimeSpaceLIP.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxLIPTimeSpaceLIP.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxLIPTimeSpaceLIP.xlsx';
  frFileNameStr := 'TimeSpace_LIP.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceLIP',dmStratC.cdsTimeSpaceLIP);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceLIP.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbTimeSpaceMetamorphismClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
begin
  dmStratC.qTimeSpaceMetamorphism.Close;
  dmStratC.qTimeSpaceMetamorphism.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceMetamorphism.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qTimeSpaceMetamorphism.ParamByName('ChartMinAge').AsString := iweChartMinAge.Text;
  dmStratC.qTimeSpaceMetamorphism.ParamByName('ChartMaxAge').AsString := iweChartMaxAge.Text;
  dmStratC.cdsTimeSpaceMetamorphism.Close;
  dmStratC.cdsTimeSpaceMetamorphism.Open;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceMetamorphism.SQL.Text);
  end;
  //dmStratC.FlexCelReportTimeSpaceMetamorphism.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceMetamorphism.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceMetamorphism.xlsx';
  frFileNameStr := 'TimeSpace_Metamorphism.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceMetamorphism',dmStratC.cdsTimeSpaceMetamorphism);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceMetamorphism.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbTimeSpaceUnconformitiesClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
begin
  dmStratC.qUnconformities.Close;
  dmStratC.qUnconformities.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qUnconformities.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qUnconformities.ParamByName('ChartMinAge').AsString := iweChartMinAge.Text;
  dmStratC.qUnconformities.ParamByName('ChartMaxAge').AsString := iweChartMaxAge.Text;
  dmStratC.cdsUnconformities.Close;
  dmStratC.cdsUnconformities.Open;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qUnconformities.SQL.Text);
  end;
  //dmStratC.FlexCelReportChartUnconformities.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceUnconformities.xls';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceUnconformities.xlsx';
  frFileNameStr := 'TimeSpace_Unconformities.xls';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsUnconformities',dmStratC.cdsUnconformities);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsUnconformities.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbTimeSpaceUnitFeaturesClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
begin
  dmStratC.qTimeSpaceFeature.Close;
  dmStratC.qTimeSpaceFeature.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceFeature.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qTimeSpaceFeature.ParamByName('ChartMinAge').AsString := iweChartMinAge.Text;
  dmStratC.qTimeSpaceFeature.ParamByName('ChartMaxAge').AsString := iweChartMaxAge.Text;
  dmStratC.cdsTimeSpaceFeature.Close;
  dmStratC.cdsTimeSpaceFeature.Open;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceFeature.SQL.Text);
  end;
  //dmStratC.FlexCelReportTimeSpaceFeature.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceFeatures.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceFeatures.xlsx';
  frFileNameStr := 'TimeSpace_Features.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceFeature',dmStratC.cdsTimeSpaceFeature);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceFeature.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbTimeSpaceUnitsClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
begin
  dmStratC.qTimeSpace.Close;
  dmStratC.qTimeSpace.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpace.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qTimeSpace.ParamByName('ChartMinAge').AsString := iweChartMinAge.Text;
  dmStratC.qTimeSpace.ParamByName('ChartMaxAge').AsString := iweChartMaxAge.Text;
  dmStratC.cdsTimeSpace.Close;
  dmStratC.cdsTimeSpace.Open;

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpace.SQL.Text);
  end;

  //dmStratC.FlexCelReportTimeSpace.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpace.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpace.xlsx';
  frFileNameStr := 'TimeSpace_Units.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpace',dmStratC.cdsTimeSpace);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpace.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbGeochronologyLIPClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
  tmpDomainOrder, tmpDomainID, tmpDomainXMin, tmpDomainXMax : string;
begin
  //check whether user exists in DateView
  //if not, add user
  //delete records for user in UserDomains
  //open ChartDomain
  //scroll through ChartDomain and insert domain details to UserDomains
  //close UserDomains
  //run query to extract domain geochronology
  dmDV.qDVUser.Close;
  dmDV.qDVUser.ParamByName('UserID').AsString := UserSession.UserID;
  dmDV.cdsDVUser.Close;
  dmDV.cdsDVUser.Open;
  if (dmDV.cdsDVUser.RecordCount=0) then
  begin
    dmDV.AddUserToDV(UserSession.UserID);
  end;
  dmDV.cdsDVUser.Close;
  try
    dmDV.DeleteUserDomains(UserSession.UserID);
  except
  end;
  dmStratC.cdsChartDomain.First;
  repeat
    tmpDomainOrder := dmStratC.cdsChartDomainDOMAINORDER.AsString;
    tmpDomainID :=  dmStratC.cdsChartDomainDOMAINID.AsString;
    tmpDomainXMin := IntToStr(dmStratC.cdsChartDomainDOMAINXMIN.AsInteger+dmStratC.cdsChartCHARTOFFSET_MM.AsInteger);
    tmpDomainXMax := IntToStr(dmStratC.cdsChartDomainDOMAINXMAX.AsInteger+dmStratC.cdsChartCHARTOFFSET_MM.AsInteger);
    //WebApplication.ShowMessage(UserSession.UserID+tmpDomainOrder+tmpDomainID+tmpDomainXMin+tmpDomainXMax);
    dmDV.AddUserDomainsToDV(UserSession.UserID,tmpDomainOrder,tmpDomainID,tmpDomainXMin,tmpDomainXMax);
    dmStratC.cdsChartDomain.Next;
  until dmStratC.cdsChartDomain.Eof;
  dmDV.qDVLIPDomainDatesProvinces.Close;
  dmDV.qDVLIPDomainDatesProvinces.ParamByName('UserID').AsString := UserSession.UserID;
  dmDV.qDVLIPDomainDatesProvinces.ParamByName('ChartMinAge').AsString := iweChartMinAge.Text;
  dmDV.qDVLIPDomainDatesProvinces.ParamByName('ChartMaxAge').AsString := iweChartMaxAge.Text;
  dmDV.qDVLIPDomainDatesProvinces.ParamByName('PrefLevel').AsString := iweChartPrefLevel.Text;
  dmDV.cdsDVLIPDomainDatesProvinces.Close;
  dmDV.cdsDVLIPDomainDatesProvinces.Open;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmDV.qDVLIPDomainDatesProvinces.SQL.Text);
  end;
  //dmDV.FlexCelReportDVLIPDomainDatesProvinces.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceLIPDatesProvinces.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceLIPDatesProvinces.xlsx';
  frFileNameStr := 'TimeSpace_DateViewLIPDomainDatesProvinces.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsDVLIPDomainDatesProvinces',dmDV.cdsDVLIPDomainDatesProvinces);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmDV.cdsDVLIPDomainDatesProvinces.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbGeochronologyStratClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
  tmpDomainOrder, tmpDomainID, tmpDomainXMin, tmpDomainXMax : string;
begin
  //check whether user exists in DateView
  //if not, add user
  //delete records for user in UserDomains
  //open ChartDomain
  //scroll through ChartDomain and insert domain details to UserDomains
  //close UserDomains
  //run query to extract domain geochronology
  dmDV.qDVUser.Close;
  dmDV.qDVUser.ParamByName('UserID').AsString := UserSession.UserID;
  dmDV.cdsDVUser.Close;
  dmDV.cdsDVUser.Open;
  if (dmDV.cdsDVUser.RecordCount=0) then
  begin
    dmDV.AddUserToDV(UserSession.UserID);
  end;
  dmDV.cdsDVUser.Close;
  try
    dmDV.DeleteUserDomains(UserSession.UserID);
  except
  end;
  dmStratC.cdsChartDomain.First;
  repeat
    tmpDomainOrder := dmStratC.cdsChartDomainDOMAINORDER.AsString;
    tmpDomainID :=  dmStratC.cdsChartDomainDOMAINID.AsString;
    tmpDomainXMin := IntToStr(dmStratC.cdsChartDomainDOMAINXMIN.AsInteger+dmStratC.cdsChartCHARTOFFSET_MM.AsInteger);
    tmpDomainXMax := IntToStr(dmStratC.cdsChartDomainDOMAINXMAX.AsInteger+dmStratC.cdsChartCHARTOFFSET_MM.AsInteger);
    //WebApplication.ShowMessage(UserSession.UserID+tmpDomainOrder+tmpDomainID+tmpDomainXMin+tmpDomainXMax);
    dmDV.AddUserDomainsToDV(UserSession.UserID,tmpDomainOrder,tmpDomainID,tmpDomainXMin,tmpDomainXMax);
    dmStratC.cdsChartDomain.Next;
  until dmStratC.cdsChartDomain.Eof;
  dmDV.qDVDomainDatesProvinces.Close;
  dmDV.qDVDomainDatesProvinces.ParamByName('UserID').AsString := UserSession.UserID;
  dmDV.qDVDomainDatesProvinces.ParamByName('ChartMinAge').AsString := iweChartMinAge.Text;
  dmDV.qDVDomainDatesProvinces.ParamByName('ChartMaxAge').AsString := iweChartMaxAge.Text;
  dmDV.qDVDomainDatesProvinces.ParamByName('PrefLevel').AsString := iweChartPrefLevel.Text;
  dmDV.cdsDVDomainDatesProvinces.Close;
  dmDV.cdsDVDomainDatesProvinces.Open;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmDV.qDVDomainDatesProvinces.SQL.Text);
  end;
  //dmDV.FlexCelReportDVDomainDatesProvinces.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceDatesProvinces.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509TimeSpaceDatesProvinces.xlsx';
  frFileNameStr := 'TimeSpace_DateViewDomainDatesProvinces.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsDVDomainDatesProvinces',dmDV.cdsDVDomainDatesProvinces);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmDV.cdsDVDomainDatesProvinces.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbCancelClick(Sender: TObject);
begin
  dmStratC.cdsChart.CancelUpdates;
end;

procedure TISFChartDetails.iwbDeleteDomainClick(Sender: TObject);
begin
  try
    dmStratC.cdsChartDomain.Delete;
    dmStratC.cdsChartDomain.ApplyUpdates(0);
    dmStratC.cdsChart.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to delete linked Domain record.',smAlert);
  end;
end;

procedure TISFChartDetails.iwbDeleteUserClick(Sender: TObject);
begin
    WebApplication.ShowMessage('Not yet implemented');
end;

procedure TISFChartDetails.iwbDetailsEditClick(Sender: TObject);
begin
  {
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Hide;
  TISFDetailsEdit.Create(WebApplication).Show
  }
  dmStratC.cdsChart.Edit;
end;

procedure TISFChartDetails.iwbDomainDVCurvesExportCrsRsClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmStratC.qTimeSpaceDomainCurves.Close;
  dmStratC.qTimeSpaceDomainCurves.SQL.Strings[13] := 'AND USERDVPDF.CURVEORDER=5';
  dmStratC.qTimeSpaceDomainCurves.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderGE').AsString := iweDomOrderGE.Text;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderLT').AsString := iweDomOrderLT.Text;
  dmStratC.cdsTimeSpaceDomainCurves.Close;
  dmStratC.cdsTimeSpaceDomainCurves.Open;

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceDomainCurves.SQL.Text);
  end;

  //dmStratC.FlexCelReportTimeSpaceDomainCurves.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xlsx';
  frFileNameStr := 'TimeSpace_DomainCurves_CrsRs.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceDomainCurves',dmStratC.cdsTimeSpaceDomainCurves);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceDomainCurves.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbDomainDVCurvesExportCrystClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmStratC.qTimeSpaceDomainCurves.Close;
  dmStratC.qTimeSpaceDomainCurves.SQL.Strings[13] := 'AND USERDVPDF.CURVEORDER=1';
  dmStratC.qTimeSpaceDomainCurves.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderGE').AsString := iweDomOrderGE.Text;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderLT').AsString := iweDomOrderLT.Text;
  dmStratC.cdsTimeSpaceDomainCurves.Close;
  dmStratC.cdsTimeSpaceDomainCurves.Open;

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceDomainCurves.SQL.Text);
  end;

  //dmStratC.FlexCelReportTimeSpaceDomainCurves.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xls';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xlsx';
  frFileNameStr := 'TimeSpace_DomainCurves_Cryst.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceDomainCurves',dmStratC.cdsTimeSpaceDomainCurves);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceDomainCurves.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbDomainDVCurvesExportCombinedClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmStratC.qTimeSpaceDomainCurves.Close;
  dmStratC.qTimeSpaceDomainCurves.SQL.Strings[13] := 'AND USERDVPDF.CURVEORDER=6';
  dmStratC.qTimeSpaceDomainCurves.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderGE').AsString := iweDomOrderGE.Text;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderLT').AsString := iweDomOrderLT.Text;
  dmStratC.cdsTimeSpaceDomainCurves.Close;
  dmStratC.cdsTimeSpaceDomainCurves.Open;

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceDomainCurves.SQL.Text);
  end;

  //dmStratC.FlexCelReportTimeSpaceDomainCurves.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xlsx';
  frFileNameStr := 'TimeSpace_DomainCurves_Combined.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceDomainCurves',dmStratC.cdsTimeSpaceDomainCurves);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceDomainCurves.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbDomainDVCurvesExportCoolClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmStratC.qTimeSpaceDomainCurves.Close;
  dmStratC.qTimeSpaceDomainCurves.SQL.Strings[13] := 'AND USERDVPDF.CURVEORDER=2';
  dmStratC.qTimeSpaceDomainCurves.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderGE').AsString := iweDomOrderGE.Text;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderLT').AsString := iweDomOrderLT.Text;
  dmStratC.cdsTimeSpaceDomainCurves.Close;
  dmStratC.cdsTimeSpaceDomainCurves.Open;

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceDomainCurves.SQL.Text);
  end;

  //dmStratC.FlexCelReportTimeSpaceDomainCurves.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xls';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xlsx';
  frFileNameStr := 'TimeSpace_DomainCurves_Cool.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceDomainCurves',dmStratC.cdsTimeSpaceDomainCurves);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceDomainCurves.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbDomainDVCurvesExportDetriClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmStratC.qTimeSpaceDomainCurves.Close;
  dmStratC.qTimeSpaceDomainCurves.SQL.Strings[13] := 'AND USERDVPDF.CURVEORDER=3';
  dmStratC.qTimeSpaceDomainCurves.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderGE').AsString := iweDomOrderGE.Text;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderLT').AsString := iweDomOrderLT.Text;
  dmStratC.cdsTimeSpaceDomainCurves.Close;
  dmStratC.cdsTimeSpaceDomainCurves.Open;

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceDomainCurves.SQL.Text);
  end;

  //dmStratC.FlexCelReportTimeSpaceDomainCurves.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xls';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xlsx';
  frFileNameStr := 'TimeSpace_DomainCurves_Detri.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceDomainCurves',dmStratC.cdsTimeSpaceDomainCurves);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceDomainCurves.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbDomainDVCurvesExportMetpRClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmStratC.qTimeSpaceDomainCurves.Close;
  dmStratC.qTimeSpaceDomainCurves.SQL.Strings[13] := 'AND USERDVPDF.CURVEORDER=4';
  dmStratC.qTimeSpaceDomainCurves.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderGE').AsString := iweDomOrderGE.Text;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderLT').AsString := iweDomOrderLT.Text;
  dmStratC.cdsTimeSpaceDomainCurves.Close;
  dmStratC.cdsTimeSpaceDomainCurves.Open;

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceDomainCurves.SQL.Text);
  end;

  //dmStratC.FlexCelReportTimeSpaceDomainCurves.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xlsx';
  frFileNameStr := 'TimeSpace_DomainCurves_MetpR.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceDomainCurves',dmStratC.cdsTimeSpaceDomainCurves);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceDomainCurves.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbDownloadLIPsClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
begin
  try
    dmStratC.qChartDomainDomainsLIP.Close;
    dmStratC.qChartDomainLIPs.Close;
    dmStratC.qChartDomainDomainsLIP.ParamByName('ChartID').AsString := dmStratC.cdsChartCHARTID.AsString;
    dmStratC.qChartDomainLIPs.ParamByName('UserID').AsString := UserSession.UserID;
    dmStratC.qChartDomainLIPs.ParamByName('ChartMinAge').AsString := iweChartMinAge.Text;
    dmStratC.qChartDomainLIPs.ParamByName('ChartMaxAge').AsString := iweChartMaxAge.Text;
    dmStratC.cdsChartDomainDomainsLIP.Close;
    dmStratC.cdsChartDomainDomainsLIP.Open;
    dmStratC.cdsChartDomainLIPs.Close;
    dmStratC.cdsChartDomainLIPs.Open;
    dmStratC.cdsChartDomainDomainsLIP.First;
  except
    WebApplication.ShowMessage('Not able to open ChartDomainLIPs query');
  end;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qChartDomainDomainsLIP.SQL.Text);
    //dmUser.SetDeveloperData(dmStratC.qChartDomainLIPs.SQL.Text);
  end;
  //dmStratC.FlexCelReportChartDomainLIPs.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainLIPs.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainLIPs.xlsx';
  frFileNameStr := 'ChartDomainLIPs_listing.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsChartDomainDomainsLIP',dmStratC.cdsChartDomainDomainsLIP);
    fr.AddTable('cdsChartDomainLIPs',dmStratC.cdsChartDomainLIPs);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsChartDomainDomainsLIP.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbDownloadLIPUnitsClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
begin
  try
    dmStratC.qChartDomainDomainsLIPUnits.Close;
    dmStratC.qChartDomainLIPsUnits.Close;
    dmStratC.qChartDomainDomainsLIPUnits.ParamByName('ChartID').AsString := dmStratC.cdsChartCHARTID.AsString;
    dmStratC.qChartDomainLIPsUnits.ParamByName('UserID').AsString := UserSession.UserID;
    dmStratC.qChartDomainLIPsUnits.ParamByName('ChartMinAge').AsString := iweChartMinAge.Text;
    dmStratC.qChartDomainLIPsUnits.ParamByName('ChartMaxAge').AsString := iweChartMaxAge.Text;
    dmStratC.qChartLIPUnits.ParamByName('UserID').AsString := UserSession.UserID;
    dmStratC.qChartLIPUnits.ParamByName('ChartMinAge').AsString := iweChartMinAge.Text;
    dmStratC.qChartLIPUnits.ParamByName('ChartMaxAge').AsString := iweChartMaxAge.Text;
    dmStratC.cdsChartDomainDomainsLIPUnits.Close;
    dmStratC.cdsChartDomainDomainsLIPUnits.Open;
    dmStratC.cdsChartDomainLIPsUnits.Close;
    dmStratC.cdsChartDomainLIPsUnits.Open;
    dmStratC.cdsChartLIPUnits.Close;
    dmStratC.cdsChartLIPUnits.Open;
    dmStratC.cdsChartDomainDomainsLIPUnits.First;
  except
    WebApplication.ShowMessage('Not able to open ChartDomainLIPs query');
  end;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qChartDomainDomainsLIPUnits.SQL.Text);
    //dmUser.SetDeveloperData(dmStratC.qChartDomainLIPsUnits.SQL.Text);
    //dmUser.SetDeveloperData(dmStratC.qChartLIPUnits.SQL.Text);
  end;
  //dmStratC.FlexCelReportChartDomainLIPs.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainLIPUnits.xls';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainLIPUnits.xlsx';
  frFileNameStr := 'ChartDomainLIPUnits_listing.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsChartDomainDomainsLIPUnits',dmStratC.cdsChartDomainDomainsLIPUnits);
    fr.AddTable('cdsChartDomainLIPsUnits',dmStratC.cdsChartDomainLIPsUnits);
    fr.AddTable('cdsChartLIPUnits',dmStratC.cdsChartLIPUnits);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsChartDomainDomainsLIP.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbDownloadUnitsClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
begin
  try
    dmStratC.qChartDomainDomains.Close;
    dmStratC.qChartDomainUnits.Close;
    dmStratC.qChartDomainDomains.ParamByName('ChartID').AsString := dmStratC.cdsChartCHARTID.AsString;
    dmStratC.qChartDomainUnits.ParamByName('UserID').AsString := UserSession.UserID;
    dmStratC.qChartDomainUnits.ParamByName('ChartID').AsString := dmStratC.cdsChartCHARTID.AsString;
    dmStratC.qChartDomainUnits.ParamByName('ChartMinAge').AsString := iweChartMinAge.Text;
    dmStratC.qChartDomainUnits.ParamByName('ChartMaxAge').AsString := iweChartMaxAge.Text;
    dmStratC.cdsChartDomainDomains.Close;
    dmStratC.cdsChartDomainDomains.Open;
    dmStratC.cdsChartDomainDomains.First;
  except
    WebApplication.ShowMessage('Not able to open ChartDomainUnits query');
  end;
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qChartDomainUnits.SQL.Text);
  end;
  //dmStratC.FlexCelReportChartDomainUnits.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainUnits.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainUnits.xlsx';
  frFileNameStr := 'ChartDomainUnits_listing.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsChartDomainDomains',dmStratC.cdsChartDomainDomains);
    fr.AddTable('cdsChartDomainUnits',dmStratC.cdsChartDomainUnits);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsChartDomainDomains.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbDVCurvesClick(Sender: TObject);
var
  i, k, l, n, iCode : integer;
  tmpDomainOrder, tmpDomainID,
  tmpCurveOrder, tmpPdfOrder,
  tmpUserID, tmpAge, tmpPdfValue : string;
  FromDate, ToDate, Age : double;
  MinPlotAge, MaxPlotAge : double;
  PDFArray : array[1..2500] of double;
  MinimumUncertainty : double;
  tempmax : array[1..MaxSeries] of double;
  tempmaxall : double;
  NPts : array[1..MaxSeries] of integer;
  Spectrum2d : array[0..Steps,0..MaxSeries] of double;
  tx, tx1, X1, tempGauss : double;
  tmpMaxSeries : integer;
  MemStream: TMemoryStream;
  tmpStr : string;
  tmpStrIsoSys, tmpStrApproach : string;
  tmpChoice : integer;
  IncludeForAll : boolean;
  Hour,Min,Sec,MSec : Word;
  StartTime :TTime;
  EndTime : TTime;
  Difference : TTime;
  tmpCount : integer;
begin
  tmpMaxSeries := MaxSeries;
  MinimumUncertainty := 5.0;
  iCode := 0;
  if (Sender = iwbLIPDVCurves) then
  begin
    tmpMaxSeries := MaxSeries-1;
  end;

  //Val(UserSession.MinimumDateUncertainty,MinimumUncertainty,iCode);
  if (iCode = 0) then MinimumUncertainty := MinimumUncertainty/1.96
                 else MinimumUncertainty := 2.0/1.96;
  Val(iweChartMinage.Text,FromDate,iCode);
  if (iCode <> 0) then FromDate := 0.0;
  Val(iweChartMaxage.Text,ToDate,iCode);
  if (iCode <> 0) then ToDate := 4000.0;
  tmpUserID := UserSession.UserID;
  //empty pdf table for user
  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData('Delete UserDV Curves');
    //dmUser.SetDeveloperData(dmStratC.qDeleteUserDVCurves.SQL.Text);
  end;
  StartTime := dmUser.GetUTCDateTime;
  dmStratC.qDeleteUserDVCurves.ParamByName('USERID').AsString := tmpUserID;
  dmStratC.qDeleteUserDVCurves.ExecSQL;
  EndTime := dmUser.GetUTCDateTime;
  Difference := EndTime - StartTime;
  DecodeTime(Difference,Hour,Min,Sec,MSec);
  //dmUser.SetDeveloperData('Time to delete = '+IntToStr(Hour)+' : '+IntToStr(Min)+' : '+IntToStr(Sec)+' : '+IntToStr(MSec));

  //get domain order
  dmStratC.qUserChartDomain.Close;
  //if UserSession.IsDeveloper then
  //begin
  //  dmUser.SetDeveloperData(dmStratC.qUserChartDomain.SQL.Text);
  //end;
  StartTime := dmUser.GetUTCDateTime;
  dmStratC.qUserChartDomain.ParamByName('ChartID').AsInteger := dmStratC.cdsChartCHARTID.AsInteger;
  dmStratC.cdsUserChartDomain.Close;
  dmStratC.cdsUserChartDomain.Open;
  EndTime := dmUser.GetUTCDateTime;
  Difference := EndTime - StartTime;
  DecodeTime(Difference,Hour,Min,Sec,MSec);
  //dmUser.SetDeveloperData('Time to open UserChartDomain = '+IntToStr(Hour)+' : '+IntToStr(Min)+' : '+IntToStr(Sec)+' : '+IntToStr(MSec));
  //set array values to zero
  for i := 0 to tmpMaxSeries do
  begin
    for k := 0 to Steps do
    begin
      Spectrum2d[k,i] := 0.0;
    end;
  end;
  //set ages in array cells
  for k := 0 to Steps do
  begin
    Spectrum2d[k,0] := FromDate + 1.0*k*(ToDate-FromDate)/Steps;
  end;

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData('Before define QueryDV');
  end;
  if (Sender = iwbLIPDVCurves) then
  begin
    UserSession.UnitSender := usChartLIPs;
    dmDV.DefineDVPdfQuery(dmStratC.cdsUserChartDomainLIPLIPID.AsInteger);
  end;
  if (Sender = iwbDomainDVCurves) then
  begin
    UserSession.UnitSender := usChartDomains;
    dmDV.DefineDVPdfQuery(dmStratC.cdsUserChartDomainDOMAINID.AsInteger);
  end;
  //dmDV.QueryDV.PrepareStatement;

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData('After define QueryDV');
  end;
  //if UserSession.IsDeveloper then
  //begin
  //  dmUser.SetDeveloperData(dmDV.qDVpdf.SQL.Text);
  //end;

  if (dmStratC.cdsUserChartDomain.RecordCount > 0) then
  begin
    repeat  //until dmStratC.cdsUserChartDomain.Eof;
      //cycle through all the domains
      //set array values to zero
      for i := 1 to tmpMaxSeries do
      begin
        for k := 0 to Steps do
        begin
          Spectrum2d[k,i] := 0.0;
        end;
      end;
      tmpDomainOrder := IntToStr(dmStratC.cdsUserChartDomainDOMAINORDER.AsInteger);
      tmpDomainID := IntToStr(dmStratC.cdsUserChartDomainDOMAINID.AsInteger);
      MinPlotAge := dmStratC.cdsUserChartDomainMINPLOTAGE.AsFloat;
      MaxPlotAge := dmStratC.cdsUserChartDomainMAXPLOTAGE.AsFloat;
      if UserSession.IsDeveloper then
      begin
        dmUser.SetDeveloperData('Processing data for domain order '+tmpDomainOrder+' ('+tmpDomainID+')');
      end;
      //WebApplication.ShowMessage('Processing data for domain order '+tmpDomainOrder+' ('+tmpDomainID+')');

      if (Sender = iwbLIPDVCurves) then
      begin
        if UserSession.IsDeveloper then
        begin
          //dmUser.SetDeveloperData('Sender is iwbLIPDVCurves');
        end;
        //get LIPs in the current domain
        dmStratC.qUserChartDomainLIP.Close;
        dmStratC.qUserChartDomainLIP.ParamByName('ChartID').AsInteger := dmStratC.cdsChartCHARTID.AsInteger;
        dmStratC.qUserChartDomainLIP.ParamByName('UserID').AsString := tmpUserID;
        dmStratC.qUserChartDomainLIP.ParamByName('DomainOrder').AsInteger := dmStratC.cdsUserChartDomainDOMAINORDER.AsInteger;
        dmStratC.cdsUserChartDomainLIP.Close;
        dmStratC.cdsUserChartDomainLIP.Open;
        if (dmStratC.cdsUserChartDomainLIP.RecordCount > 0) then
        begin
          repeat
            //cycle through all the LIPs in the current domain
            //get igneous ages for the current LIP
            dmDV.qDVpdf.ParamByName('DOMAINID').AsString := tmpDomainID;
            dmDV.qDVpdf.ParamByName('USERID').AsString := tmpUserID;
            dmDV.qDVpdf.ParamByName('MinAge').AsString := FormatFloat('###0.000',FromDate);
            dmDV.qDVpdf.ParamByName('MaxAge').AsString := FormatFloat('###0.000',ToDate);
            dmDV.qDVpdf.ParamByName('PrefLevel').AsString := iweChartPrefLevel.Text;

            dmDV.qCount.ParamByName('DOMAINID').AsString := tmpDomainID;
            dmDV.qCount.ParamByName('USERID').AsString := tmpUserID;
            dmDV.qCount.ParamByName('MinAge').AsString := FormatFloat('###0.000',FromDate);
            dmDV.qCount.ParamByName('MaxAge').AsString := FormatFloat('###0.000',ToDate);
            dmDV.qCount.ParamByName('PrefLevel').AsString := iweChartPrefLevel.Text;
            dmDV.cdsCount.Close;
            dmDV.cdsCount.Open;
            if (dmDV.cdsCountCount.AsInteger > 0) then
            begin
              dmDV.cdsDVpdf.Close;
              dmDV.cdsDVpdf.Open;
              repeat
                //calculate pdf distribution with this age included
                tx := dmDV.cdsDVpdfRAGE.AsFloat;
                tx1 := (dmDV.cdsDVpdfRAGEPERROR.AsFloat+dmDV.cdsDVpdfRAGEMERROR.AsFloat)/(2.0*1.96);
                if (tx1 < MinimumUncertainty) then tx1 := MinimumUncertainty;
                for l := 0 to Steps do
                begin
                  tmpStr := dmDV.cdsDVpdfISOTOPESYSTEM.AsString;
                  tmpChoice := 3;
                  if (tmpStr = 'UPb') then tmpChoice := 1;
                  if (tmpStr = 'ArAr') then tmpChoice := 2;
                  if (tmpStr = 'nd') then tmpChoice := 4;
                  X1 := Spectrum2d[l,0];
                  tempGauss := Gauss(X1,tx,tx1);
                  //Spectrum2d[l,1] := Spectrum2d[l,1] + tempGauss;
                  if (iwrgOrAnd.ItemIndex = 0) then
                  begin
                    // 'OR' pdf
                    case tmpChoice of
                      1 : begin
                        if (tempGauss > Spectrum2d[l,1]) then Spectrum2d[l,1] := tempGauss;
                      end;
                      2 : begin
                        if (tempGauss > Spectrum2d[l,2]) then Spectrum2d[l,2] := tempGauss;
                      end;
                      3 : begin
                        if (tempGauss > Spectrum2d[l,3]) then Spectrum2d[l,3] := tempGauss;
                      end;
                      4 : begin
                        if (tempGauss > Spectrum2d[l,4]) then Spectrum2d[l,4] := tempGauss;
                      end;
                    end;
                    if (tempGauss > Spectrum2d[l,5]) then Spectrum2d[l,5] := tempGauss;
                  end;
                  if (iwrgOrAnd.ItemIndex = 1) then
                  begin
                    // 'AND' pdf
                    case tmpChoice of
                      1 : begin
                        Spectrum2d[l,1] := Spectrum2d[l,1] + tempGauss;
                      end;
                      2 : begin
                        Spectrum2d[l,2] := Spectrum2d[l,2] + tempGauss;
                      end;
                      3 : begin
                        Spectrum2d[l,3] := Spectrum2d[l,3] + tempGauss;
                      end;
                      4 : begin
                        Spectrum2d[l,4] := Spectrum2d[l,4] + tempGauss;
                      end;
                    end;
                    Spectrum2d[l,5] := Spectrum2d[l,5] + tempGauss;
                  end;
                end;
                dmDV.cdsDVpdf.Next;
              until dmDV.cdsDVpdf.Eof;
            end;
            dmStratC.cdsUserChartDomainLIP.Next;
          until dmStratC.cdsUserChartDomainLIP.Eof;
          tempmaxall := 0.0;
          for i := 1 to tmpMaxSeries do
          begin
            tempmax[i] := 0.0;
          end;
          for k := 0 to Steps do
          begin
            for i := 1 to tmpMaxSeries do
            begin
              if (tempmaxall < Spectrum2d[k,i]) then tempmaxall := Spectrum2d[k,i];
              if (tempmax[i] < Spectrum2d[k,i]) then tempmax[i] := Spectrum2d[k,i];
            end;
          end;
          //normalise maximum peaks to 100 percent
          for i := 1 to tmpMaxSeries do
          begin
            if (tempmaxall = 0.0) then tempmaxall := 1.0e-9;
            if (tempmax[i] = 0.0) then tempmax[i] := 1.0e-9;
            for k := 0 to Steps do
            begin
              Spectrum2d[k,i] := 100.0 * Spectrum2d[k,i]/tempmaxall;
            end;
          end;
          //store pdf values for current domain in table
          for i := 1 to tmpMaxSeries do
          begin
            tmpCurveOrder := IntToStr(i);
            for k := 0 to Steps do
            begin
              if ((Spectrum2d[k,0] >= MinPlotAge) and (Spectrum2d[k,0] <= MaxPlotAge)) then
              begin
                tmpPdfOrder := IntToStr(k);
                tmpAge := FormatFloat('####0.000',Spectrum2d[k,0]);
                tmpPdfValue := FormatFloat('###0.00000',Spectrum2d[k,i]);
                dmStratC.AddPdfToDV(tmpUserID,tmpDomainOrder,tmpCurveOrder,tmpPdfOrder,tmpAge,tmpPDFValue,tmpDomainID);
              end;
            end;
          end;
        end;
        //dmStratC.qAddToPDF.Close;
      end;

      if (Sender = iwbDomainDVCurves) then
      begin
        if UserSession.IsDeveloper then
        begin
          //dmUser.SetDeveloperData('Sender is iwbDomainDVCurves');
        end;
        //cycle through all the UNITs in the current domain
        //get igneous ages for the current UNIT
        dmDV.qDVpdf.ParamByName('DOMAINID').AsString := tmpDomainID;
        dmDV.qDVpdf.ParamByName('USERID').AsString := tmpUserID;
        dmDV.qDVpdf.ParamByName('MinAge').AsString := FormatFloat('###0.000',FromDate);
        dmDV.qDVpdf.ParamByName('MaxAge').AsString := FormatFloat('###0.000',ToDate);
        dmDV.qDVpdf.ParamByName('PrefLevel').AsString := iweChartPrefLevel.Text;

        dmDV.qCount.ParamByName('DOMAINID').AsString := tmpDomainID;
        dmDV.qCount.ParamByName('USERID').AsString := tmpUserID;
        dmDV.qCount.ParamByName('MinAge').AsString := FormatFloat('###0.000',FromDate);
        dmDV.qCount.ParamByName('MaxAge').AsString := FormatFloat('###0.000',ToDate);
        dmDV.qCount.ParamByName('PrefLevel').AsString := iweChartPrefLevel.Text;
        dmDV.cdsCount.Close;
        dmDV.cdsCount.Open;
        tmpCount := dmDV.cdsCountCOUNT.AsInteger;
        if UserSession.IsDeveloper then
        begin
          //dmUser.SetDeveloperData('Number of data returned by query = '+IntToStr(tmpCount));
        end;
        if (tmpCount > 0) then
        begin
          dmDV.cdsDVpdf.Close;
          dmDV.cdsDVpdf.Open;
          repeat
            //calculate pdf distribution with this age included
            tx := dmDV.cdsDVpdfRAGE.AsFloat;
            tx1 := (dmDV.cdsDVpdfRAGEPERROR.AsFloat+dmDV.cdsDVpdfRAGEMERROR.AsFloat)/(2.0*1.96);
            if (tx1 < MinimumUncertainty) then tx1 := MinimumUncertainty;
            tmpStr := dmDV.cdsDVpdfINTERPABR.AsString;
            tmpStrIsoSys := dmDV.cdsDVpdfISOTOPESYSTEM.AsString;
            tmpStrApproach := dmDV.cdsDVpdfAPPROACHABR.AsString;
            tmpChoice := 6;
            if (tmpStr = 'CrysI') then tmpChoice := 1;
            if (tmpStr = 'CrysV') then tmpChoice := 1;
            if (tmpStr = 'Cool') then tmpChoice := 2;
            if (tmpStr = 'Detri') then tmpChoice := 3;
            if (tmpStr = 'MetpR') then tmpChoice := 4;
            if (tmpStr = 'DstUn') then tmpChoice := 0;
            if ((tmpStr = 'CrsRs') and (tmpStrIsoSys = 'SmNd') and (tmpStrApproach = 'DM')) then tmpChoice := 5;
            if ((tmpChoice >= 0) and (tmpChoice <= 4)) then
            begin
              IncludeForAll := true
            end else
            begin
              IncludeForAll := false
            end;
            for l := 0 to Steps do
            begin
              X1 := Spectrum2d[l,0];
              if (tmpChoice in [0..5]) then tempGauss := Gauss(X1,tx,tx1);
              //Spectrum2d[l,1] := Spectrum2d[l,1] + tempGauss;
              if (iwrgOrAnd.ItemIndex = 0) then
              begin
                // 'OR' pdf
                case tmpChoice of
                  1 : begin
                    if (tempGauss > Spectrum2d[l,1]) then Spectrum2d[l,1] := tempGauss;
                  end;
                  2 : begin
                    if (tempGauss > Spectrum2d[l,2]) then Spectrum2d[l,2] := tempGauss;
                  end;
                  3 : begin
                    if (tempGauss > Spectrum2d[l,3]) then Spectrum2d[l,3] := tempGauss;
                  end;
                  4 : begin
                    if (tempGauss > Spectrum2d[l,4]) then Spectrum2d[l,4] := tempGauss;
                  end;
                  5 : begin
                    if (tempGauss > Spectrum2d[l,5]) then Spectrum2d[l,5] := tempGauss;
                  end;
                end;
                if ((IncludeForAll) and (tempGauss > Spectrum2d[l,6])) then Spectrum2d[l,6] := tempGauss;
              end;
              if (iwrgOrAnd.ItemIndex = 1) then
              begin
                // 'AND' pdf
                case tmpChoice of
                  1 : begin
                    Spectrum2d[l,1] := Spectrum2d[l,1] + tempGauss;
                  end;
                  2 : begin
                    Spectrum2d[l,2] := Spectrum2d[l,2] + tempGauss;
                  end;
                  3 : begin
                    Spectrum2d[l,3] := Spectrum2d[l,3] + tempGauss;
                  end;
                  4 : begin
                    Spectrum2d[l,4] := Spectrum2d[l,4] + tempGauss;
                  end;
                  5 : begin
                    Spectrum2d[l,5] := Spectrum2d[l,5] + tempGauss;
                  end;
                end;
                if (IncludeForAll) then Spectrum2d[l,6] := Spectrum2d[l,6] + tempGauss;
              end;
            end;
            dmDV.cdsDVpdf.Next;
          until dmDV.cdsDVpdf.Eof;
        end;
        tempmaxall := 0.0;
        for i := 1 to tmpMaxSeries do
        begin
          tempmax[i] := 0.0;
        end;
        for k := 0 to Steps do
        begin
          for i := 1 to tmpMaxSeries do
          begin
            if (tempmax[i] < Spectrum2d[k,i]) then tempmax[i] := Spectrum2d[k,i];
          end;
        end;
        for i := 1 to tmpMaxSeries do
        begin
          if (tempmaxall < tempmax[i]) then tempmaxall := tempmax[i];
        end;
        //normalise maximum peaks to 100 percent
        if (tempmaxall <= 0.0) then tempmaxall := 1.0e-9;
        for i := 1 to tmpMaxSeries do
        begin
          if (tempmax[i] <= 0.0) then tempmax[i] := 1.0e-9;
          for k := 0 to Steps do
          begin
            Spectrum2d[k,i] := 100.0 * Spectrum2d[k,i]/tempmax[i];
          end;
        end;
        //store pdf values for current domain in table
        for i := 1 to tmpMaxSeries do
        begin
          tmpCurveOrder := IntToStr(i);
          for k := 0 to Steps do
          begin
            if ((Spectrum2d[k,0] >= MinPlotAge) and (Spectrum2d[k,0] <= MaxPlotAge)) then
            begin
              tmpPdfOrder := IntToStr(k);
              tmpAge := FormatFloat('####0.000',Spectrum2d[k,0]);
              tmpPdfValue := FormatFloat('###0.00000',Spectrum2d[k,i]);
              dmStratC.AddPdfToDV(tmpUserID,tmpDomainOrder,tmpCurveOrder,tmpPdfOrder,tmpAge,tmpPDFValue,tmpDomainID);
            end;
          end;
        end;
        //dmStratC.qAddToPDF.Close;
      end;
      //dmUser.SetDeveloperData('DomainOrder = '+tmpDomainOrder+'   DomainID = '+tmpDomainID);
      dmStratC.cdsUserChartDomain.Next;
    until dmStratC.cdsUserChartDomain.Eof;
  end;
  dmStratC.cdsUserChartDomain.Close;
  dmStratC.cdsUserChartDomainLIP.Close;
  dmDV.cdsDVpdf.Close;
end;

procedure TISFChartDetails.iwbLIPDVCurvesExportArArClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmStratC.qTimeSpaceDomainCurves.Close;
  dmStratC.qTimeSpaceDomainCurves.SQL.Strings[13] := 'AND USERDVPDF.CURVEORDER=2';
  dmStratC.qTimeSpaceDomainCurves.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderGE').AsString := iweDomOrderGE.Text;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderLT').AsString := iweDomOrderLT.Text;
  dmStratC.cdsTimeSpaceDomainCurves.Close;
  dmStratC.cdsTimeSpaceDomainCurves.Open;

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceDomainCurves.SQL.Text);
  end;

  //dmStratC.FlexCelReportTimeSpaceDomainCurves.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xlsx';
  frFileNameStr := 'TimeSpace_DomainLIPCurves_ArAr.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceDomainCurves',dmStratC.cdsTimeSpaceDomainCurves);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceDomainCurves.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
  dmStratC.qTimeSpaceDomainCurves.Close;
  dmStratC.qTimeSpaceDomainCurves.SQL.Strings[13] := 'AND USERDVPDF.CURVEORDER<6';
  dmStratC.qTimeSpaceDomainCurves.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.cdsTimeSpaceDomainCurves.Close;
  dmStratC.cdsTimeSpaceDomainCurves.Open;
end;

procedure TISFChartDetails.iwbLIPDVCurvesExportndClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmStratC.qTimeSpaceDomainCurves.Close;
  dmStratC.qTimeSpaceDomainCurves.SQL.Strings[13] := 'AND USERDVPDF.CURVEORDER=4';
  dmStratC.qTimeSpaceDomainCurves.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderGE').AsString := iweDomOrderGE.Text;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderLT').AsString := iweDomOrderLT.Text;
  dmStratC.cdsTimeSpaceDomainCurves.Close;
  dmStratC.cdsTimeSpaceDomainCurves.Open;

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceDomainCurves.SQL.Text);
  end;

  //dmStratC.FlexCelReportTimeSpaceDomainCurves.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xls';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xlsx';
  frFileNameStr := 'TimeSpace_DomainLIPCurves_nd.xls';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceDomainCurves',dmStratC.cdsTimeSpaceDomainCurves);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceDomainCurves.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
  dmStratC.qTimeSpaceDomainCurves.Close;
  dmStratC.qTimeSpaceDomainCurves.SQL.Strings[13] := 'AND USERDVPDF.CURVEORDER<6';
  dmStratC.qTimeSpaceDomainCurves.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.cdsTimeSpaceDomainCurves.Close;
  dmStratC.cdsTimeSpaceDomainCurves.Open;
end;

procedure TISFChartDetails.iwbLIPDVCurvesExportOtherClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmStratC.qTimeSpaceDomainCurves.Close;
  dmStratC.qTimeSpaceDomainCurves.SQL.Strings[13] := 'AND USERDVPDF.CURVEORDER=3';
  dmStratC.qTimeSpaceDomainCurves.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderGE').AsString := iweDomOrderGE.Text;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderLT').AsString := iweDomOrderLT.Text;
  dmStratC.cdsTimeSpaceDomainCurves.Close;
  dmStratC.cdsTimeSpaceDomainCurves.Open;

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceDomainCurves.SQL.Text);
  end;

  //dmStratC.FlexCelReportTimeSpaceDomainCurves.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xls';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xlsx';
  frFileNameStr := 'TimeSpace_DomainLIPCurves_other.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceDomainCurves',dmStratC.cdsTimeSpaceDomainCurves);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceDomainCurves.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
  dmStratC.qTimeSpaceDomainCurves.Close;
  dmStratC.qTimeSpaceDomainCurves.SQL.Strings[13] := 'AND USERDVPDF.CURVEORDER<6';
  dmStratC.qTimeSpaceDomainCurves.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.cdsTimeSpaceDomainCurves.Close;
  dmStratC.cdsTimeSpaceDomainCurves.Open;
end;

procedure TISFChartDetails.iwbLIPDVCurvesExportUPbClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  dmStratC.qTimeSpaceDomainCurves.Close;
  dmStratC.qTimeSpaceDomainCurves.SQL.Strings[13] := 'AND USERDVPDF.CURVEORDER=1';
  dmStratC.qTimeSpaceDomainCurves.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderGE').AsString := iweDomOrderGE.Text;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('DomOrderLT').AsString := iweDomOrderLT.Text;
  dmStratC.cdsTimeSpaceDomainCurves.Close;
  dmStratC.cdsTimeSpaceDomainCurves.Open;

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qTimeSpaceDomainCurves.SQL.Text);
  end;

  //dmStratC.FlexCelReportTimeSpaceDomainCurves.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBChartDomainCurves.xlsx';
  frFileNameStr := 'TimeSpace_DomainLIPCurves_UPb.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsTimeSpaceDomainCurves',dmStratC.cdsTimeSpaceDomainCurves);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsTimeSpaceDomainCurves.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
  dmStratC.qTimeSpaceDomainCurves.Close;
  dmStratC.qTimeSpaceDomainCurves.SQL.Strings[13] := 'AND USERDVPDF.CURVEORDER<6';
  dmStratC.qTimeSpaceDomainCurves.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qTimeSpaceDomainCurves.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.cdsTimeSpaceDomainCurves.Close;
  dmStratC.cdsTimeSpaceDomainCurves.Open;
end;

procedure TISFChartDetails.iwbMapLIPsClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
begin
  dmStratC.qChartMapLIPs.Close;
  dmStratC.qChartMapLIPs.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qChartMapLIPs.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qChartMapLIPs.ParamByName('ChartMinAge').AsString := iweChartMinAge.Text;
  dmStratC.qChartMapLIPs.ParamByName('ChartMaxAge').AsString := iweChartMaxAge.Text;
  dmStratC.cdsChartMapLIPs.Close;
  dmStratC.cdsChartMapLIPs.Open;

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qChartMapLIPs.SQL.Text);
  end;

  //dmStratC.FlexCelReportChartMapLIPs.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509MapLIPs.xls';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509MapLIPs.xlsx';
  frFileNameStr := 'MapLIPs_GIS.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsChartMapLIPs',dmStratC.cdsChartMapLIPs);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsChartMapLIPs.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.iwbMapUnitsClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,i : integer;
begin
  dmStratC.qChartMapUnits.Close;
  dmStratC.qChartMapUnits.ParamByName('ChartID').AsString := UserSession.ChartValue;
  dmStratC.qChartMapUnits.ParamByName('UserID').AsString := UserSession.UserID;
  dmStratC.qChartMapUnits.ParamByName('ChartMinAge').AsString := iweChartMinAge.Text;
  dmStratC.qChartMapUnits.ParamByName('ChartMaxAge').AsString := iweChartMaxAge.Text;
  dmStratC.cdsChartMapUnits.Close;
  dmStratC.cdsChartMapUnits.Open;

  if UserSession.IsDeveloper then
  begin
    //dmUser.SetDeveloperData(dmStratC.qChartMapUnits.SQL.Text);
  end;

  //dmStratC.FlexCelReportChartMapUnits.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509MapUnits.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxIGCP509MapUnits.xlsx';
  frFileNameStr := 'MapUnits_GIS.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('cdsChartMapUnits',dmStratC.cdsChartMapUnits);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.cdsChartMapUnits.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

procedure TISFChartDetails.IWAppFormCreate(Sender: TObject);
var
  i, iRec : integer;
begin
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
end;

procedure TISFChartDetails.iwDBgDomainColumns5Click(ASender: TObject;
  const AValue: string);
begin
  UserSession.ParameterChosen := AValue;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFChartDomain.Create(WebApplication).Show;
end;

procedure TISFChartDetails.iwDBgResultsColumns0TitleClick(Sender: TObject);
begin
  dmStratC.cdsChartDomain.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFChartDetails.iwbAddDomainClick(Sender: TObject);
begin
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFDefineNewContinent.Create(WebApplication).Show;
end;

procedure TISFChartDetails.iwbAddUserClick(Sender: TObject);
begin
    WebApplication.ShowMessage('Not yet implemented');
end;

procedure TISFChartDetails.iwbAgeLinesClick(Sender: TObject);
var
  iStart, IFinish : integer;
  iLeft, iRight : integer;
  i, j, k : integer;
  iYoung, iOld : integer;
  iCode : integer;
  tYoung, tOld, tStepSize : double;
  iLine, iX, iY : integer;
  iStepSize : integer;
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
  l,ii : integer;
begin
  dmStratC.FDMemTableAgeLines.Open;
  Val(iweChartMinAge.Text,tYoung,iCode);
  Val(iweChartMaxAge.Text,tOld,iCode);
  Val(iweChartAgeLineIncrement.Text,tStepSize,iCode);
  dmStratC.cdsChartDomain.First;
  iLeft := dmStratC.cdsChartDomainDOMAINXMIN.AsInteger;
  dmStratC.cdsChartDomain.Last;
  iRight := dmStratC.cdsChartDomainDOMAINXMAX.AsInteger;
  iYoung := 100 * Round(tYoung/100.0);
  iOld := 100 * Round(tOld/100.0);
  iStepSize := Round(tStepSize);
  iLeft := (iLeft div 100) * 100;
  j := iYoung;
  i := 1;
  dmStratC.FDMemTableAgeLines.First;
  repeat
    iLine := ((j-iStepSize) div iStepSize) * iStepSize;
    i := 1;
    repeat
      k := (i-1) * 50;
      iX := k;
      iY := -1 * iLine;
      i := i + 1;
      dmStratC.FDMemTableAgeLines.InsertRecord([iLine,i,iX,iY]);
    until (k > iRight);
    j := j + iStepSize;
  until (j > iOld);
  dmStratC.FDMemTableAgeLines.First;
  //dmStratC.FlexCelReportAgeLines.Template := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBAgeLines.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBAgeLines.xlsx';
  frFileNameStr := 'AgeLines.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('FDMemTableAgeLines',dmStratC.FDMemTableAgeLines);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
        fr.Run(InStream,MemStream);
        WebApplication.SendStream(MemStream,true,TStandardMimeType.Xlsx,frFileNameStr); //save as an attachment
        MemStream:=nil; //If we actually sent the stream, WebApplication.SendStream will free it.
      finally
        MemStream.Free;
        dmStratC.FDMemTableAgeLines.Close;
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
    dmStratC.FDMemTableAgeLines.Close;
  end;
end;

procedure TISFChartDetails.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStratC.cdsChart.ApplyUpdates(0);
  except
    WebApplication.ShowMessage('Not able to update record');
  end;
end;

end.
