import 'package:flutter/material.dart';

import '../../helpers/helpers.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/sizes.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwInputFields),
      child: TextFormField(
        controller: searchController,
        cursorColor: TColors.black.withOpacity(0.4),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: TSizes.inputFieldRadius,
          ),
          prefixIcon: Icon(Icons.search_sharp),
          suffixIcon: PopupMenuButton(
            icon: Icon(Icons.filter_list_sharp),
            onSelected: (value) {
              searchController.text = value;
            },
            itemBuilder: (context) {
              return TaskTag.values.map((e) {
                String name = Helpers.formatStatus(e.name);
                return PopupMenuItem<String>(value: name, child: Text(name));
              }).toList();
            },
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.4,
              color: TColors.black.withOpacity(0.4),
            ),
            borderRadius: BorderRadius.circular(TSizes.spaceAppBar),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          ),
        ),
      ),
    );
  }
}
