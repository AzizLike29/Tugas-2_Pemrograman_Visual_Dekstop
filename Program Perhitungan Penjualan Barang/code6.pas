unit code6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmUtama }

  TfrmUtama = class(TForm)
    btnHitung: TButton;
    btnUlang: TButton;
    btnKeluar: TButton;
    cmbKode: TComboBox;
    edtTotalBayar: TEdit;
    edtDiskon: TEdit;
    edtSubTotal: TEdit;
    edtHargaSatuan: TEdit;
    edtNamaBarang: TEdit;
    edtQuantity: TEdit;
    lblTotalBayar: TLabel;
    lblDiskon: TLabel;
    lblSubTotal: TLabel;
    lblHargaSatuan: TLabel;
    lblNamaBarang: TLabel;
    lblQuantity: TLabel;
    lblKodeBarang: TLabel;
    lblJudul: TLabel;
    procedure btnHitungClick(Sender: TObject);
    procedure btnKeluarClick(Sender: TObject);
    procedure btnUlangClick(Sender: TObject);
  private

  public

  end;

var
  frmUtama: TfrmUtama;

implementation

{$R *.lfm}

{ TfrmUtama }

procedure TfrmUtama.btnHitungClick(Sender: TObject);
var
  HargaBarang: array[0..3] of integer = (50000, 2500, 750000, 5000);
  Diskon: array[0..3] of integer = (15, 10, 5, 0);
  KodeIndex: integer;
  SubTotal: integer;
begin
  KodeIndex := cmbKode.ItemIndex;
  if (KodeIndex >= 0) and (KodeIndex <= 3) then
  begin
    SubTotal := StrToIntDef(edtQuantity.Text, 0) * HargaBarang[KodeIndex];
    edtSubTotal.Text := IntToStr(SubTotal);

    if SubTotal >= 100000 then
      edtDiskon.Text := IntToStr(Diskon[0])
    else if SubTotal >= 50000 then
      edtDiskon.Text := IntToStr(Diskon[1])
    else if SubTotal >= 25000 then
      edtDiskon.Text := IntToStr(Diskon[2])
    else
      edtDiskon.Text := IntToStr(Diskon[3]);

    edtTotalBayar.Text := IntToStr(SubTotal - (SubTotal * StrToIntDef(edtDiskon.Text, 0) div 100));
  end;
end;

procedure TfrmUtama.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUtama.btnUlangClick(Sender: TObject);
begin
  cmbKode.ItemIndex := -1;
  edtQuantity.Text := '';
  edtHargaSatuan.Text := '';
  edtNamaBarang.Text := '';
  edtSubTotal.Text := '';
  edtDiskon.Text := '';
  edtTotalBayar.Text := '';
end;

end.

