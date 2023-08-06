import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';
import 'package:tryambaka_admin/data/constants/constants.dart';
import 'package:tryambaka_admin/presentation/screens/home/widgets/product_tile.dart';
import 'package:tryambaka_admin/presentation/screens/search/widgets/custom_search.dart';
import 'package:tryambaka_admin/presentation/widgets/shimmer_effect.dart';

List<dynamic> availableproducts = [];
List<dynamic> filteredproducts = [];

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double productHeight = (size.height - kToolbarHeight - 24) / 2.3;
    final double productWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              kHeight10,
              CustomSearchWidget(onChanged: filterProducts),
              kHeight10,
              Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error : ${snapshot.error}");
                  } else if (snapshot.hasData) {
                    log("Data occurs");
                    availableproducts = snapshot.data!.docs;
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: filteredproducts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (productWidth / productHeight),
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemBuilder: (context, index) {
                        final DocumentSnapshot productsnap =
                            filteredproducts[index];
                        return ProductTile(
                          id: productsnap['id'],
                          productName: productsnap['productName'],
                          subName: productsnap['subName'],
                          category: productsnap['category'],
                          description: productsnap['description'],
                          quantity: productsnap['quantity'],
                          color: productsnap['color'],
                          price: productsnap['price'],
                          image: productsnap['image'],
                        );
                      },
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const ShimmerEffect();
                  }
                  return const ShimmerEffect();
                },
              ))
            ],
          ),
        ),
      ),
    );
  }

  void filterProducts(String query) {
    setState(() {
      filteredproducts = availableproducts.where((doc) {
        String name = doc.data()['productName'].toLowerCase();
        String searchLower = query.toLowerCase();
        return name.contains(searchLower);
      }).toList();
    });
  }
}
