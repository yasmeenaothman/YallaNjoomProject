import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirestorageHelper {
  FirestorageHelper._();
  static FirestorageHelper firestorageHelper = FirestorageHelper._();
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<dynamic> uploadImage(
    File file,
  ) async {
    String filePath = file.path;
    String fileName = filePath.split('/').last;
    String path = 'images/childrenImages/$fileName';

    return getUrl(path: path, file: file);
  }

  selectFile() async {
    XFile? imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFile == null) {
      return;
    } else {
      File file = File(imageFile.path);
      return file;
    }
  }

  getUrl({required String path, required File file}) async {
    Reference reference = firebaseStorage.ref(path);
    await reference.putFile(file);
    String imageUrl = await reference.getDownloadURL();
    return imageUrl;
  }

  getDefaultChildImageUrl() async {
    Reference reference =
        firebaseStorage.ref('images/childrenImages/kid_img.png');

    String imageUrl = await reference.getDownloadURL();
    return imageUrl;
  }
}
