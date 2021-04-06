//-----------------------------------------------------//
//-----------------------------------------------------//
//-- This Form is created with QReport Artist 3.0    --//
//-- wich is created by André Mens                   --//
//--                                                 --//
//-- EMail : qrartist@mensand.demon.nl               --//
//-- HomePage http://www.mensand.demon.nl            --//
//-----------------------------------------------------//
//-----------------------------------------------------//
unit Prueba;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls;

type
  TfrmPrueba = class(TForm)
    ReportOwner : TScrollBox;
    QuickRep : TQuickRep;
    QRBand1 : TQRBand;
    QrLine1 : TQrLine;
    QRLabel1 : TQRLabel;
    QRLabel0 : TQRLabel;
    QRDBText1 : TQRDBText;
    QRLabel2 : TQRLabel;
    QRLabel4 : TQRLabel;
    QRDBText2 : TQRDBText;
    QRBand2 : TQRBand;
    QRLabel3 : TQRLabel;
    QRBand3 : TQRBand;
    QrHeader1 : TQrHeader;
    Query1 : TQuery;
    dsQuery1 : TDataSource;
    ARTSCRIPTMEMO : TArtMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  var
    frmPrueba : TfrmPrueba;

implementation

{$R *.DFM}

end.
