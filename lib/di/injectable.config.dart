// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flexio_kvl/repo/history/history_repository.dart' as _i12;
import 'package:flexio_kvl/service/history/history_dummy_service.dart' as _i6;
import 'package:flexio_kvl/service/history/history_service.dart' as _i5;
import 'package:flexio_kvl/viewmodel/global/global_viewmodel.dart' as _i4;
import 'package:flexio_kvl/viewmodel/history/fl_chart_peak_consumption_viewmodel.dart'
    as _i13;
import 'package:flexio_kvl/viewmodel/history/history_viewmodel.dart' as _i7;
import 'package:flexio_kvl/viewmodel/home/ev_viewmodel.dart' as _i3;
import 'package:flexio_kvl/viewmodel/home/home_viewmodel.dart' as _i8;
import 'package:flexio_kvl/viewmodel/home/real_time_viewmodel.dart' as _i10;
import 'package:flexio_kvl/viewmodel/home/savings_viewmodel.dart' as _i11;
import 'package:flexio_kvl/viewmodel/main_viewmodel.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.EvViewModel>(() => _i3.EvViewModel());
    gh.lazySingleton<_i4.GlobalViewModel>(() => _i4.GlobalViewModel());
    gh.lazySingleton<_i5.HistoryService>(() => _i6.HistoryDummyService());
    gh.factory<_i7.HistoryViewModel>(() => _i7.HistoryViewModel());
    gh.factory<_i8.HomeViewModel>(() => _i8.HomeViewModel());
    gh.factory<_i9.MainViewModel>(() => _i9.MainViewModel());
    gh.factory<_i10.RealTimeViewModel>(() => _i10.RealTimeViewModel());
    gh.factory<_i11.SavingsViewModel>(() => _i11.SavingsViewModel());
    gh.lazySingleton<_i12.HistoryRepository>(
        () => _i12.HistoryRepository(gh<_i5.HistoryService>()));
    gh.factory<_i13.PeakConsumptionViewModel>(
        () => _i13.PeakConsumptionViewModel(gh<_i12.HistoryRepository>()));
    return this;
  }
}
