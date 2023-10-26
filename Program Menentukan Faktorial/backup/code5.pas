unit code5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmUtama }

  TfrmUtama = class(TForm)
    btnHitung: TButton;
    btnClose: TButton;
    btnClear: TButton;
    edtJumlah: TEdit;
    edtFaktorial: TEdit;
    edtDeret: TEdit;
    edtHasil: TGroupBox;
    lblN: TLabel;
    lblJumlah: TLabel;
    lblFaktorial: TLabel;
    lblJudul: TLabel;
    procedure btnClearClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnHitungClick(Sender: TObject);
  private

  public

  end;

var
  frmUtama: TfrmUtama;

implementation

{$R *.lfm}

{ TfrmUtama }

function HitungFaktorial(N: Integer): Integer;
begin
  if N = 0 then
    Result := 1
  else
    Result := N * HitungFaktorial(N - 1);
end;

procedure TfrmUtama.btnHitungClick(Sender: TObject);
var
  N, Faktorial, Jumlah: Integer;
  i: Integer;
begin
  // Mengambil nilai N/angka dari Edit Box
  N := StrToIntDef(edtDeret.Text, 0);

  // Memastikan N tidak negatif
  if N < 0 then
  begin
    ShowMessage('Masukkan bilangan bulat tidak negatif.');
    Exit;
  end;

  // Menghitung faktorial
  Faktorial := HitungFaktorial(N);
  edtFaktorial.Text := IntToStr(Faktorial);

  // Menghitung jumlah deret
  Jumlah := 0;
  for i := 1 to N do
    Jumlah := Jumlah + i;
  edtJumlah.Text := IntToStr(Jumlah);
end;

procedure TfrmUtama.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUtama.btnClearClick(Sender: TObject);
begin
   edtDeret.Text := '';
  edtFaktorial.Text := '';
  edtJumlah.Text := '';
end;

end.

