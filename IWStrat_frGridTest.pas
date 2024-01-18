unit IWStrat_frGridTest;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWDBStdCtrls,
  IWGrids, IWDBGrids, Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompButton, FMTBcd, WideStrings,
  DBXDevartInterBase, DB, SqlExpr, DBClient, Provider;

type
  TIWForm1 = class(TIWAppForm)
    IWButton1: TIWButton;
    IWDBGrid1: TIWDBGrid;
    IWDBNavigator1: TIWDBNavigator;
    Query2: TSQLQuery;
    dspQuery2: TDataSetProvider;
    cdsQuery2: TClientDataSet;
    dsQuery2: TDataSource;
    sqlcTest: TSQLConnection;
    procedure IWButton1Click(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
  public
  end;

implementation

uses IWStrat_dm, IWStrat_uMain, usrIW_dm, ServerController;

{$R *.dfm}


procedure TIWForm1.IWAppFormCreate(Sender: TObject);
var
  i, nRec : integer;
begin
  if UserSession.LoggedIn then
  begin
    dmStrat.Query1.Close;
    dmStrat.cdsQuery1.Close;
    dmStrat.Query1.ParamByName('USERID').AsString := UserSession.UserID;
    dmStrat.cdsQuery1.Open;
    UserSession.NumRecordsFound := 0;
    dmStrat.Query1RecordCount;
  end;
end;

procedure TIWForm1.IWButton1Click(Sender: TObject);
var
  numrec : integer;
begin
  dmUser.SetDeveloperData('frGridTest');
  Query2.Close;
  Query2.SQL.Clear;
  Query2.SQL.Text := dmStrat.Query1.SQL.Text;
  Query2.ParamByName('USERID').AsString := UserSession.UserID;
  //Query2.Open;
  cdsQuery2.Close;
  dmUser.SetDeveloperData('start Close and Open Query2');
  dmUser.SetDeveloperData(dmStrat.Query2.SQL.Text);
  dmUser.SetDeveloperData('finish Close and Open Query2');
  cdsQuery2.Open;
  numrec := cdsQuery2.RecordCount;
  dmUser.SetDeveloperData('numrec = '+IntToStr(numrec));
end;

end.
