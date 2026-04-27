unit IWStrat_lips;

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
  TISFLIPS = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNew: TIWButton;
    IWDBNavigator1: TIWDBNavigator;
    TopBar: TISFTopBarStrat;
    FDMemTable1: TFDMemTable;
    FDMemTable1LIPID: TIntegerField;
    FDMemTable1LIPName: TStringField;
    FDMemTable1LIPParentID: TIntegerField;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwbCloseClick(Sender: TObject);
    procedure iwbDownloadClick(Sender: TObject);
    procedure iwbApplyUpdatesClick(Sender: TObject);
    procedure iwbCancelUpdatesClick(Sender: TObject);
    procedure iwbAddNewClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, IWStrat_uMain, IWStrat_constants, IWStrat_dmLIP,
  IWStrat_LIPdetails;

procedure TISFLIPS.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmLIP.qLIPS.Close;
  dmLIP.cdsLIPS.Close;
  dmLIP.cdsLIPS.Open;

end;

procedure TISFLIPS.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
end;

procedure TISFLIPS.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmLIP.cdsLIPS.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFLIPS.iwbAddNewClick(Sender: TObject);
var
  WasSuccessful : boolean;
  tmpLIPID : integer;
  tmpUser : string;
begin
  WasSuccessful := false;
  dmLIP.AddLIP(UserSession.NewContinentID,WasSuccessful);
  if WasSuccessful then
  begin
    UserSession.UnitSender := 'NewLIP';
    tmpUser := UserSession.UserID;
    dmLIP.cdsLIPs.Close;
    dmLIP.qNewLIPName.Close;
    dmLIP.qNewLIPName.ParamByName('NewLIPName').AsString := 'NEW'+tmpUser;
    dmLIP.cdsNewLIPName.Close;
    dmLIP.cdsNewLIPName.Open;
    tmpLIPID := dmLIP.cdsNewLIPNameLIPID.AsInteger;
    UserSession.RecordChosen := IntToStr(tmpLIPID);
    dmLIP.qLIPQ.Close;
    dmLIP.qLIPQ.ParamByName('LIPID').AsString := UserSession.RecordChosen;
    dmLIP.qLIPQ.ParamByName('USERID').AsString := tmpUser;
    dmLIP.qLIPParent.ParamByName('USERID').AsString := tmpUser;
    dmLIP.qSubLIPs.ParamByName('USERID').AsString := tmpUser;
    dmLIP.qLIPUnits.ParamByName('USERID').AsString := tmpUser;
    dmLIP.cdsLIPQ.Close;
    dmLIP.cdsLIPQ.Open;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFLIPDetails.Create(WebApplication).Show
  end else
  begin
    WebApplication.ShowMessage('Not able to add new record',smAlert);
  end;
end;

procedure TISFLIPS.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmLIP.cdsLIPS.ApplyUpdates(0);
  except
  end;
end;

procedure TISFLIPS.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmLIP.cdsLIPS.CancelUpdates;
  except
  end;
end;

procedure TISFLIPS.iwbCloseClick(Sender: TObject);
begin
  dmLIP.cdsLIPS.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFLIPS.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBLIPs.xlsx';
  frFileNameStr := 'StratDB_LIPs.xlsx';
  dmLIP.cdsLIPs.First;
  repeat
    FDMemTable1.InsertRecord([dmLIP.cdsLIPsLIPID.AsVariant,dmLIP.cdsLIPsLIPNAME.AsVariant,dmLIP.cdsLIPsLIPPARENTID.AsVariant]);
    dmLIP.cdsLIPs.Next;
  until dmLIP.cdsLIPs.Eof;
  FDMemTable1.First;
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

end.
