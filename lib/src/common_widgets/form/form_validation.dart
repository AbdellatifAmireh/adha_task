import 'package:adha_task/src/utils/string_extensions.dart';

String? validateEmail(String? val) {
  if (val == null ||
      val.trim().isEmpty ||
      !val.contains('@') ||
      val.isValidEmail == false) {
    return 'Please enter a valid email';
  }
  return null;
}

String? validatePass(val) {
  if (val == null || val.trim().length < 4) {
    return 'Please enter a valid Password';
  }
  return null;
}

String? validatePassConfirm(String? val, String? val2) {
  if (val == null || val.trim().length < 4) {
    return 'Please enter a valid Password';
  } else if (val.isMatchPass(val2) == false) {
    return 'Two passwords not the same';
  }
  return null;
}
