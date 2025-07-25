class Validators {
  static String? required(String? value) {
    return (value == null || value.trim().isEmpty) ? 'Required' : null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value) ? null : 'Invalid email';
  }

  static String? passwordMatch(String? value,) {
    if (value == null || value.isEmpty) return 'Required';
  }
  static String? name(String? value) {
    if (value == null || value.isEmpty) return 'Required';
    final nameRegex = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$');
    return nameRegex.hasMatch(value) ? null : 'Invalid name';
  }
  static String? phone(String? value) {
    if (value == null || value.isEmpty)
      return 'Required';
    else if (value.length != 11)
      return 'Invalid phone number';
    else
      return null;
  }
}
