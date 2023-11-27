unit IWStrat_rockclasses;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes,
  Controls, Forms, IWBaseControl, IWControl, IWCompRectangle,
  IWCompGrids, IWDBGrids, IWVCLBaseControl, IWBaseHTMLControl, IWHTMLControls,
  IWCompLabel, IWCompButton, DB,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  IWStrat_frTopBar, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TISFRockClasses = class(TIWAppForm)
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
    FDMemTable1RockClassID: TStringField;
    FDMemTable1RockClass: TStringField;
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
    procedure iwDBgColumns1Click(ASender: TObject; const AValue: string);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, DBClient, IWStrat_uMain, IWStrat_constants, IWStrat_dm;




procedure TISFRockClasses.IWAppFormCreate(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  dmStrat.qRockClasses.Close;
  dmStrat.cdsRockClasses.Close;
  dmStrat.cdsRockClasses.Open;
end;

procedure TISFRockClasses.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  //iwbAddNew.Visible := (UserSession.IsDeveloper and (dmStrat.cdsRockClasses.State in [dsBrowse]));
  //iwbApplyUpdates.Visible := (UserSession.IsDeveloper and (dmStrat.cdsRockClasses.State in [dsEdit]));
  //iwbCancelUpdates.Visible := (UserSession.IsDeveloper and (dmStrat.cdsRockClasses.State in [dsEdit]));
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
  end;
  iwlPrevPage.Visible := (dmStrat.cdsRockClasses.RecordCount > iwDBg.RowLimit);
  iwlNextPage.Visible := (dmStrat.cdsRockClasses.RecordCount > iwDBg.RowLimit);
end;

procedure TISFRockClasses.IWDBGrid1Columns0TitleClick(Sender: TObject);
begin
  dmStrat.cdsRockClasses.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFRockClasses.iwlPrevPageClick(Sender: TObject);
begin
  dmStrat.cdsRockClasses.MoveBy(-1*iwDBg.RowLimit);
end;

procedure TISFRockClasses.iwlNextPageClick(Sender: TObject);
begin
  dmStrat.cdsRockClasses.MoveBy(iwDBg.RowLimit);
end;

procedure TISFRockClasses.iwbAddNewClick(Sender: TObject);
begin
  try
    dmStrat.cdsRockClasses.Append;
    dmStrat.cdsRockClassesROCKCLASSID.AsString := 'NEW'+UserSession.UserID;
    dmStrat.cdsRockClassesROCKCLASS.AsString := 'NEW'+UserSession.UserID;
    dmStrat.cdsRockClassesROCKCLASSID2.AsString := 'nd';
    dmStrat.cdsRockClassesLEGENDORDER.AsInteger := 0;
    dmStrat.cdsRockClasses.Post;
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

procedure TISFRockClasses.iwbApplyUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsRockClasses.ApplyUpdates(0);
  except
  end;
end;

procedure TISFRockClasses.iwbCancelUpdatesClick(Sender: TObject);
begin
  try
    dmStrat.cdsRockClasses.CancelUpdates;
  except
  end;
end;

procedure TISFRockClasses.iwbCloseClick(Sender: TObject);
begin
  dmStrat.cdsRockClasses.Close;
  TIWAppForm(WebApplication.ActiveForm).Release;
  TISFMain.Create(WebApplication).Show
end;

procedure TISFRockClasses.iwbDownloadClick(Sender: TObject);
var
  MemStream: TMemoryStream;
  InStream: TFileStream;
  fr: TFlexCelReport;
  frTemplateStr, frFileNameStr : string;
begin
  FDMemTable1.Open;
  dmStrat.cdsRockClasses.First;
  repeat
    FDMemTable1.InsertRecord([dmStrat.cdsRockClassesROCKCLASSID.AsVariant,dmStrat.cdsRockClassesROCKCLASS.AsVariant]);
    dmStrat.cdsRockClasses.Next;
  until dmStrat.cdsRockClasses.Eof;
  FDMemTable1.First;
  //Report1.Template := DefaultFlexCellFolder+'FlxStratDBRockClasses.xlsx';
  frTemplateStr := WebApplication.ApplicationPath+'wwwroot\Files\Flexcell\FlxStratDBRockClasses.xlsx';
  frFileNameStr := 'RockClasses.xlsx';
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

procedure TISFRockClasses.iwDBgColumns1Click(ASender: TObject; const AValue: string);
begin
  if UserSession.CanModify then
  begin
    UserSession.ParameterChosen := AValue;
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    //TIWAppForm(WebApplication.ActiveForm).Release;
    //TISFProvinceEdit.Create(WebApplication).Show;
  end else
  begin
    WebApplication.ShowMessage('Edit rights are required to change these values');
  end;
end;

end.
