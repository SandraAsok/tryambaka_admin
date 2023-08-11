import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';
import 'package:tryambaka_admin/domain/models/exclusive_model.dart';
import 'package:tryambaka_admin/domain/models/product_model.dart';
import 'package:tryambaka_admin/presentation/screens/home/home_screen.dart';

Future<void> addProduct(Products productmodel, BuildContext context) async {
  final product = FirebaseFirestore.instance.collection('products');
  final reference = product.doc();
  try {
    // showSnackbar(context, "Product added");
    SnackBar(
      content: const Text("Product Added"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    await reference.set({
      'id': reference.id,
      'productName': productmodel.productName,
      'subName': productmodel.subName,
      'category': productmodel.category,
      'description': productmodel.description,
      'price': productmodel.price,
      'quantity': productmodel.quantity,
      'color': productmodel.color,
      'image': productmodel.imageList,
    }).then((value) {
      Navigator.of(context).pop();
    });
  } catch (e) {
    // showSnackbar(context, "Failed to add product : $e");
    SnackBar(
      content: Text("Failed to add product : $e"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    log("Failed to add product : $e");
  }
}

Future<void> updateProduct(
    {required Products productmodel,
    required String id,
    required BuildContext context}) async {
  final product = FirebaseFirestore.instance.collection("products");
  final productref = product.doc(id);
  try {
    // showSnackbar(context, "product updated");
    SnackBar(
      content: const Text("product updated"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    await productref.update({
      'productName': productmodel.productName,
      'subName': productmodel.subName,
      'category': productmodel.category,
      'description': productmodel.description,
      'price': productmodel.price,
      'quantity': productmodel.quantity,
      'color': productmodel.color,
      'image': productmodel.imageList,
    }).then((value) {
      // showSnackbar(context, "product updated");
      SnackBar(
        content: const Text("product updated"),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );
      Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
        return const HomeScreen();
      }));
    });
    log("Product updated");
  } catch (e) {
    SnackBar(
      content: Text("failed to update product: $e"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    log("failed to update product : $e");
  }
}

Future<void> deleteProduct(String id, BuildContext context) {
  CollectionReference product =
      FirebaseFirestore.instance.collection('products');
  return product.doc(id).delete().then((value) {
    log("product deleted");
    SnackBar(
      content: const Text("Product deleted"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
  }).catchError((error) {
    log("failed to delete product: $error");
    SnackBar(
      content: Text("failed to delete product :$error"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
  });
}

Future<void> addmoreImage(List imageList, String id) async {
  final product = FirebaseFirestore.instance.collection('products');
  final productRef = product.doc(id);
  try {
    await productRef.update({
      'image': imageList,
    });
    log('image updated');
  } catch (e) {
    log('failed to update image : $e');
  }
}

Stream<DocumentSnapshot> getProductData(String productId) {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  return productsCollection.doc(productId).snapshots();
}

Future<void> updateOrderStatus(String orderId, bool isActive) async {
  try {
    CollectionReference ordersCollection =
        FirebaseFirestore.instance.collection('orders');

    await ordersCollection.doc(orderId).update({'active': isActive});

    Fluttertoast.showToast(
      msg: 'Order status updated successfully',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  } catch (e) {
    log('Error updating order status: $e');
    Fluttertoast.showToast(
      msg: 'Error updating order status',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: white,
    );
  }
}

Future<void> addExclusive(
    Exclusive exclusivemodel, BuildContext context) async {
  final exclusiveProduct = FirebaseFirestore.instance.collection('exclusive');
  final reference = exclusiveProduct.doc();
  try {
    SnackBar(
      content: const Text("Exclusive Product added"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    await reference.set({
      'id': reference.id,
      'productName': exclusivemodel.productName,
      'subName': exclusivemodel.subName,
      'category': exclusivemodel.category,
      'description': exclusivemodel.description,
      'price': exclusivemodel.price,
      'quantity': exclusivemodel.quantity,
      'color': exclusivemodel.color,
      'image': exclusivemodel.imageList,
    }).then((value) {
      Navigator.of(context).pop();
    });
  } catch (e) {
    SnackBar(
      content: Text("Failed to add product : $e"),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    log("Failed to add product : $e");
  }
}
