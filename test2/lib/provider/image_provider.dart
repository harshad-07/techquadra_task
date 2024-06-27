// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart' as path;
// // import 'package:dart:math' as math;
// import 'package:flutter/services.dart';

// import '../utils/constants/sizes.dart';

// class PickImageProvider with ChangeNotifier {
//   File? _imageFile;

//   File? get imageFile => _imageFile;

//   void setImageFile(File? image) {
//     _imageFile = image;
//     notifyListeners();
//   }

//   void clearImage() {
//     _imageFile = null;
//     notifyListeners();
//   }
// }

// // class PickImageProvider extends ChangeNotifier {

// //   File? _image;
// //   String? _fileName;
// //   String? _fileSize;
// //   String? _resolution;
// //   final picker = ImagePicker();

// //   File? get image => _image;
// //   String? get fileName => _fileName;
// //   String? get fileSize => _fileSize;
// //   String? get resolution => _resolution;

// //   Future<void> pickImage(ImageSource source) async {
// //     final pickedFile = await picker.pickImage(source: source);

// //     if (pickedFile != null) {
// //       _image = File(pickedFile.path);
// //       _fileName = path.basename(_image!.path);
// //       _fileSize = await _getFileSize(_image!.lengthSync(), 2);
// //       final image = await decodeImageFromList(_image!.readAsBytesSync());
// //       _resolution = '${image.width} x ${image.height}';
// //       notifyListeners();
// //     } else {
// //       print('No image selected.');
// //     }
// //   }

// //   Future<String> _getFileSize(int bytes, int decimals) async {
// //     if (bytes <= 0) return "0 B";
// //     const suffixes = ["B", "KB", "MB", "GB", "TB"];
// //     final i = (bytes == 0 ? 0 : (bytes.log() / 1024.log()).floor());
// //     final size = bytes / (1 << (i * 10));
// //     return "${size.toStringAsFixed(decimals)} ${suffixes[i]}";
// //   }

// //   void clearImage() {
// //     _image = null;
// //     _fileName = null;
// //     _fileSize = null;
// //     _resolution = null;
// //     notifyListeners();
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'dart:math' as math;

class PickImageProvider with ChangeNotifier {
  File? _image;
  String? _fileName;
  String? _fileSize;
  String? _resolution;
  final picker = ImagePicker();

  File? get image => _image;
  String? get fileName => _fileName;
  String? get fileSize => _fileSize;
  String? get resolution => _resolution;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _fileName = path.basename(_image!.path);
      _fileSize = await _getFileSize(_image!.lengthSync(), 2);
      final image = await decodeImageFromList(_image!.readAsBytesSync());
      _resolution = '${image.width} x ${image.height}';
      notifyListeners();
    } else {
      debugPrint('No image selected.');
    }
  }

  Future<String> _getFileSize(int bytes, int decimals) async {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    final i = (bytes == 0 ? 0 : (math.log(bytes) / math.log(1024)).floor());
    final size = bytes / math.pow(1024, i);
    return "${size.toStringAsFixed(decimals)} ${suffixes[i]}";
  }

  void clearImage() {
    _image = null;
    _fileName = null;
    _fileSize = null;
    _resolution = null;
    debugPrint('Image is cleared');
    notifyListeners();
  }
}
