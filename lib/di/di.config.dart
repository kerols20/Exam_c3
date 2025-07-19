// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/api_clint/Api_Clint.dart' as _i875;
import '../api/Data_Source_Imp/ForgotPasswordRemoteDataSourceImpl.dart'
    as _i626;
import '../api/Data_Source_Imp/SignInRemoteDataSourceImpl.dart' as _i254;
import '../api/Data_Source_Imp/SignUp_Data_Source_Imp.dart' as _i932;
import '../Data/Data_Source/ForgotPasswordRemoteDataSource.dart' as _i266;
import '../Data/Data_Source/SignInRemoteDataSource.dart' as _i482;
import '../Data/Data_Source/SignUp_Data_Source.dart' as _i531;
import '../Data/repositries_Imp/ForgotPasswordRepoImpl.dart' as _i830;
import '../Data/repositries_Imp/SignInRepoImpl.dart' as _i856;
import '../Data/repositries_Imp/SignUp_Rpo_Imp.dart' as _i455;
import '../domin/repositries/forgot_password_reposetories.dart' as _i353;
import '../domin/repositries/sign_in_reposetories.dart' as _i632;
import '../domin/repositries/SignUp_reposetries.dart' as _i664;
import '../domin/UsaCase/ForgotPasswordUseCase.dart' as _i766;
import '../domin/UsaCase/SignInUseCase.dart' as _i197;
import '../domin/UsaCase/SignUp_UsaCase.dart' as _i583;
import '../viweModel/viweModel.dart' as _i648;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i875.ApiClient>(
      () => appModule.provideApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i482.SignInRemoteDataSource>(
      () => _i254.Signinremotedatasourceimpl(gh<_i875.ApiClient>()),
    );
    gh.factory<_i531.SignUpDataSource>(
      () => _i932.SidnUp_Data_Source_Imp(gh<_i875.ApiClient>()),
    );
    gh.factory<_i266.ForgotPasswordRemoteDataSource>(
      () => _i626.ForgotPasswordRemoteDataSourceImpl(gh<_i875.ApiClient>()),
    );
    gh.factory<_i632.SignInRepositories>(
      () => _i856.SignInRepoImpl(gh<_i482.SignInRemoteDataSource>()),
    );
    gh.factory<_i353.ForgotPasswordReposetories>(
      () => _i830.ForgotPasswordRepoImpl(
        gh<_i266.ForgotPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i766.ForgotPasswordUseCase>(
      () => _i766.ForgotPasswordUseCase(gh<_i353.ForgotPasswordReposetories>()),
    );
    gh.factory<_i664.SignUp_Rpo>(
      () => _i455.SignUp_Rpo_Imp(gh<_i531.SignUpDataSource>()),
    );
    gh.factory<_i197.SignInUseCase>(
      () => _i197.SignInUseCase(gh<_i632.SignInRepositories>()),
    );
    gh.factory<_i583.SignUp_UsaCase>(
      () => _i583.SignUp_UsaCase(gh<_i664.SignUp_Rpo>()),
    );
    gh.factory<_i648.ViewModel>(
      () => _i648.ViewModel(
        gh<_i583.SignUp_UsaCase>(),
        gh<_i197.SignInUseCase>(),
        gh<_i766.ForgotPasswordUseCase>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
