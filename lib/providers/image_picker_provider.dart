import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_image_picker/models/image_model.dart';

class ImagePickerProvider extends ChangeNotifier {
  List<ImageModel> _selectedImages = [];

  List<ImageModel> get selectedImages => _selectedImages;

  Future<void> pickImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? images = await _picker.pickMultiImage();

    if (images != null) {
      _selectedImages.addAll(images.map((image) => ImageModel(path: image.path)));
      notifyListeners();
    }
  }

  void removeImage(ImageModel image) {
    _selectedImages.remove(image);
    notifyListeners();
  }
}
