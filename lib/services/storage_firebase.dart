import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram_clone/commons/common_function.dart';
import 'package:instagram_clone/commons/firebase_constant.dart';
import 'package:uuid/uuid.dart';

class StorageService {
  Future<String> storageImage({
    required String imageFolderName,
    required Uint8List image,
    required bool isPost,
    required context,
  }) async {
    try {
      if (currentUID == null) {
        throw CommonFunction.showSnackBar(
          context,
          "No user found",
        );
      }

      Reference reference =
          firestorage.ref().child(imageFolderName).child(currentUID);

      if (isPost) {
        String id = const Uuid().v1();
        reference = reference.child(id);
      }
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
