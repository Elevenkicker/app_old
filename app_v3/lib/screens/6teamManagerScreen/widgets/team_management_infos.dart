import 'dart:io';

import 'package:app_v3/provider/2team/teams_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

import 'package:provider/provider.dart';

import 'text_input_field_fb.dart';
import 'text_input_field_ig.dart';
import 'text_input_field_teamname.dart';

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

  Widget buildImagePickerButton({required VoidCallback onClicked}) {
    return ElevatedButton(
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
  }

  int id = 1;

  @override
  Widget build(BuildContext context) {
    TeamsProvider teamsData = Provider.of<TeamsProvider>(context);
    TeamProvider teamData = teamsData.findById(id);
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
                          : Image.asset("assets/images/vereinslogos/$id.png"),
                    ),
                  ),
                  const Gap(20),
                  buildImagePickerButton(onClicked: () => pickImage()),
                  const Gap(15),
                  CustomTextInputFieldWidget(
                    id: id,
                    initialValue: teamData.name!,
                    value: teamData.name,
                    lableText: "Hier Vereinsnamen eintragen",
                  ),
                  const Gap(15),
                  CustomTextInputFieldIg(
                    id: id,
                    initialValue: "@",
                    value: teamData.igUsername,
                    lableText: "Hier Instagram Usernamen eintragen",
                  ),
                  const Gap(15),
                  CustomTextInputFieldFb(
                    id: id,
                    initialValue: "",
                    value: teamData.fbUsername,
                    lableText: "Hier Facebook-Seitennamen eintragen",
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
