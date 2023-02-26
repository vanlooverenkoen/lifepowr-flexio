import 'package:flexio_kvl/service/history/history_asset_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final sut = HistoryAssetService();
  test('Parse CSV', () async {
    const text = '''Van Datum;Van Tijdstip;Tot Datum;Tot Tijdstip;Volume
25-05-2022 21:15:00;25-05-2022 21:30:00;0.105
25-05-2022 21:30:00;25-05-2022 21:45:00;0.148
25-05-2022 21:45:00;25-05-2022 22:00:00;0.143
25-05-2022 22:00:00;25-05-2022 22:15:00;0.136''';
    final data = await sut.parseCsv(text);
    expect(data.data.length, 4);
    expect(data.maxConsumption, 4500);
    expect(data.minConsumption, 0);
  });
}
