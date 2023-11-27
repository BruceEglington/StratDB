unit IWStrat_clantypes;

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
  TISFClanTypes = class(TIWAppForm)
    iwDBg: TIWDBGrid;
    iwlSortedBy: TIWLabel;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwbClose: TIWButton;
    rectLeft: TIWRectangle;
    iwbDownload: TIWButton;
    iwbApplyUpdates: TIWButton;
    iwbCancelUpdates: TIWButton;
    iwbAddNew: TIWButton;
    TopBar: TISFTopBarStrat;
    FDMemTable1: TFDMemTable;
    FDMemTable1ClanTypeID: TIntegerField;
    FDMemTable1ClanType: TStringField;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1Columns0TitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
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
  ServerController, DBClient, IWStrat_uMain, IWStrat_constants, IWStrat_dmD,
  usrIW_dm;




procedure TISFClanTypes.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStratD.cdsClans.Open;
  {
  dmStratD.qDomainTypes.Close;
  dmStratD.qDomainTypes.ParamByName('CONTINENTID').AsString := 'AFR';
  dmStratD.cdsClans.Close;
  dmStratD.cdsClans.Open;
  }
end;

procedure TISFClanTypes.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmStratD.cdsClans.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmStratD.cdsClans.RecordCount > iwDBg.RowLimit);
end;

procedure TISFClanTypes.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStratD.cdsClans.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFClanTypes.iwlPrevPageClick(Sender: TObject);
begin
  dmStratD.cdsClans.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFClanTypes.iwlNextPageClick(Sender: TObject);
begin
  dmStratD.cdsClans.MoveBy(iwDBg.RowLimit);
end;

procedure TISFClanTypes.iwbAddNewClick(Sender: TObject);
begin
  try
    dmStratD.cdsClans.Append;
    dmStratD.cdsClansDEPOSITCLANID.AsString := 'NEW';
    dmStratD.cdsClansDEPOSITCLAN.AsString := 'NEW';
    dmStratD.cdsClans.Post;
  except
    WebApplication.ShowMessage('Not able to add new record',smAlert);
  end;
  {
  try
    UserSession.ParameterChosen := 'NEW'+UserSession.UserID;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    //TIWAppForm(WebApplication.ActiveForm).Release;
    //TISFProvinceEdit.Create(WebApplication).Show;
  except
    WebApplication.ShowMessage('Not able to edit new chart record',smAlert);
  end;
  }
end;

procedure TISFClanTypes.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStratD.cdsClans.ApplyUpdates(0);
  except
  end;
end;

procedure TISFClanTypes.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmStratD.cdsClans.CancelUpdates;
  except
  end;
end;

procedure TISFClanTypes.iwbCloseClick(Sender: TObject);
begin
  dmStratD.cdsClans.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFClanTypes.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  dmStratD.cdsClans.First;
  //dmUser.SetDeveloperData('before filling FDMemTable1 in ClanTypes');
  repeat
    //dmUser.SetDeveloperData(dmStratD.cdsClansDEPOSITCLANID.AsString+'___*___'+dmStratD.cdsClansDEPOSITCLAN.AsString);
    FDMemTable1.AppendRecord([dmStratD.cdsClansDEPOSITCLANID.AsVariant,dmStratD.cdsClansDEPOSITCLAN.AsVariant]);
    dmStratD.cdsClans.Next;
  until dmStratD.cdsClans.Eof;
  //dmUser.SetDeveloperData('after filling FDMemTable1 in ClanTypes');
  FDMemTable1.First;
  dmStratD.cdsClans.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxStratDBClanTypes.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBClanTypes.xlsx';
  frFileNameStr := 'ClanTypes.xlsx';
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
      end;
    finally
      InStream.Free;
    end;
  finally
    fr.Free;
  end;
end;

end.
