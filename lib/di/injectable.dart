import 'package:flexio_kvl/architecture.dart';
import 'package:flexio_kvl/di/injectable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.asNewInstance();

const dummyHistoryService = 'dummy_history_service';
const assetHistoryService = 'asset_history_service';

@InjectableInit(
  initializerName: r'initGetIt',
  generateForDir: ['lib'],
)
Future<void> configureDependencies() async {
  getIt.initGetIt();
  await getIt.allReady();
  await initArchitecture();
}

@module
abstract class RegisterModule {}
