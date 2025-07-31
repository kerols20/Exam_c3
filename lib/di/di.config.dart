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
import '../api/auth/data_source_impl/ForgotPasswordRemoteDataSourceImpl.dart'
    as _i122;
import '../api/auth/data_source_impl/ResetPasswordRemoteDataSourceImpl.dart'
    as _i899;
import '../api/auth/data_source_impl/SignInRemoteDataSourceImpl.dart' as _i273;
import '../api/auth/data_source_impl/SignUp_Data_Source_Imp.dart' as _i750;
import '../api/auth/data_source_impl/VerifyResetCodeDataSourceImpl.dart'
    as _i974;
import '../api/home/Data_Source_Imp/Get_subjects_Data_Source_Imp.dart' as _i596;
import '../api/home/Data_Source_Imp/get_user_info_remote_data_source_impl.dart'
    as _i520;
import '../Data/auth/data_source/ForgotPasswordRemoteDataSource.dart' as _i863;
import '../Data/auth/data_source/ResetPasswordRemoteDataSource.dart' as _i920;
import '../Data/auth/data_source/SignInRemoteDataSource.dart' as _i445;
import '../Data/auth/data_source/SignUp_Data_Source.dart' as _i476;
import '../Data/auth/data_source/verifyResetCodeDataSource.dart' as _i946;
import '../Data/auth/repositories_impl/ForgotPasswordRepoImpl.dar.dart'
    as _i953;
import '../Data/auth/repositories_impl/ResetPasswordRepoImpl.dart' as _i337;
import '../Data/auth/repositories_impl/SignInRepoImpl.dart' as _i2;
import '../Data/auth/repositories_impl/SignUp_Rpo_Imp.dart' as _i506;
import '../Data/auth/repositories_impl/VerifyResetCodeRepoImpl.dart' as _i921;
import '../Data/home/Data_Source/Get_subjects_Data_Source.dart' as _i29;
import '../Data/home/Data_Source/get_user_info_data_source.dart' as _i533;
import '../Data/home/repositries_Imp/Get_subjects_Rpo_Imp.dart' as _i938;
import '../Data/home/repositries_Imp/get_user_info_repo_impl.dart' as _i315;
import '../domin/auth/repositories/forgot_password_reposetories.dart' as _i153;
import '../domin/auth/repositories/Reset_password_reposetories.dart' as _i1033;
import '../domin/auth/repositories/sign_in_reposetories.dart' as _i982;
import '../domin/auth/repositories/SignUp_reposetries.dart' as _i592;
import '../domin/auth/repositories/verify_reset_code.dart' as _i100;
import '../domin/auth/use_case/ForgotPasswordUseCase.dart' as _i1067;
import '../domin/auth/use_case/ResetPasswordUseCase.dart' as _i854;
import '../domin/auth/use_case/SignInUseCase.dart' as _i1049;
import '../domin/auth/use_case/SignUp_UsaCase.dart' as _i929;
import '../domin/auth/use_case/VerifyResetCodeUseCase.dart' as _i397;
import '../domin/home/repositries/Get_subjects_Rpositeries.dart' as _i238;
import '../domin/home/repositries/get_user_info_repository.dart' as _i345;
import '../domin/home/UsaCase/Get_subjects_Use_Case.dart' as _i958;
import '../domin/home/UsaCase/get_user_info_use_case.dart' as _i471;
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
    gh.factory<_i946.VerifyResetCodeRemoteDataSource>(
      () => _i974.VerifyResetCodeRemoteDataSourceImpl(gh<_i875.ApiClient>()),
    );
    gh.factory<_i100.VerifyResetCodeReposetories>(
      () => _i921.VerifyResetCodeRepoImp(
        gh<_i946.VerifyResetCodeRemoteDataSource>(),
      ),
    );
    gh.factory<_i476.SignUpDataSource>(
      () => _i750.SidnUp_Data_Source_Imp(gh<_i875.ApiClient>()),
    );
    gh.factory<_i592.SignUp_Rpo>(
      () => _i506.SignUp_Rpo_Imp(gh<_i476.SignUpDataSource>()),
    );
    gh.factory<_i533.GetUserInfoDataSource>(
      () => _i520.GetUserInfoRemoteDataSourceImpl(gh<_i875.ApiClient>()),
    );
    gh.factory<_i445.SignInRemoteDataSource>(
      () => _i273.Signinremotedatasourceimpl(gh<_i875.ApiClient>()),
    );
    gh.factory<_i863.ForgotPasswordRemoteDataSource>(
      () => _i122.ForgotPasswordRemoteDataSourceImpl(gh<_i875.ApiClient>()),
    );
    gh.factory<_i920.ResetPasswordRemoteDataSource>(
      () => _i899.ResetPasswordRemoteDataSourceImpl(gh<_i875.ApiClient>()),
    );
    gh.factory<_i29.Get_subjects_Data_Source>(
      () => _i596.Get_subjects_Data_Source_Imp(gh<_i875.ApiClient>()),
    );
    gh.factory<_i345.GetUserInfoRepository>(
      () => _i315.GetUserInfoRepoImpl(gh<_i533.GetUserInfoDataSource>()),
    );
    gh.factory<_i1033.ResetPasswordReposetories>(
      () =>
          _i337.ResetPasswordRepoImp(gh<_i920.ResetPasswordRemoteDataSource>()),
    );
    gh.factory<_i471.GetUserInfoUseCase>(
      () => _i471.GetUserInfoUseCase(gh<_i345.GetUserInfoRepository>()),
    );
    gh.factory<_i397.VerifyResetCodeUseCase>(
      () =>
          _i397.VerifyResetCodeUseCase(gh<_i100.VerifyResetCodeReposetories>()),
    );
    gh.factory<_i929.SignUp_UsaCase>(
      () => _i929.SignUp_UsaCase(gh<_i592.SignUp_Rpo>()),
    );
    gh.factory<_i854.ResetPasswordUseCase>(
      () => _i854.ResetPasswordUseCase(gh<_i1033.ResetPasswordReposetories>()),
    );
    gh.factory<_i153.ForgotPasswordReposetories>(
      () => _i953.ForgotPasswordRepoImpl(
        gh<_i863.ForgotPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i238.Get_subjects_Rpo>(
      () => _i938.Get_subjects_Rpo_Imp(gh<_i29.Get_subjects_Data_Source>()),
    );
    gh.factory<_i1067.ForgotPasswordUseCase>(
      () =>
          _i1067.ForgotPasswordUseCase(gh<_i153.ForgotPasswordReposetories>()),
    );
    gh.factory<_i982.SignInRepositories>(
      () => _i2.SignInRepoImpl(gh<_i445.SignInRemoteDataSource>()),
    );
    gh.factory<_i958.Get_subject_Use_Case>(
      () => _i958.Get_subject_Use_Case(gh<_i238.Get_subjects_Rpo>()),
    );
    gh.factory<_i1049.SignInUseCase>(
      () => _i1049.SignInUseCase(gh<_i982.SignInRepositories>()),
    );
    gh.factory<_i648.Viwe_Model>(
      () => _i648.Viwe_Model(
        gh<_i929.SignUp_UsaCase>(),
        gh<_i1049.SignInUseCase>(),
        gh<_i958.Get_subject_Use_Case>(),
        gh<_i1067.ForgotPasswordUseCase>(),
        gh<_i397.VerifyResetCodeUseCase>(),
        gh<_i854.ResetPasswordUseCase>(),
        gh<_i471.GetUserInfoUseCase>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
