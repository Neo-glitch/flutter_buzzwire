import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceOption {
  final ImageSource source;
  final String title;
  final IconData iconData;

  ImageSourceOption({
    required this.source,
    required this.title,
    required this.iconData,
  });

  static List<ImageSourceOption> getImageSources() {
    return [
      ImageSourceOption(
        source: ImageSource.gallery,
        title: 'Gallery',
        iconData: FontAwesomeIcons.images,
      ),
      ImageSourceOption(
        source: ImageSource.camera,
        title: 'Camera',
        iconData: FontAwesomeIcons.camera,
      ),
    ];
  }
}
