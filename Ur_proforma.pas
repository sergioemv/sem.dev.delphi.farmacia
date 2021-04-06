unit Ur_proforma;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,IBCustomDataSet,IBQuery,
  QRExport;

type
  TRPT_proforma = class(TQuickRep)
    DetailBand1: TQRBand;
    TitleBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    l_cliente: TQRLabel;
    QRDBText8: TQRDBText;
    QRCSVFilter1: TQRCSVFilter;
  private

  public

  end;

var
  RPT_proforma: TRPT_proforma;

implementation
uses
    um_venta;
{$R *.DFM}

end.
