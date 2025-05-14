unit UtMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Winapi.ShellAPI;

type
  TfrmLoader = class(TForm)
    btnLoad: TButton;
    procedure btnLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoader: TfrmLoader;

implementation

{$R *.dfm}


procedure TfrmLoader.btnLoadClick(Sender: TObject);
var
  StartupInfo: TStartupInfo;
  Context: TContext;
  hThread: THandle;

  DBE: DEBUG_EVENT;
  Dummy: Cardinal;

  PInfo: TProcessInformation;
  IB: Pointer;
begin
  Hide;
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  StartupInfo.cb := SizeOf(TStartupInfo);
  FillChar(PInfo, SizeOf(TProcessInformation), 0);

  if CreateProcess(PChar('SampleApp.exe'), '', NIL, NIL,
                    False, CREATE_NEW, NIL, NIL, StartupInfo, PInfo) then
  begin
   try
     hThread := PInfo.hThread;
     Context.ContextFlags := CONTEXT_FULL;
     DebugActiveProcess(PInfo.dwProcessId);
     ResumeThread(PInfo.hThread);
      While True Do begin
        WaitForDebugEvent(DBE, INFINITE);

        If DBE.dwDebugEventCode = EXIT_PROCESS_DEBUG_EVENT Then Halt;
        If DBE.dwDebugEventCode = EXCEPTION_DEBUG_EVENT Then
          If DBE.Exception.ExceptionRecord.ExceptionCode = EXCEPTION_BREAKPOINT then
          begin
              GetThreadContext(PInfo.hThread, Context);
               Case Context.Eip Of
                  $005CE694 :   Context.Eip := $005CE6AA;
                  $005CE6A2 :   Context.Eip := $005CE6B7;
                  $005CE6A9 :   Context.Eip := $005CE69B;
                  $005CE738 :   Context.Eip := $00409298;
                  $005CE73D :   Context.Eip := $005CE729;
              end;
              SetThreadContext(PInfo.hThread, Context);
              ContinueDebugEvent(DBE.dwProcessId, DBe.dwThreadId, DBG_CONTINUE);
              Continue;
          end;
        ContinueDebugEvent(DBE.dwProcessId,DBE.dwThreadId,DBG_EXCEPTION_NOT_HANDLED );
      end;
   finally
      CloseHandle(PInfo.hThread);
      CloseHandle(PInfo.hProcess);
   end;

  end;
end;

end.
