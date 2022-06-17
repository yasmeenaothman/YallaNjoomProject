import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'default_elevated_button.dart';

class ConfirmButtonWidget extends StatelessWidget {
  const ConfirmButtonWidget({
    Key? key,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.confirmButtonFun,
    required this.cancelButtonFun,
  }) : super(key: key);

  final String confirmButtonText;
  final String cancelButtonText;
  final Function() confirmButtonFun;
  final Function() cancelButtonFun;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
            child: DefaultElevatedButton(
          width: 0,
          height: 44.h,
          radius: 12.r,
          onPressed: confirmButtonFun,
          child: Text(
            confirmButtonText,
            style: theme.textTheme.headline3!.copyWith(color: Colors.white),
          ),
        )),
        SizedBox(
          width: 20.w,
        ),
        Expanded(
            child: DefaultElevatedButton(
          width: 0,
          height: 44.h,
          radius: 12.r,
          child: Text(
            cancelButtonText,
            style: theme.textTheme.headline3!.copyWith(color: Colors.red),
          ),
          onPressed: cancelButtonFun,
          bgColor: theme.colorScheme.secondary,
        )),
      ],
    );
  }
}
