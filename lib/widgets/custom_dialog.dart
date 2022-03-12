import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Center(
      child: GestureDetector(
        onTap: () => showCustomDialog(
          context,
          theme,
          text: 'هل لديك حساب؟',
          imagePath: 'assets/images/glasses_star.png',
          position: 130,
          crossAxisAlignment: CrossAxisAlignment.start,
          widget: Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'نعم',
                        style: theme.textTheme.headline2!
                            .copyWith(color: Colors.white),
                      ))),
              const SizedBox(
                width: 23,
              ),
              Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => theme.colorScheme.secondary)),
                      onPressed: () {},
                      child: Text(
                        'لا',
                        style: theme.textTheme.headline2!
                            .copyWith(color: Colors.red),
                      ))),
            ],
          ),
        ),
        child: Container(
          child: Text('Hi I am Wafaa?'),
        ),
      ),
    );
  }

  showCustomDialog(BuildContext context, ThemeData theme,
      {required String text,
      required Widget widget,
      required double position,
      required String imagePath,
      required CrossAxisAlignment crossAxisAlignment}) {
    return showDialog(
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(bottom: 70, child: Image.asset(imagePath)),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 20,
                    ),
                    width: 325,
                    height: 149,
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
                          text,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        widget
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
