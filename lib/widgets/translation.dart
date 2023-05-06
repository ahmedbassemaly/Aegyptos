import 'package:flutter/material.dart';
import 'package:kemet/constants/constants.dart';

Widget buildCameraUI() {
  // Implement camera UI here
  return Center(
    child: Icon(
      Icons.camera_alt,
      size: 100,
      color: ConstantsColors.secondaryColor,
    ),
  );
}

Widget buildUploadUI() {
  // Implement upload UI here
  return Center(
    child: Icon(
      Icons.cloud_upload_outlined,
      size: 100,
      color: ConstantsColors.secondaryColor,
    ),
  );
}
