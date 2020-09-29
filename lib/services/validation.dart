class Validator {
  String emailValidator(String value) {
    Pattern pattern = r"[^@\t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+";
    bool validEmail = RegExp(pattern).hasMatch(value);

    return !validEmail ? 'Invalid email' : null;
  }

  String passwordValidator(String value) {
    return value.length < 6 ? 'Password too short' : null;
  }

  String firstNameValidator(String value) {
    return (value.isEmpty) ? 'Enter valid first name' : null;
  }

  String lastNameValidator(String value) {
    return (value.length < 2 ||
            value.isEmpty ||
            value.contains(RegExp(r'[0-9]')))
        ? 'Enter valid last name'
        : null;
  }

  String phoneNameValidator(String value) {
    return (value.isEmpty) ? 'Enter valid first name' : null;
  }

  String zipNameValidator(String value) {
    return (value.isEmpty) ? 'Enter valid first name' : null;
  }

  String notEmptyValidator(String value, String text) {
    return (value.isEmpty) ? 'Enter valid $text' : null;
  }
}
