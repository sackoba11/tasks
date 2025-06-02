import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class CustomRowItem extends StatelessWidget {
  const CustomRowItem({
    super.key,
    required this.title,
    this.onEdit = false,
    required this.value,
    this.color,
    required this.controller,
  });

  final String title;
  final String value;
  final Color? color;
  final bool onEdit;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: TColors.black.withOpacity(0.5),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(4),
            width: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(9),
            ),
            child: TextFormField(
              controller: controller,
              enabled: onEdit,
              cursorColor: TColors.black.withOpacity(0.4),
              decoration: InputDecoration(
                hintText: value,
                hintStyle: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: TColors.black),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: TSizes.inputFieldRadius,
                ),

                enabledBorder:
                    onEdit
                        ? OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.4,
                            color: TColors.black.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(
                            TSizes.spaceAppBar,
                          ),
                        )
                        : InputBorder.none,
                focusedBorder:
                    onEdit
                        ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            TSizes.borderRadiusLg,
                          ),
                        )
                        : InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
