import 'package:flexio_kvl/service/history/history_asset_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const text = '''[
        {"startDate":"2022-05-25T21:15:00.000","endDate":"2022-05-25T21:30:00.000","consumption":0.105},
        {"startDate":"2022-05-25T21:30:00.000","endDate":"2022-05-25T21:45:00.000","consumption":0.148},
        {"startDate":"2022-05-25T21:45:00.000","endDate":"2022-05-25T22:00:00.000","consumption":0.143}
    ]''';
  final sut = HistoryAssetService();
  test('Parse json with 0 starting peak consumption', () async {
    final data = await sut.parseData(ComputeData(0, text));
    expect(data.data.length, 3);
    expect(data.maxConsumption, 592.0);
    expect(data.minConsumption, 0);
  });

  test('Parse json with 600 starting peak consumption', () async {
    final data = await sut.parseData(ComputeData(600, text));
    expect(data.data.length, 3);
    expect(data.maxConsumption, 600);
    expect(data.minConsumption, 0);
  });

  test('Parse json with 400 starting peak consumption', () async {
    final data = await sut.parseData(ComputeData(400, text));
    expect(data.data.length, 3);
    expect(data.maxConsumption, 592);
    expect(data.minConsumption, 0);
  });
}
