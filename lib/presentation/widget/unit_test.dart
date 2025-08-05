class unit_testing{
  bool isValidPassword(String? password) {
    if (password == null || password.isEmpty) {
      return false;
    }
    if(!password.contains(RegExp(r'[A-Z]'))){
      return false;
    }
    if(!password.contains(RegExp(r'[a-z]'))){
      return false;
    }
    if(!password.contains(RegExp(r'[0-9]'))){
      return false;
    }
    if(!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return false;
    }
    return true;
  }
}