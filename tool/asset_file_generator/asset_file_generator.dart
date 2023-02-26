// ignore_for_file: avoid_print

import 'dart:io';

void main() {
  final file = File('tool/asset_file_generator/history.csv');
  final assetFileSmall = File('assets/data/history_all.csv');
  final lines = file.readAsLinesSync();
  final sb = StringBuffer();
  lines.removeAt(0);
  sb.writeln('Van Datum;Van Tijdstip;Tot Datum;Tot Tijdstip;Volume');
  var index = 0;
  for (final line in lines) {
    final trimmedLine = line.trim();
    try {
      final rows = trimmedLine.split(';');
      final type = rows[10];
      if (type != 'Gevalideerd') {
        continue;
      }
      final startDate = rows[0];
      final startTime = rows[1];
      final endDate = rows[2];
      final endTime = rows[3];
      final registerType = rows[7];
      if (!registerType.toLowerCase().contains('afname')) continue;
      final volume = double.tryParse(rows[8].replaceAll(',', '.'));
      if (volume == null) continue;
      sb.writeln('$startDate $startTime;$endDate $endTime;$volume');
      index++;
    } catch (e) {
      print('Error: $e');
    }
  }
  print('Added $index data points from the original ${lines.length} lines.');
  final content = sb.toString();
  assetFileSmall.writeAsStringSync(content.trim(), flush: true);
}
