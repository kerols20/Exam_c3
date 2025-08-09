import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';
import 'package:project_one_c3_team/api/auth/data_source_impl/SignUp_Data_Source_Imp.dart';
import 'package:project_one_c3_team/api/auth/request/SignUpRequest.dart';
import 'package:project_one_c3_team/core/errors/handlers/auth_error_handler.dart';

import '../../home/Data_Source_Imp/change_password_data_source_impl_test.mocks.dart';
import 'SignUp_Data_Source_Imp_test.mocks.dart' hide MockApiClient;
@GenerateMocks([ApiClient, AuthErrorHandler])
void main() {
  test('when call signUp method then return success', () async {
    // Arrange
    final mockApiClient = MockApiClient();
    final mockErrorHandler = MockAuthErrorHandler();
    final signUpDataSource = SidnUp_Data_Source_Imp(mockApiClient, mockErrorHandler);

    final request = SignUpRequest(
      username: 'testuser',
      firstName: 'Test',
      lastName: 'User',
    );
    // Stub the signUp call
    when(mockApiClient.signUp(any)).thenAnswer((_) async {
      // simulate success (void)
    });
    // Act
    await signUpDataSource.signUp(request);

    // Assert
    verify(mockApiClient.signUp(any)).called(1);
  });
}