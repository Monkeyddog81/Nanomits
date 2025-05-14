unit UtMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, mathematics;

type
  TfrmMain = class(TForm)
    btnTest: TButton;
    procedure btnTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

function ObfuscatedCalculation(a, b: Integer): Integer;
begin
  asm
    jmp @Stage1

    @DeadCode1:
    mov eax, 9999
    ret

    @Stage2:
    mov eax, [a]
    add eax, [b]
    jmp @FinalStage

    @Stage3:
    mov ecx, 1234
    jmp @Stage2

    @Stage1:
    push ebx
    xor ebx, ebx
    test ebx, ebx
    jz @Stage3

    @FakeBranch:
    mov eax, 5555
    ret

    @FinalStage:
    mov [Result], eax
    pop ebx
  end;
end;

procedure ShowObfuscatedResult;
var
  Sum: Integer;
begin
  Sum := ObfuscatedCalculation(5, 10);
  MessageBox(0, PChar('Result: ' + IntToStr(Sum)),
    'Info', MB_OK or MB_ICONINFORMATION);
end;


procedure TfrmMain.btnTestClick(Sender: TObject);
begin
 ShowObfuscatedResult;
end;

end.
