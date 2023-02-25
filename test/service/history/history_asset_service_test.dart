import 'package:flexio_kvl/service/history/history_asset_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final sut = HistoryAssetService();
  test('Parse CSV', () async {
    const text = '''Van Datum;Van Tijdstip;Tot Datum;Tot Tijdstip;EAN;Meter;Metertype;Register;Volume;Eenheid;Validatiestatus
    25-05-2022;00:00:00;25-05-2022;00:15:00;="541448820052632233";1SAG1100336389;Digitale Meter;Afname Nacht;;kWh;Geen verbruik
    25-05-2022;00:00:00;25-05-2022;00:15:00;="541448820052632233";1SAG1100336389;Digitale Meter;Afname Nacht;;kWh;Gevalideerd
    25-05-2022;00:00:00;25-05-2022;00:15:00;="541448820052632233";1SAG1100336389;Digitale Meter;Afname Nacht;0,032;kWh;Gevalideerd''';
    final data = await sut.parseCsv(text);
    expect(data.length, 1);
  });
}
