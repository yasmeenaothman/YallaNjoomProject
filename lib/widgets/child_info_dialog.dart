import 'package:flutter/material.dart';
import 'package:yalla_njoom/widgets/pin_code_widget.dart';

class ChildInfoDialog extends StatelessWidget {
  const ChildInfoDialog(
      {Key? key, required this.onCodeChanged, required this.onNameChanged})
      : super(key: key);
  final Function(String) onNameChanged;
  final Function(String) onCodeChanged;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned(
                bottom: 195, child: Image.asset('assets/images/hat_star.png')),
            Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              width: 325,
              height: 250,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: theme.primaryColor,
                  width: 3.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'اسم الطفل:',
                    style: theme.textTheme.headline2,
                  ),
                  TextField(
                    onChanged: onNameChanged,
                    cursorColor: theme.primaryColor,
                    autofocus: true,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: theme.primaryColor)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: theme.primaryColor)),
                    ),
                    style: theme.textTheme.headline3,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'رمز الطفل:',
                    style: theme.textTheme.headline2,
                  ),
                  PinCodeWidget(
                    onChanged: onCodeChanged,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
