import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirestorageHelper {
  FirestorageHelper._();
  static FirestorageHelper fireStorageHelper = FirestorageHelper._();
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  Future<String> uploadFile(File file) async {
    String filePath = file.path;
    String fileName = filePath.split('/').last;
    Reference reference = firebaseStorage.ref('images/foods/$fileName');
    await reference.putFile(file);
    String imageUrl = await reference.getDownloadURL();
    print('تم اضافة الصورة بنجاح');
    return imageUrl;
  }
}
