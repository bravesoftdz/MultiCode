unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynMemo, SynEdit, Forms, Controls, Graphics,
  Dialogs, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    SynEdit1: TSynEdit;
    TabControl1: TTabControl;
    procedure SynEdit1Change(Sender: TObject);
    procedure SynEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure SynEdit1KeyPress(Sender: TObject; var Key: char);
    procedure SynEdit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { private declarations }
  public
    { public declarations }
  end;

  TMKeyEvent = class
  public
    type
      TKey=class
      public
        var
          FAsChar: Char;
      public
        constructor Create(Key: Char);
        constructor Create(Key: Word);
        function Equals(Value: TKey): Boolean;
        function Like(Value: TKey): Boolean;
      public
        property AsChar: Char read FAsChar write FAsChar;
        function getAsWord: Word;
        procedure setAsWord(Value: Word);
        property AsWord: Word read getAsWord write setAsWord;
      end;
  public
    constructor Create;
  end;

var
  Form1: TForm1;
  last: TMKeyEvent;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.SynEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  last:=TMKeyEvent.Create;
  TabControl1.TabIndex:=TabControl1.Tabs.Add('['+chr(Key)+'#'+IntToStr(Key)+']');
end;

procedure TForm1.SynEdit1KeyPress(Sender: TObject; var Key: char);
begin
  TabControl1.TabIndex:=TabControl1.Tabs.Add(Key);
end;

procedure TForm1.SynEdit1Change(Sender: TObject);
begin
  TabControl1.TabIndex:=TabControl1.Tabs.Add('...');
end;

procedure TForm1.SynEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  TabControl1.TabIndex:=TabControl1.Tabs.Add('('+chr(Key)+'#'+IntToStr(Key)+')');
end;

end.

