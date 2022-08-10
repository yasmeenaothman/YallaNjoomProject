import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yalla_njoom/screens/user_type_screen.dart';

import '../providers/firestore_provider.dart';
import '../routers/app_router.dart';
import '../widgets/confirm_button_widget.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/scaffold_with_background.dart';
import 'enter_your_code_screen.dart';

class DoYouHaveAccScreen extends StatefulWidget {
  const DoYouHaveAccScreen({
    Key? key,
  }) : super(key: key);
  static const String routeName = 'DoYouHaveAccScreen';

  @override
  State<DoYouHaveAccScreen> createState() => _DoYouHaveAccScreenState();
}

class _DoYouHaveAccScreenState extends State<DoYouHaveAccScreen> {
  FirestoreProvider? provider;
  @override
  void initState() {
    // TODO: implement initState
    provider=Provider.of<FirestoreProvider>(context,listen: false);

    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    provider!.audioPlayer.stop();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    provider!.playEncourageAudio('assets/audio/هل لديك حساب.mp3');
    return ScaffoldWithBackground(
      body: Column(
        children: [
          SizedBox(
            height: 260.h,
          ),
          CustomDialog(
            text: 'هل لديك حساب؟',
            spaceBeforeWidget: 20.h,
            widget: ConfirmButtonWidget(
              confirmButtonFun: () {
                AppRouter.router.pushNamedFunction(
                    EnterYourCodeScreen.routeName);
              },
              confirmButtonText: 'نعم',
              cancelButtonFun: () {
                AppRouter.router.pushNamedFunction(UserTypeScreen.routeName);
              },
              cancelButtonText: 'لا',
            ),
            imagePath: 'assets/images/glasses_star.png',
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ],
      ),
    );
  }
}
