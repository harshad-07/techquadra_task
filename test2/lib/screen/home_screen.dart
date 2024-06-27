import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../provider/image_provider.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import '../utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<PickImageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () =>
                  Provider.of<PickImageProvider>(context, listen: false)
                      .pickImage(ImageSource.gallery),
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: imageProvider.image == null
                    ? HelperFunctions.screenWidth(context) * 0.4
                    : 300,
                height: HelperFunctions.screenWidth(context) * 0.4,
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: imageProvider.image == null
                      ? BorderRadius.circular(100)
                      : BorderRadius.circular(Sizes.cardRadiusLg),
                ),
                // radius: HelperFunctions.screenWidth(context) * 0.2,
                // backgroundColor: AppColors.grey,
                // backgroundImage: imageProvider.image != null
                //     ? FileImage(imageProvider.image!)
                //     : null,
                child: imageProvider.image == null
                    ? Icon(
                        Iconsax.gallery5,
                        color: AppColors.darkerGrey,
                      )
                    : Image.file(imageProvider.image!),
              ),
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              opacity: imageProvider.image != null ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: imageProvider.image != null
                  ? Column(
                      children: [
                        Text('File Name: ${imageProvider.fileName}'),
                        Text('File Size: ${imageProvider.fileSize}'),
                        Text('Resolution: ${imageProvider.resolution}'),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Sizes.defaultSpace,
                                  vertical: Sizes.md)),
                          onPressed: imageProvider.clearImage,
                          child: Text('Clear Image'),
                        ),
                      ],
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
