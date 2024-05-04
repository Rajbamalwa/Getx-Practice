import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  ImagePickerController controller = Get.put(ImagePickerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Column(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: controller.imagePath.isNotEmpty
                        ? FileImage(
                            File(
                              controller.imagePath.toString(),
                            ),
                          )
                        : null,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.getImage();
                    },
                    child: const Text('Get Image'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImagePickerController extends GetxController {
  RxString imagePath = ''.obs;

  Future getImage() async {
    ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
    } else {}
  }
}
