import 'dart:typed_data';
import 'package:instagram_clone/commons/common_function.dart';
import 'package:instagram_clone/commons/firebase_constant.dart';

class StorageService {
  Future<String> storageImage({
    required String childImage,
    required Uint8List image,
    required bool isPost,
    required context,
  }) async {
    try {
      final currentUser = firebaseAuth.currentUser;
      if (currentUser == null) {
        throw CommonFunction.showSnackBar(
          context,
          "No user found",
        );
      }

      final reference =
          firestorage.ref().child(childImage).child(currentUser.uid);
      final uploadTask = reference.putData(image);
      final taskSnapshot = await uploadTask.whenComplete(() {});
      final downloadURL = await taskSnapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      throw CommonFunction.showSnackBar(
        context,
        "Failed to uplaod image",
      );
    }
  }
}
