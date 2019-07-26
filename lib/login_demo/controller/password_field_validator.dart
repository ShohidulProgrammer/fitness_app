class PasswordFieldValidator {
  static String validate(String value) {
    String msg;
    if (value.isEmpty) {
      msg = 'Password can\'t be empty';
      return msg;
    }
    // if (value.contains()) ;
    return value.length < 6 ? 'Please! Input at least 6 charecters' : null;
  }
}


