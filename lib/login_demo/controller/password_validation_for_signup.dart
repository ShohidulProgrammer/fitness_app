class PasswordFieldValidatorForSignup {
  // Password validation function
  static String validate(String password) {
    String errorMsg;

    if (password.isEmpty) {
      errorMsg = 'Password can\'t be empty\n';
    } else {
      if (password.length < 6) {
        errorMsg = 'Please! Input at least 6 charecters';
      }
      if (!hasSpecialCharacter(password)) {
        errorMsg != null
            ? errorMsg = '$errorMsg\nInput at least One Special Character'
            : errorMsg = 'Input at least One Special Character';
      }
      if (!hasUppercase(password)) {
        errorMsg != null
            ? errorMsg = '$errorMsg\nInput at least One Capital Letter'
            : errorMsg = 'Input at least One Capital Letter';
      }
      if (!hasLowercase(password)) {
        errorMsg != null
            ? errorMsg = '$errorMsg\nInput at least One Small Letter'
            : errorMsg = 'Input at least One Small Letter';
      }
      if (!hasDigit(password)) {
        errorMsg != null
            ? errorMsg = '$errorMsg\nInput at least One Digit'
            : errorMsg = 'Input at least One Digit';
      }
    }

    return errorMsg;
  }

  static bool hasSpecialCharacter(String password) {
    bool hasSpecialCharacters = false;
    hasSpecialCharacters =
        password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    return hasSpecialCharacters;
  }

  static bool hasUppercase(String password) {
    bool hasUppercases = false;
    hasUppercases = password.contains(new RegExp(r'[A-Z\s]+'));
    return hasUppercases;
  }

  static bool hasLowercase(String password) {
    bool hasLowercases = false;
    hasLowercases = password.contains(new RegExp(r'[a-z\s]+'));
    return hasLowercases;
  }

  static bool hasDigit(String password) {
    bool hasDigits = false;
    hasDigits = password.contains(new RegExp(r'[0-9\s]+'));
    return hasDigits;
  }
}
