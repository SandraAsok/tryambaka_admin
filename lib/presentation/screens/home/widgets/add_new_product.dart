import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';
import 'package:tryambaka_admin/data/constants/constants.dart';
import 'package:tryambaka_admin/domain/models/product_model.dart';
import 'package:tryambaka_admin/presentation/widgets/details_textfield.dart';

import '../../../../domain/firebase_functions.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController productnameController = TextEditingController();
  final TextEditingController subnameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  List<String> categoriesList = ["Men", "Women", "Children", "Others"];
  List<String> imageList = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: bgcolor,
        elevation: 0,
        foregroundColor: black,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_left,
              size: 40,
            )),
        title: const Text(
          "Add Product Details",
          style: TextStyle(
              color: blackfont, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: GestureDetector(
                onTap: () async {
                  final pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedFile == null) {
                    return;
                  } else {
                    File file = File(pickedFile.path);
                    imageList = await _uploadImage(file);
                    setState(() {});
                  }
                },
                child: SizedBox(
                  width: size.width * 0.7,
                  height: size.width * 0.7,
                  child: imageList.isEmpty
                      ? Container(
                          height: size.height * 0.3,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: black,
                              width: 2.0,
                            ),
                            color: white,
                          ),
                          child: const Center(
                            child: Text(
                              'Pick Image',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                      : Image.network(imageList[0]),
                ),
              ),
            ),
            DetailsTextFieldWidget(
              size: size,
              fieldName: "Product Name",
              textController: productnameController,
            ),
            DetailsTextFieldWidget(
              size: size,
              fieldName: "Sub Name",
              textController: subnameController,
            ),
            DetailsTextFieldWidget(
              size: size,
              fieldName: "Category",
              textController: categoryController,
            ),
            DetailsTextFieldWidget(
              size: size,
              fieldName: "Description",
              textController: descriptionController,
              height: 160,
              maxLines: 4,
            ),
            DetailsTextFieldWidget(
              size: size,
              fieldName: "Quantity",
              textController: quantityController,
              numPad: true,
            ),
            DetailsTextFieldWidget(
              size: size,
              fieldName: "Price",
              textController: priceController,
              numPad: true,
            ),
            DetailsTextFieldWidget(
              size: size,
              fieldName: "Color",
              textController: colorController,
            ),
            kHeight25,
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextButton(
                onPressed: () {
                  addProduct(
                      Products(
                        productName: productnameController.text.trim(),
                        subName: subnameController.text.trim(),
                        category: categoryController.text.trim(),
                        description: descriptionController.text.trim(),
                        quantity: quantityController.text.trim(),
                        price: priceController.text.trim(),
                        color: colorController.text.trim(),
                        imageList: imageList,
                      ),
                      context);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: black),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(black),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(
                          horizontal: size.width * 0.32, vertical: 20)),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<String>> _uploadImage(File file) async {
    final firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    DateTime now = DateTime.now();
    String timestamp = now.microsecondsSinceEpoch.toString();
    firebase_storage.Reference ref = storage.ref().child('images/$timestamp');

    firebase_storage.UploadTask task = ref.putFile(file);

    await task;
    String downloadURL = await ref.getDownloadURL();
    log(downloadURL);
    imageList.add(downloadURL);
    return imageList;
  }
}
