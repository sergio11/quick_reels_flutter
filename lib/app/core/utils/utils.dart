import 'package:image_picker/image_picker.dart';

// for picking up image from gallery
pickImageAsBytes(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes();
  }
}

Future<XFile?> pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  return await imagePicker.pickImage(source: source);
}