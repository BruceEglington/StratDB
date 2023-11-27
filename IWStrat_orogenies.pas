unit IWStrat_orogenies;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton,
  IWStrat_frTopBar, IWCompListbox,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWDBStdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TISFOrogenies = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    IWLabel1: TIWLabel;
    iwDBlcbContinents2: TIWDBLookupComboBox;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNew: TIWButton;
    TopBar: TISFTopBarStrat;
    FDMemTable1: TFDMemTable;
    FDMemTable1OrogenyID: TIntegerField;
    FDMemTable1Orogeny: TStringField;
    FDMemTable1ContinentID: TStringField;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
    procedure iwDBlcbContinents2Change(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbAddNewClick(Sender: TObject);
    procedure iwDBgColumns0Click(ASender: TObject; const AValue: string);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, IWStrat_uMain, IWStrat_constants, IWStrat_dmC,
  IWStrat_dm, IWStrat_addorogeny;




procedure TISFOrogenies.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwbAddNew.Visible := UserSession.CanModify;
  dmStrat.cdsContinents.Open;

  dmStratC.qOrogenies.Close;
  dmStratC.qOrogenies.ParamByName('CONTINENTID').AsString := 'UND';
  dmStratC.cdsOrogenies.Close;
  dmStratC.cdsOrogenies.Open;

end;

procedure TISFOrogenies.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmStratC.cdsOrogenies.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmStratC.cdsOrogenies.RecordCount > iwDBg.RowLimit);
end;

procedure TISFOrogenies.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStratC.cdsOrogenies.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFOrogenies.iwlPrevPageClick(Sender: TObject);
begin
  dmStratC.cdsOrogenies.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFOrogenies.iwDBlcbContinents2Change(Sender: TObject);
var
  tmpStr : string;
begin
  dmStrat.cdsContinents.Locate('CONTINENT',iwDBlcbContinents2.Text,[]);
  tmpStr := dmStrat.cdsContinentsCONTINENTID.AsString;
  //WebApplication.ShowMessage(tmpStr);
  dmStratC.qOrogenies.Close;
  dmStratC.qOrogenies.ParamByName('CONTINENTID').AsString := tmpStr;
  dmStratC.cdsOrogenies.Close;
  dmStratC.cdsOrogenies.Open;
end;

procedure TISFOrogenies.iwlNextPageClick(Sender: TObject);
begin
  dmStratC.cdsOrogenies.MoveBy(iwDBg.RowLimit);
end;

procedure TISFOrogenies.iwbAddNewClick(Sender: TObject);
var
  WasSuccessful : boolean;
begin
  WasSuccessful := false;
  dmStrat.InsertOrogeny(WasSuccessful);
  try
    UserSession.ParameterChosen := 'NEW'+UserSession.UserID;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddOrogeny.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to edit new orogeny record',smAlert);
  end;
end;

procedure TISFOrogenies.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStratC.cdsOrogenies.ApplyUpdates(0);
  except
  end;
end;

procedure TISFOrogenies.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmStratC.cdsOrogenies.CancelUpdates;
  except
  end;
end;

procedure TISFOrogenies.iwbCloseClick(Sender: TObject);
begin
  dmStratC.cdsOrogenies.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFOrogenies.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  dmStratC.cdsOrogenies.First;
  repeat
    FDMemTable1.InsertRecord([dmStratC.cdsOrogeniesOROGENYID.AsVariant,dmStratC.cdsOrogeniesOROGENY.AsVariant,dmStratC.cdsOrogeniesCONTINENTID.AsVariant]);
    dmStratC.cdsOrogenies.Next;
  until dmStratC.cdsOrogenies.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxStratDBOrogenies.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBOrogenies.xlsx';
  frFileNameStr := 'Orogenies.xlsx';
  fr := TFlexCelReport.Create(true);
  try
    fr.AddTable('FDMemTable1',FDMemTable1);
    InStream := TFileStream.Create(frTemplateStr, fmOpenRead or fmShareDenyNone);
    try
      MemStream:=TMemoryStream.Create;
      try
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

procedure TISFOrogenies.iwDBgColumns0Click(ASender: TObject;
  const AValue: string);
begin
  //UserSession.ParameterChosen := dmStrat.cdsOrogeniesOROGENYID.AsInteger;
  UserSession.ParameterChosen := AValue;
  try
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFAddOrogeny.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to edit new orogeny record',smAlert);
  end;
end;

end.
