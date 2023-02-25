import 'package:flexio_kvl/model/ev/ev_charge_box.dart';
import 'package:flexio_kvl/model/ev/ev_charge_box_status.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@injectable
class EvViewModel with ChangeNotifier {
  final _evChargingBoxes = <EvChargeBox>[
    const EvChargeBox(
      title: 'LIFEPOWR LAB - PulsarPlus SN 283570 (PulsarPlus)',
      status: EvChargeBoxStatus.available,
    ),
    const EvChargeBox(
      title: 'LIFEPOWR LAB - Cooper Business SN 290104 (Cooper Business)',
      status: EvChargeBoxStatus.unavailable,
    ),
  ];

  List<EvChargeBox> get evChargingBoxes => _evChargingBoxes;

  EvViewModel();
}
