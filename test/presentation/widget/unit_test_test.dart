import 'package:flutter_test/flutter_test.dart';
import 'package:project_one_c3_team/presentation/widget/unit_test.dart';

void main() {
group("unit_testing Group", () {
  test("when call function unit_testing must return true", () {
    // Arrange prepare test Data
    var password = "123Z23@#SW33assqs";
    // Act call function
    unit_testing unit = unit_testing();
    var result = unit.isValidPassword(password);
    // Assert check result
    expect(result, true);
  },);
  test("when call function unit_testing must return false", () {
    // Arrange prepare test Data
    var password = "";
    // Act call function
    unit_testing unit = unit_testing();
    var result = unit.isValidPassword(password);
    // Assert check result
    expect(result, false);
  });
},);
}