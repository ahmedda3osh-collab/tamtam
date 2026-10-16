import 'package:easy_localization/easy_localization.dart';

class AppValidators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'name_required'.tr();
    }
    if (value.trim().length < 2) {
      return 'name_too_short'.tr();
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'phone_required'.tr();
    }
    final trimmed = value.trim();
    final phoneRegex = RegExp(r'^[0-9+]{9,15}$');
    if (!phoneRegex.hasMatch(trimmed)) {
      return 'phone_invalid'.tr();
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'email_required'.tr();
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'email_invalid'.tr();
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'password_required'.tr();
    }
    if (value.length < 6) {
      return 'password_too_short'.tr();
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? value, String originalPassword) {
    if (value == null || value.isEmpty) {
      return 'confirm_password_required'.tr();
    }
    if (value != originalPassword) {
      return 'passwords_do_not_match'.tr();
    }
    return null;
  }

  static String? validateDateOfBirth(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'dob_required'.tr();
    }
    return null;
  }
}
