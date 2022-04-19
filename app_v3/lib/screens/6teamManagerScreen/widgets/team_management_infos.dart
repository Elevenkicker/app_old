import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class TeamManagementInfos extends StatefulWidget {
  const TeamManagementInfos({Key? key}) : super(key: key);

  @override
  State<TeamManagementInfos> createState() => _TeamManagementInfosState();
}

class _TeamManagementInfosState extends State<TeamManagementInfos> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      } else {
        final imageTemporary = File(image.path);
        setState(() {
          this.image = imageTemporary;
        });
      }
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  Widget buildImagePickerButton({required VoidCallback onClicked}) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
          primary: const Color.fromRGBO(35, 60, 128, 1),
          onPrimary: Colors.white,
          textStyle: const TextStyle(fontSize: 20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.photo, size: 40),
            Gap(10),
            Text("Vereinslogo hochladen"),
          ],
        ),
        onPressed: onClicked,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        const Text("Allgemein",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: "Elenvenkicker",
              fontWeight: FontWeight.w500,
            )),
        const Gap(10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(25, 50, 125, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Form(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Center(
                    child: Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )),
                      child: image != null
                          ? Image.file(image!)
                          : const FlutterLogo(size: 200),
                    ),
                  ),
                  const Gap(20),
                  buildImagePickerButton(onClicked: () => pickImage()),
                  TextFormField(
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    textInputAction: TextInputAction.send,
                    decoration: const InputDecoration(
                      label: Text('Vereinsname',
                          style: TextStyle(color: Colors.white)),
                      hintText: 'FC Freiburg',
                      hintStyle: TextStyle(color: Colors.white60),
                      helperText:
                          'Vereinsnamen in der App in Beiträgen auf Facebook und Instagram',
                      helperStyle: TextStyle(color: Colors.white38),
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    textInputAction: TextInputAction.send,
                    decoration: const InputDecoration(
                      label: Text('Facebook-Seitennamen',
                          style: TextStyle(color: Colors.white)),
                      hintText: 'FC Freiburg - Official',
                      hintStyle: TextStyle(color: Colors.white60),
                      helperText:
                          'Um den Verein auf Facebook markieren zu können',
                      helperStyle: TextStyle(color: Colors.white38),
                    ),
                  ),
                  const Gap(10),
                  TextFormField(
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    textInputAction: TextInputAction.send,
                    decoration: const InputDecoration(
                      label: Text('Instagram Benutzername',
                          style: TextStyle(color: Colors.white)),
                      hintText: '@fc_reiburg',
                      hintStyle: TextStyle(color: Colors.white60),
                      helperText:
                          'Um den Verein auf Instagram markieren zu können',
                      helperStyle: TextStyle(color: Colors.white38),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
