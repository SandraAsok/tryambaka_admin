import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';
import 'package:tryambaka_admin/data/functions/functions.dart';
import 'package:tryambaka_admin/presentation/screens/home/exclusive_screen.dart';
import 'package:tryambaka_admin/presentation/screens/home/product_screen.dart';
import 'package:tryambaka_admin/presentation/screens/home/widgets/add_new_exclusive.dart';
import 'package:tryambaka_admin/presentation/screens/home/widgets/add_new_product.dart';
import 'package:tryambaka_admin/presentation/screens/home/order_screen.dart';
import 'package:tryambaka_admin/presentation/screens/search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                backgroundColor: bgcolor,
                elevation: 0,
                automaticallyImplyLeading: false,
                foregroundColor: black,
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => const SearchScreen()));
                    },
                    icon: const Icon(
                      Icons.search,
                      color: iconcolor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showLogoutConfirmationDialog(context);
                      log("alert called");
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: iconcolor,
                    ),
                  ),
                ],
                title: const Center(
                  child: Text(
                    "Tryambaka",
                    style: TextStyle(
                        color: blackfont,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        "Products",
                        style: TextStyle(
                            color: blackfont,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Exclusives",
                        style: TextStyle(
                            color: blackfont,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Orders",
                        style: TextStyle(
                            color: blackfont,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                  unselectedLabelColor: grey,
                  labelColor: black,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: black,
                      width: 3.0,
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  ProductScreen(),
                  ExclusiveScreen(),
                  const OrderScreen(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const AddNewProductScreen(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(color: black)),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(black),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(
                              horizontal: size.width * 0.1, vertical: 15),
                        ),
                      ),
                      child: const Text(
                        "Add Product",
                        style: TextStyle(color: white, fontSize: 20),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const AddNewExclusiveScreen(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(color: black)),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(black),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(
                              horizontal: size.width * 0.1, vertical: 15),
                        ),
                      ),
                      child: const Text(
                        "Add Exclusive",
                        style: TextStyle(color: white, fontSize: 20),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
