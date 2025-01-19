
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

uploadImageToAPI(XFile image) {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}
