import 'dart:io';

import 'package:chef_app_project/core/utils/app_assets.dart';
import 'package:chef_app_project/core/widgets/custom_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class CustomFileImage extends StatelessWidget {
  const CustomFileImage({
    Key? key,
    this.image,
  }) : super(key: key);
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return image != null
        ? CircleAvatar(
            radius: 75.w,
            backgroundImage: FileImage(
              File(image!.path),
            ))
        : CustomImages(imgPath: AppAssets.imagePicker);
  }
}
