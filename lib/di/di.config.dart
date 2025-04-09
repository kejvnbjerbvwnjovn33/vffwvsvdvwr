// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:in_app_review/in_app_review.dart' as _i553;
import 'package:injectable/injectable.dart' as _i526;

import '../common/services/music_service.dart' as _i431;
import '../presentation/bloc/levels_bloc.dart' as _i46;
import '../presentation/bloc/music_bloc.dart' as _i651;
import '../presentation/bloc/quiz_bloc.dart' as _i337;
import 'register_module.dart' as _i291;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i46.LevelsBloc>(() => _i46.LevelsBloc());
  gh.factory<_i651.MusicBloc>(() => _i651.MusicBloc());
  gh.singleton<_i553.InAppReview>(() => registerModule.inAppReview);
  gh.singleton<_i431.MusicService>(() => _i431.MusicService());
  gh.factoryParam<_i337.GameBloc, int, dynamic>((
    gridSize,
    _,
  ) =>
      _i337.GameBloc(gridSize));
  return getIt;
}

class _$RegisterModule extends _i291.RegisterModule {}
