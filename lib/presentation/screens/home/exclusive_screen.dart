import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_admin/presentation/screens/home/widgets/product_tile.dart';
import 'package:tryambaka_admin/presentation/widgets/shimmer_effect.dart';

class ExclusiveScreen extends StatelessWidget {
  ExclusiveScreen({super.key});

  final Stream<QuerySnapshot> _exclusiveproductstream =
      FirebaseFirestore.instance.collection('exclusive').snapshots();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double productheight = (size.height - kToolbarHeight - 24) / 5;
    final double productwidth = size.width / 2;

    return StreamBuilder<QuerySnapshot>(
      stream: _exclusiveproductstream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          return GridView.builder(
            shrinkWrap: true,
            itemCount: documents.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (productheight / productwidth),
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemBuilder: (context, index) {
              return ProductTile(
                id: documents[index].get('id'),
                productName: documents[index].get('productName'),
                subName: documents[index].get('subName'),
                category: documents[index].get('category'),
                description: documents[index].get('description'),
                quantity: documents[index].get('quantity'),
                color: documents[index].get('color'),
                price: documents[index].get('price'),
                image: documents[index].get('image'),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const ShimmerEffect();
        } else {
          return const ShimmerEffect();
        }
      },
    );
  }
}
