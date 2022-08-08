class ValidationMixin {
  String? validateEmail(String? value) {
    if (value != null && !value.contains('@')) {
      return 'It doesn\'t seem to be a valid e-mail';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value != null && value.length < 4) {
      return 'Password must be at least 4 characters.';
    }

    return null;
  }
}
