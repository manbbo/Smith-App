// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:smith/checkout/presentation/cubit/checkoutcubit.dart' as _i5;
import 'package:smith/core/data/repository/smith_main_repository.dart' as _i4;
import 'package:smith/core/data/service/smith_main_service.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.SmithMainService>(() => _i3.SmithMainServiceImpl());
    gh.factory<_i4.SmithMainRepository>(
        () => _i4.SmithMainRepositoryImpl(gh<_i3.SmithMainService>()));
    gh.factory<_i5.CheckoutCubit>(
        () => _i5.CheckoutCubitImpl(gh<_i4.SmithMainRepository>()));
    return this;
  }
}
