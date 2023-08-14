import 'package:flutter/cupertino.dart';
import 'package:tryambaka_admin/data/colors/colors.dart';

class CustomSearchWidget extends StatelessWidget {
  final void Function(String query) onChanged;
  const CustomSearchWidget({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      borderRadius: BorderRadius.circular(30),
      backgroundColor: grey.withOpacity(0.5),
      prefixIcon: const Icon(
        CupertinoIcons.search,
        color: grey,
      ),
      suffixIcon: const Icon(
        CupertinoIcons.xmark_circle_fill,
        color: grey,
      ),
      style: const TextStyle(color: black),
      onChanged: onChanged,
      placeholder: 'Search Product Name',
    );
  }
}
