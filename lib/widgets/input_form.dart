import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final String? labelText, hintText, errorText, helperText, value;
  final IconData? icon;
  final bool focused, autoValidation, readOnly;
  final TextInputType keyboardType;
  final bool isRequired;

  const InputForm(
      {Key? key,
      this.labelText = '',
      required this.hintText,
      this.errorText = '',
      this.helperText = '',
      this.value = '',
      this.icon,
      this.focused = false,
      this.autoValidation = false,
      this.readOnly = false,
      this.keyboardType = TextInputType.text,
      this.isRequired = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      autofocus: focused,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.words,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: icon != null ? Icon(icon) : null,
        helperText: helperText,
      ),
      validator: isRequired ? (value) => onValidate(value ?? '') : null,
      autovalidateMode: isRequired
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
    );
  }

  String? onValidate(String value) {
    if (value.isEmpty) {
      return 'This $hintText field is required.';
    }
    return null;
  }
}
