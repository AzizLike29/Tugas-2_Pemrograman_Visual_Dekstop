unit code4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfrmUtama }

  TfrmUtama = class(TForm)
    btnTotal: TButton;
    btnIsiData: TButton;
    btnClose: TButton;
    cmbJabatan: TComboBox;
    edtGajiBersih: TEdit;
    edtStatus: TEdit;
    edtGapok: TEdit;
    edtPegawai: TEdit;
    lblGajiBersih: TLabel;
    lblStatus: TLabel;
    lblGapok: TLabel;
    lblJabatan: TLabel;
    lblPegawai: TLabel;
    rdgStatus: TRadioGroup;
    procedure btnCloseClick(Sender: TObject);
    procedure btnIsiDataClick(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
  private

  public

  end;

var
  // Tugas kedua
  frmUtama: TfrmUtama;

implementation

{$R *.lfm}

{ TfrmUtama }

procedure TfrmUtama.btnTotalClick(Sender: TObject);
var
  gajiPokok, tunjangan, gajiBersih: Double;
begin
  // Mengambil gaji pokok dari ComboBox
  case cmbJabatan.ItemIndex of
    0: gajiPokok := 5000000;
    1: gajiPokok := 3000000;
    2: gajiPokok := 1000000;
    else
    begin
      ShowMessage('Silakan pilih jabatan.');
      Exit;
    end;
  end;

  // Menghitung tunjangan berdasarkan RadioGroup
  if rdgStatus.ItemIndex = 0 then
    tunjangan := 1500000
  else if rdgStatus.ItemIndex = 1 then
    tunjangan := 500000
  else
  begin
    ShowMessage('Silakan pilih status kepegawaian.');
    Exit;
  end;

  // Menghitung gaji bersih
  gajiBersih := gajiPokok + tunjangan;

  // Menampilkan hasil perhitungan di input Gaji Bersih
  edtGajiBersih.Text := FloatToStr(gajiBersih);
end;
procedure TfrmUtama.btnIsiDataClick(Sender: TObject);
begin
  cmbJabatan.ItemIndex := -1;
  rdgStatus.ItemIndex := -1;
  edtGapok.Clear;
  edtGajiBersih.Clear;
  edtPegawai.Clear;
  edtStatus.Clear;
end;

procedure TfrmUtama.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.

