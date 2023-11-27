unit IWStrat_domains;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton, IWStrat_frTopBar, DB, IWCompListbox,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWDBStdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TISFDomains = class(TIWAppForm)
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
    iwbLocate: TIWButton;
    TopBar: TISFTopBarStrat;
    FDMemTable1: TFDMemTable;
    FDMemTable1DomainID: TIntegerField;
    FDMemTable1DomainName: TStringField;
    FDMemTable1ContinentID: TStringField;
    FDMemTable1SpotLatitude: TFloatField;
    FDMemTable1SpotLongitude: TFloatField;
    FDMemTable1DomainTypeID: TStringField;
    FDMemTable1DomainParentID: TIntegerField;
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
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, IWStrat_dmC, IWStrat_uMain, IWStrat_constants,
  IWStrat_dm, IWStrat_domaindetails;




procedure TISFDomains.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStrat.cdsContinents.Open;

  dmStratC.qDomains.Close;
  dmStratC.qDomains.ParamByName('CONTINENTID').AsString := 'AFR';
  dmStratC.cdsDomains.Close;
  dmStratC.cdsDomains.Open;

end;

procedure TISFDomains.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmStratC.cdsDomains.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmStratC.cdsDomains.RecordCount > iwDBg.RowLimit);
  iwbApplyUpdates.Visible := (dmStratC.cdsDomains.State in [dsEdit,dsInsert]);
  iwbCancelUpdates.Visible := (dmStratC.cdsDomains.State in [dsEdit,dsInsert]);
  iwbAddNew.Visible := (dmStratC.cdsDomains.State in [dsBrowse]);
end;

procedure TISFDomains.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStratC.cdsDomains.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFDomains.iwDBlcbContinents2Change(Sender: TObject);
var
  tmpStr : string;
begin
  dmStratC.cdsDomains.Filtered := false;
  dmStrat.cdsContinents.Locate('CONTINENT',iwDBlcbContinents2.Text,[]);
  tmpStr := dmStrat.cdsContinentsCONTINENTID.AsString;
  UserSession.NewContinentID := tmpStr;
  //WebApplication.ShowMessage(tmpStr);
  dmStratC.qDomains.Close;
  dmStratC.qDomains.ParamByName('CONTINENTID').AsString := tmpStr;
  dmStratC.qDomains.ParamByName('USERID').AsString := UserSession.UserID;
  dmStratC.cdsDomains.Close;
  dmStratC.cdsDomains.Open;
end;

procedure TISFDomains.iwlPrevPageClick(Sender: TObject);
begin
  dmStratC.cdsDomains.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFDomains.iwlNextPageClick(Sender: TObject);
begin
  dmStratC.cdsDomains.MoveBy(iwDBg.RowLimit);
end;

procedure TISFDomains.iwbAddNewClick(Sender: TObject);
var
  WasSuccessful : boolean;
  tmpDomainID : integer;
  tmpUser : string;
begin
  WasSuccessful := false;
  dmStratC.AddDomain(UserSession.NewContinentID,WasSuccessful);
  if WasSuccessful then
  begin
    UserSession.UnitSender := 'NewDomain';
    tmpUser := UserSession.UserID;
    dmStratC.cdsDomains.Close;
    dmStratC.qNewDomainName.Close;
    dmStratC.qNewDomainName.ParamByName('NewDomainName').AsString := 'NEW'+tmpUser;
    dmStratC.cdsNewDomainName.Close;
    dmStratC.cdsNewDomainName.Open;
    tmpDomainID := dmStratC.cdsNewDomainNameDOMAINID.AsInteger;
    UserSession.RecordChosen := IntToStr(tmpDomainID);
    dmStrat.qDomainQ.Close;
    dmStrat.qDomainQ.ParamByName('DOMAINID').AsString := UserSession.RecordChosen;
    dmStrat.qDomainQ.ParamByName('USERID').AsString := tmpUser;
    dmStrat.qDomainParent.ParamByName('USERID').AsString := tmpUser;
    dmStrat.qSubDomains.ParamByName('USERID').AsString := tmpUser;
    dmStrat.qDomainUnits.ParamByName('USERID').AsString := tmpUser;
    dmStrat.cdsDomainQ.Close;
    dmStrat.cdsDomainQ.Open;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Release;
    TISFDomainDetails.Create(WebApplication).Show
  end else
  begin
    WebApplication.ShowMessage('Not able to add new record',smAlert);
  end;
end;

procedure TISFDomains.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStratC.cdsDomains.ApplyUpdates(0);
    dmStratC.cdsDomains.Filtered := false;
  except
  end;
end;

procedure TISFDomains.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmStratC.cdsDomains.CancelUpdates;
    dmStratC.cdsDomains.Filtered := false;
  except
  end;
end;

procedure TISFDomains.iwbCloseClick(Sender: TObject);
begin
  dmStratC.cdsDomains.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFDomains.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  //Report1.Template := DefaultFlexCellFolder+'FlxStratDBDomains.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBDomains.xlsx';
  frFileNameStr := 'Domains.xlsx';
  dmStratC.cdsDomains.First;
  repeat
    FDMemTable1.AppendRecord([dmStratC.cdsDomainsDOMAINID.AsVariant,dmStratC.cdsDomainsDOMAINNAME.AsVariant,dmStratC.cdsDomainsCONTINENTID.AsVariant,dmStratC.cdsDomainsSPOTLATITUDE.AsVariant,
       dmStratC.cdsDomainsSPOTLONGITUDE.AsVariant,dmStratC.cdsDomainsDOMAINTYPEID.AsVariant,
       dmStratC.cdsDomainsDOMAINPARENTID.AsVariant]);
    dmStratC.cdsDomains.Next;
  until dmStratC.cdsDomains.Eof;
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
        FreeAndNil(MemStream);
      end; //finally
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

end.



