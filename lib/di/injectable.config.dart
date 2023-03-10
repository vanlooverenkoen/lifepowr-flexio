// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flexio_kvl/repo/history/history_repository.dart' as _i14;
import 'package:flexio_kvl/service/history/history_asset_service.dart' as _i8;
import 'package:flexio_kvl/service/history/history_dummy_service.dart' as _i7;
import 'package:flexio_kvl/service/history/history_service.dart' as _i6;
import 'package:flexio_kvl/viewmodel/global/global_viewmodel.dart' as _i4;
import 'package:flexio_kvl/viewmodel/history/charts/custom_chart_peak_consumption_viewmodel.dart'
    as _i16;
import 'package:flexio_kvl/viewmodel/history/charts/fl_chart_peak_consumption_viewmodel.dart'
    as _i17;
import 'package:flexio_kvl/viewmodel/history/history_detail_viewmodel.dart'
    as _i5;
import 'package:flexio_kvl/viewmodel/history/history_viewmodel.dart' as _i9;
import 'package:flexio_kvl/viewmodel/history/monthly_history_viewmodel.dart'
    as _i15;
import 'package:flexio_kvl/viewmodel/home/ev_viewmodel.dart' as _i3;
import 'package:flexio_kvl/viewmodel/home/home_viewmodel.dart' as _i10;
import 'package:flexio_kvl/viewmodel/home/real_time_viewmodel.dart' as _i12;
import 'package:flexio_kvl/viewmodel/home/savings_viewmodel.dart' as _i13;
import 'package:flexio_kvl/viewmodel/main_viewmodel.dart' as _i11;
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
    gh.factory<_i5.HistoryDetailViewModel>(() => _i5.HistoryDetailViewModel());
    gh.lazySingleton<_i6.HistoryService>(
      () => _i7.HistoryDummyService(),
      instanceName: 'dummy_history_service',
    );
    gh.lazySingleton<_i6.HistoryService>(
      () => _i8.HistoryAssetService(),
      instanceName: 'asset_history_service',
    );
    gh.factory<_i9.HistoryViewModel>(() => _i9.HistoryViewModel());
    gh.factory<_i10.HomeViewModel>(() => _i10.HomeViewModel());
    gh.factory<_i11.MainViewModel>(() => _i11.MainViewModel());
    gh.factory<_i12.RealTimeViewModel>(() => _i12.RealTimeViewModel());
    gh.factory<_i13.SavingsViewModel>(() => _i13.SavingsViewModel());
    gh.lazySingleton<_i14.HistoryRepository>(() => _i14.HistoryRepository(
          gh<_i6.HistoryService>(instanceName: 'dummy_history_service'),
          gh<_i6.HistoryService>(instanceName: 'asset_history_service'),
        ));
    gh.factory<_i15.MonthlyHistoryViewModel>(
        () => _i15.MonthlyHistoryViewModel(gh<_i14.HistoryRepository>()));
    gh.factory<_i16.CustomChartPeakConsumptionViewModel>(() =>
        _i16.CustomChartPeakConsumptionViewModel(gh<_i14.HistoryRepository>()));
    gh.factory<_i17.FlChartPeakConsumptionViewModel>(() =>
        _i17.FlChartPeakConsumptionViewModel(gh<_i14.HistoryRepository>()));
    return this;
  }
}
