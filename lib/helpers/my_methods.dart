import 'dart:math';

import 'package:provider/provider.dart';

import '../providers/firestore_provider.dart';

generateNewCode(context) {
  List codes = Provider.of<FirestoreProvider>(context, listen: false).codes;
  String code = (Random().nextInt(9999) + 1000).toString();
  while (codes.contains(code)) {
    code = (Random().nextInt(8999) + 1000).toString();
  }

  return code;
}
