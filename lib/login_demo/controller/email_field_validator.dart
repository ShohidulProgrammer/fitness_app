class EmailFieldValidator {
  static String validate(String value) {
    if (value.trim().isEmpty) {
      return 'Email can\'t be empty';
    }
    return !isEmail(value) ? 'Invalid Email!' : null;
  }

  static bool isEmail(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(pattern);

    return regExp.hasMatch(email);
  }
}
