import 'dart:io';

import 'package:blog_app/Components/RoundedButton.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  File? image;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
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
              Center(
                child: Container(
                  height: height * 0.2,
                  width: width,
                  child: image != null
                      ? ClipRRect(
                          child: Image.file(
                            image!.absolute,
                            height: 100,
                            width: 100,
                            fit: BoxFit.fitHeight,
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
