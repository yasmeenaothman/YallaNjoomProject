import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeWidget extends StatelessWidget {
  const PinCodeWidget({Key? key, required this.onChanged}) : super(key: key);
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0.0,
      color: theme.colorScheme.secondary,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: PinCodeTextField(
           
          autoDismissKeyboard: false,
          autoFocus: true,
          pinTheme: PinTheme(
              disabledColor: theme.primaryColor,
              selectedColor: theme.primaryColor,
              errorBorderColor: theme.primaryColor,
              selectedFillColor: theme.primaryColor,
              activeColor: theme.primaryColor,
              inactiveColor: theme.primaryColor,
              activeFillColor: theme.primaryColor,
              inactiveFillColor: theme.primaryColor),
          onChanged: onChanged,
          appContext: context,
          length: 4,
          cursorColor: theme.primaryColor,
          textStyle: TextStyle(color: theme.primaryColor),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }
}
