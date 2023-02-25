import 'package:flexio_kvl/model/ev_charge_box_status.dart';

class EvChargeBox {
  final String title;
  final EvChargeBoxStatus status;

  const EvChargeBox({
    required this.title,
    required this.status,
  });
}
