import 'dart:typed_data';

abstract class StorageRepository {

  Future<String> uploadImageToStorage(String childName, Uint8List file);
}
