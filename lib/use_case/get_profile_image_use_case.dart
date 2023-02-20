import 'package:image_picker/image_picker.dart';
class GetProfileImageUseCase {
  Future<XFile?> call({required ImageSource source}) async {
    var image = await ImagePicker().pickImage(source: source);
    return image;
  }
}