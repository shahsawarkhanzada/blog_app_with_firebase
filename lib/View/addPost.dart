import 'dart:io';

import 'package:blog_app/Components/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  File? image;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final picker = ImagePicker();

  Future getgalleryImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
      } else {
        print('No Image selected');
      }
    });
  }

  Future getCameraImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
      } else {
        print('No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: const Text('Add Blog'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          content: SizedBox(
                            height: 120,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    getCameraImage();
                                    Navigator.pop(context);
                                  },
                                  child: const ListTile(
                                    leading: Icon(Icons.camera_alt_outlined),
                                    title: Text('Camera'),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    getgalleryImage();
                                    Navigator.pop(context);
                                  },
                                  child: const ListTile(
                                    leading: Icon(Icons.photo_library),
                                    title: Text('Gallery'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Center(
                  child: Container(
                    height: height * 0.2,
                    width: width,
                    child: image != null
                        ? ClipRRect(
                            child: Image.file(
                              image!.absolute,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 100,
                            width: 100,
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.blue,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: titleController,
                    decoration: const InputDecoration(hintText: 'Ttile'),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    minLines: 1,
                    maxLines: 8,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                    ),
                  )
                ],
              )),
              SizedBox(
                height: height * 0.1,
              ),
              RoundedButton(title: 'Upload', onPress: () {})
            ],
          ),
        ),
      ),
    );
  }
}
