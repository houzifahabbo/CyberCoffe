import 'package:firebase_storage/firebase_storage.dart';

class StorageServices{
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> downloadURL(String imageName) async {
    String downloadURL= await storage.ref(imageName).getDownloadURL();
    return downloadURL;
  }
}