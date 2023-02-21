// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flexio_kvl/viewmodel/global/global_viewmodel.dart' as _i4;
import 'package:flexio_kvl/viewmodel/home/ev_viewmodel.dart' as _i3;
import 'package:flexio_kvl/viewmodel/home/home_viewmodel.dart' as _i5;
import 'package:flexio_kvl/viewmodel/home/real_time_viewmodel.dart' as _i7;
import 'package:flexio_kvl/viewmodel/home/savings_viewmodel.dart' as _i8;
import 'package:flexio_kvl/viewmodel/main_viewmodel.dart' as _i6;
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
    gh.factory<_i5.HomeViewModel>(() => _i5.HomeViewModel());
    gh.factory<_i6.MainViewModel>(() => _i6.MainViewModel());
    gh.factory<_i7.RealTimeViewModel>(() => _i7.RealTimeViewModel());
    gh.factory<_i8.SavingsViewModel>(() => _i8.SavingsViewModel());
    return this;
  }
}
