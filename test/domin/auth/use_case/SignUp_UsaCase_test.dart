import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:project_one_c3_team/api/auth/request/SignUpRequest.dart';
import 'package:project_one_c3_team/core/errors/result/results.dart';
import 'package:project_one_c3_team/domin/auth/repositories/SignUp_reposetries.dart';
import 'package:project_one_c3_team/domin/auth/use_case/SignUp_UsaCase.dart';

import 'SignUp_UsaCase_test.mocks.dart';


@GenerateMocks([SignUp_Rpo])
void main() {
    provideDummy<Result<void>>(Success<void>(null));
  test('when call signUp_Usecase method then return success', () async {
    final mockSignUp_Rpo = MockSignUp_Rpo();
    final signUpUsaCase = SignUp_UsaCase(mockSignUp_Rpo);

    final request = SignUpRequest(
      username: 'testuser',
      firstName: 'Test',
      lastName: 'User',
    );

    when(mockSignUp_Rpo.signUp(request))
        .thenAnswer((_) async => const Success<void>(null));

    await signUpUsaCase.signUp(request);

    verify(mockSignUp_Rpo.signUp(request)).called(1);
  });
}
