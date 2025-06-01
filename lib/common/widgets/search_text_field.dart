import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/formatters/formatter.dart';
import '../../utils/helpers/helpers.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.searchController,
    this.onChanged,
    this.onSelected,
  });

  final TextEditingController searchController;
  final Function(String)? onChanged;
  final Function(String)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwInputFields),
      child: Column(
        children: [
          TextFormField(
            controller: searchController,
            onChanged: onChanged,
            cursorColor:
                isDark
                    ? TColors.white.withOpacity(0.4)
                    : TColors.black.withOpacity(0.4),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: TSizes.inputFieldRadius,
              ),
              prefixIcon: Icon(Icons.search_sharp),
              suffixIcon: PopupMenuButton(
                icon: Icon(Icons.filter_list_sharp),
                onSelected: onSelected,
                itemBuilder: (context) {
                  return TaskTag.values.map((e) {
                    String name = Formatter.formatStatus(e.name);
                    return PopupMenuItem<String>(
                      value: e.name,
                      child: Text(name),
                    );
                  }).toList();
                },
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.4,
                  color:
                      isDark
                          ? TColors.white.withOpacity(0.4)
                          : TColors.black.withOpacity(0.4),
                ),
                borderRadius: BorderRadius.circular(TSizes.spaceAppBar),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
