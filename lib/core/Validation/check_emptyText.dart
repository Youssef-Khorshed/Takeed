import 'dart:io';

class Checktext {
  static String? validateEmptyText(String? value, String valueName) {
    if (value!.isEmpty) {
      return 'Please enter your $valueName';
    }
    return null;
  }

  static bool isValidDate(String date) {
    RegExp regExp = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!regExp.hasMatch(date)) {
      return false;
    }

    try {
      DateTime parsedDate = DateTime.parse(date);
      return parsedDate.toString().startsWith(date);
    } catch (e) {
      return false;
    }
  }

  static bool isValidEmail(String email) {
    RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regExp.hasMatch(email);
  }

  static emailValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Email';
    }
    if (!Checktext.isValidEmail(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  static birthDateValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a date';
    }
    if (!Checktext.isValidDate(value)) {
      return 'Invalid date format. Please use YYYY-MM-DD';
    }
    return null;
  }

  static String getDeviceType() {
    if (Platform.isAndroid) {
      return 'MOBILE';
    } else if (Platform.isIOS) {
      return 'MOBILE';
    } else {
      return 'TABLET';
    }
  }
}
