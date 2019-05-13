import 'package:cloud_firestore/cloud_firestore.dart' as _cloud;
import 'package:firebase_storage/firebase_storage.dart' as _storage;

  Future<String> imagePath(_cloud.DocumentReference path) async {
    String pathFormateada = '/'+path.path.split('/')[1];
    return await _storage.FirebaseStorage.instance.ref().child(pathFormateada).getDownloadURL();
  }
