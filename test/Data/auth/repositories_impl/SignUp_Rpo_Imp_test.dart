import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:project_one_c3_team/Data/auth/data_source/SignUp_Data_Source.dart';
import 'package:project_one_c3_team/Data/auth/repositories_impl/SignUp_Rpo_Imp.dart';
import 'package:project_one_c3_team/api/auth/request/SignUpRequest.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';

import 'SignUp_Rpo_Imp_test.mocks.dart';
@GenerateMocks([SignUpDataSource])
void main() {
  provideDummy<Result<void>>(Success<void>(null));
  test('when call signUp method then return success', ()async {
    MockSignUpDataSource mockSignUpDataSource = MockSignUpDataSource();
    SignUp_Rpo_Imp signUpRpoImp = SignUp_Rpo_Imp(mockSignUpDataSource);
    final request = SignUpRequest(
      username: 'testuser',
      firstName: 'Test',
      lastName: 'User',
    );
    when(mockSignUpDataSource.signUp(request))
        .thenAnswer((_) async => const Success<void>(null));
    await signUpRpoImp.signUp(request);
    verify(mockSignUpDataSource.signUp(request)).called(1);
  });
}
