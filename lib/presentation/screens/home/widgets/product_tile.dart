import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';
import 'package:tryambaka_admin/data/constants/constants.dart';
import 'package:tryambaka_admin/data/functions/firebase_functions.dart';
import 'package:tryambaka_admin/presentation/screens/home/widgets/product_details.dart';

class ProductTile extends StatelessWidget {
  final String id;
  final String productName;
  final String subName;
  final String category;
  final String description;
  final String quantity;
  final String color;
  final String price;
  final List<dynamic> image;

  const ProductTile({
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => ProductDetails(
                    id: id,
                    productName: productName,
                    subName: subName,
                    category: category,
                    description: description,
                    quantity: quantity,
                    color: color,
                    price: price,
                    image: image,
                  )));
        },
        child: Column(
          children: [
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: NetworkImage(image[0]),
                  fit: BoxFit.contain,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 145,
                    top: 0,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: black,
                                    title: const Text(
                                      'Delete confirmation',
                                      style: TextStyle(color: whitefont),
                                    ),
                                    content: const Text(
                                      'Are you sure you want to delete this Product?',
                                      style: TextStyle(color: whitefont),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(color: whitefont),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: const Text(
                                          'Delete',
                                          style: TextStyle(color: whitefont),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ).then((value) {
                                if (value != null && value) {
                                  deleteProduct(id, context);
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: black,
                              size: 25,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            kHeight10,
            Text(
              productName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                letterSpacing: 0.5,
                fontSize: 20,
                color: blackfont,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              price,
              style: const TextStyle(
                  letterSpacing: 0.5,
                  fontSize: 15,
                  color: blackfont,
                  fontWeight: FontWeight.bold),
            ),
            kHeight10,
          ],
        ),
      ),
    );
  }
}
