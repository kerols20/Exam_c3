import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:project_one_c3_team/api/api_clint/Api_Clint.dart';
import 'package:project_one_c3_team/api/home/Data_Source_Imp/change_password_data_source_impl.dart';
import 'package:project_one_c3_team/api/home/request/change_password_request.dart';
import 'package:project_one_c3_team/api/home/response/change_profile_password_response.dart';
import 'change_password_data_source_impl_test.mocks.dart';
@GenerateMocks([
  ApiClient
])
void main() {
  test('when  call Change_password method then return success', ()async {
    MockApiClient mockApiClient = MockApiClient();
    ChangePasswordDataSourceImpl changePasswordDataSourceImpl = ChangePasswordDataSourceImpl(mockApiClient);
    ChangePasswordRequest changePasswordRequest = ChangePasswordRequest(
      rePassword: "test",
      oldPassword: "test",
      password: "test",
    );
    final fakeResponse = ChangeProfilePasswordResponse(
      message: "success", token: '',
    );
    when(mockApiClient.changePassword( "token",changePasswordRequest)).thenAnswer((_) async => fakeResponse);
    await changePasswordDataSourceImpl.changePassword("token",changePasswordRequest);
    verify(mockApiClient.changePassword("token",changePasswordRequest)).called(1);
  });
}