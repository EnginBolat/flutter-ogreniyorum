import 'package:firebase_bloc_login/constants/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../core/service/firebase_service/firebase_auth_service.dart';
import '../core/service/firebase_service/firebase_post_service.dart';

class SharePhoto extends StatefulWidget {
  const SharePhoto({super.key});

  @override
  State<SharePhoto> createState() => _SharePhotoState();
}

class _SharePhotoState extends State<SharePhoto> {
  final AuthService authService = AuthService();
  final ImagePicker _pickerImage = ImagePicker();
  final PostService postService = PostService();
  dynamic _pickImage;
  XFile? profileImage;

  Widget imagePlace() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    if (profileImage != null) {
      return Container(
        color: Colors.grey,
        width: width * 0.9,
        height: height * 0.5,
        child: Image.asset(
          profileImage!.path,
          fit: BoxFit.fill,
        ),
      );
    } else {
      if (_pickImage != null) {
        return Container(
          color: Colors.grey,
          width: width * 0.9,
          height: height * 0.5,
          child: Image.asset(profileImage!.path),
        );
      } else {
        return Container(
          color: Colors.grey,
          width: width * 0.9,
          height: height * 0.5,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppPadding.normalValue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                imagePlace(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        _onImageButtonPressed(
                          ImageSource.camera,
                          context: context,
                        );
                      },
                      icon: const Icon(Icons.camera),
                    ),
                    IconButton(
                      onPressed: () {
                        _onImageButtonPressed(
                          ImageSource.gallery,
                          context: context,
                        );
                      },
                      icon: const Icon(Icons.image),
                    ),
                    IconButton(
                      onPressed: () async {},
                      icon: const Icon(Icons.share),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.chevron_left_outlined, color: Colors.black),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.chevron_right_outlined,
              color: Theme.of(context).primaryColor),
        )
      ],
      centerTitle: true,
      title: const Text(
        "Gönderi Paylaş",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  void _onImageButtonPressed(ImageSource source,
      {required BuildContext context}) async {
    try {
      final pickedFile = await _pickerImage.pickImage(source: source);
      setState(() {
        profileImage = pickedFile!;
        if (profileImage != null) {}
      });
    } catch (e) {
      setState(() {
        _pickImage = e;
      });
    }
  }
}
