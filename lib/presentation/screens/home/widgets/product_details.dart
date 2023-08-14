import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';
import 'package:tryambaka_admin/data/functions/firebase_functions.dart';
import 'package:tryambaka_admin/domain/models/product_model.dart';
import 'package:tryambaka_admin/presentation/widgets/details_textfield.dart';

class ProductDetails extends StatefulWidget {
  final String id;
  final String productName;
  final String subName;
  final String category;
  final String description;
  final String quantity;
  final String color;
  final String price;
  final List<dynamic> image;
  const ProductDetails({
    super.key,
    required this.id,
    required this.productName,
    required this.subName,
    required this.category,
    required this.description,
    required this.quantity,
    required this.color,
    required this.price,
    required this.image,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final ValueNotifier<bool> editNotifier = ValueNotifier(true);
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController subNameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController typecontroller = TextEditingController();

  List imageList = [];

  @override
  void initState() {
    imageList = widget.image;
    log(imageList.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: bgcolor,
          appBar: AppBar(
            backgroundColor: bgcolor,
            elevation: 0,
            foregroundColor: black,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_left,
                  size: 35,
                  color: black,
                )),
            title: const Text(
              "Product Details",
              style: TextStyle(
                color: blackfont,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ValueListenableBuilder(
                  valueListenable: editNotifier,
                  builder: (context, editOrUpdate, child) => Column(
                    children: [
                      Center(
                        child: imageList.length == 1
                            ? GestureDetector(
                                onTap: () {
                                  editOrUpdate ? null : pickFirstImage();
                                },
                                child: SizedBox(
                                  width: size.width * 0.7,
                                  child: Image.network(imageList[0]),
                                ),
                              )
                            : Stack(
                                children: [
                                  FlutterCarousel(
                                    items: List.generate(
                                        imageList.length,
                                        (index) => SizedBox(
                                            width: size.width * 0.7,
                                            child: Image.network(
                                                imageList[index]))),
                                    options: CarouselOptions(
                                      indicatorMargin: 5,
                                      viewportFraction: 1,
                                      slideIndicator:
                                          const CircularSlideIndicator(
                                        indicatorRadius: 4,
                                        itemSpacing: 15,
                                        currentIndicatorColor: black,
                                        indicatorBackgroundColor: grey,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.add_a_photo_outlined),
                                      )),
                                ],
                              ),
                      ),
                      Visibility(
                          visible: !editOrUpdate,
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              foregroundColor: black,
                              backgroundColor: transparent,
                            ),
                            onPressed: () {
                              editOrUpdate ? null : pickMoreImage();
                            },
                            icon: const Icon(
                              Icons.add,
                              color: black,
                            ),
                            label: const Text(
                              "Add more image",
                              style: TextStyle(
                                color: blackfont,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      DetailsTextFieldWidget(
                        size: size,
                        fieldName: "Product Name",
                        textController: productNameController,
                        // textString: widget.data["productName"] ?? "No name",
                        textString: widget.productName,
                        enableTextField: !editOrUpdate,
                      ),
                      DetailsTextFieldWidget(
                        size: size,
                        fieldName: "Sub Name",
                        textController: subNameController,
                        textString: widget.subName,
                        enableTextField: !editOrUpdate,
                      ),
                      DetailsTextFieldWidget(
                        size: size,
                        fieldName: "category",
                        textController: categoryController,
                        textString: widget.category,
                        enableTextField: !editOrUpdate,
                      ),
                      DetailsTextFieldWidget(
                        size: size,
                        fieldName: "Type",
                        textController: typecontroller,
                        textString: widget.category,
                        enableTextField: !editOrUpdate,
                      ),
                      DetailsTextFieldWidget(
                        size: size,
                        fieldName: "Quantity",
                        enableTextField: !editOrUpdate,
                        textString: widget.quantity,
                        textController: quantityController,
                      ),
                      DetailsTextFieldWidget(
                        size: size,
                        fieldName: "Price",
                        enableTextField: !editOrUpdate,
                        textString: widget.price,
                        textController: priceController,
                      ),
                      DetailsTextFieldWidget(
                        size: size,
                        fieldName: "Color",
                        enableTextField: !editOrUpdate,
                        textString: widget.color,
                        textController: colorController,
                      ),
                      DetailsTextFieldWidget(
                        size: size,
                        fieldName: "Description",
                        enableTextField: !editOrUpdate,
                        textString: widget.description,
                        textController: descriptionController,
                        height: 150,
                        maxLines: 2,
                      ),
                      SizedBox(height: size.height * 0.1)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ValueListenableBuilder(
              valueListenable: editNotifier,
              builder: (context, editOrUpdate, child) => TextButton(
                  onPressed: () {
                    editNotifier.value = !editNotifier.value;
                    editOrUpdate
                        ? null
                        : updateProduct(
                            productmodel: Products(
                              productName: productNameController.text,
                              subName: subNameController.text,
                              category: categoryController.text,
                              quantity: quantityController.text,
                              price: priceController.text,
                              color: colorController.text,
                              description: descriptionController.text,
                              imageList: imageList,
                              type: typecontroller.text,
                            ),
                            id: widget.id,
                            context: context,
                          );
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
                  child: Text(
                    editOrUpdate ? 'Edit' : 'Update',
                    style: const TextStyle(
                        color: whitefont,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
        ),
      ],
    );
  }

  void pickFirstImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return;
    } else {
      File file = File(pickedFile.path);
      String imageUrl =
          await _uploadFirstImage(file, widget.productName, widget.image);
      setState(() {
        imageList.add(imageUrl);
      });
    }
  }

  void pickMoreImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return;
    } else {
      File file = File(pickedFile.path);
      imageList = await _uploadMoreImage(
          file, widget.productName, widget.image, widget.id);

      setState(() {
        imageList = imageList;
      });
    }
  }
}

Future<String> _uploadFirstImage(
    File file, String productName, List imageList) async {
  final FirebaseStorage storage = FirebaseStorage.instance;

  int index = imageList.length;

  Reference oldRef = storage.ref().child('images/$productName (${index + 1})');
  await oldRef.delete();
  Reference ref = storage.ref().child('images/$productName (${index + 1})');

  UploadTask task = ref.putFile(file);

  task.snapshotEvents.listen((TaskSnapshot snapshot) {
    log('Upload progress: ${snapshot.bytesTransferred}/${snapshot.totalBytes}');
  });

  await task;

  String downloadURL = await ref.getDownloadURL();
  log('File uploaded successfully: $downloadURL');

  return downloadURL;
}

Future<List> _uploadMoreImage(
    File file, String productName, List imageList, String id) async {
  final FirebaseStorage storage = FirebaseStorage.instance;

  int index = imageList.length;

  Reference ref = storage.ref().child('images/$productName (${index + 1})');

  UploadTask task = ref.putFile(file);

  task.snapshotEvents.listen((TaskSnapshot snapshot) {
    log('Upload progress: ${snapshot.bytesTransferred}/${snapshot.totalBytes}');
  });

  await task;

  String downloadURL = await ref.getDownloadURL();
  log('File uploaded successfully: $downloadURL');
  imageList.add(downloadURL);
  addmoreImage(imageList, id);

  return imageList;
}
