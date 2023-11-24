unit IWStrat_uMain_test;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, Controls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompButton,
  IWCompLabel;

type
  TISFMain = class(TIWAppForm)
    IWButton1: TIWButton;
    IWLabel1: TIWLabel;
    procedure IWButton1Click(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}


procedure TISFMain.IWButton1Click(Sender: TObject);
begin
  WebApplication.ShowMessage('This button worked');
end;

initialization
  TISFMain.SetAsMainForm;

end.
