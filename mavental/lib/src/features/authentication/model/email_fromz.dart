import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:mavental/src/localization/localization_utils.dart';
import 'form_error.dart';

class EmailFormzInput extends FormzInput<String, FormError> {
  const EmailFormzInput.pure([String value = '']) : super.pure(value);
  const EmailFormzInput.dirty([String value = '']) : super.dirty(value);

  static final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  FormError? validator(String? value) {
    if ((value ?? '').isEmpty) {
      return FormError.empty;
    }
    return emailRegExp.hasMatch(value ?? '') ? null : FormError.invalid;
  }

  String? errorOf(BuildContext context) {
    if (isPure) {
      return null;
    }

    switch (error) {
      case FormError.empty:
        return S.of(context).error_fieldRequired;
      case FormError.invalid:
        return "Email Invalid";
      default:
        return null;
    }
  }
}
