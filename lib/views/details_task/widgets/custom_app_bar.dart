import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../common/widgets/custom_icon_button.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

AppBar customAppBar({
  required BuildContext context,
  required String pathToPop,
  void Function()? onEdit,
  void Function()? onDelete,
}) {
  return AppBar(
    leading: CustomIconButton(
      icon: Iconsax.arrow_left_copy,
      color: TColors.black,
      onPressed: () => context.go(pathToPop),
    ),
    actions: [
      CustomIconButton(
        icon: Icons.delete_outline_outlined,
        color: TColors.black,
        onPressed: onDelete,
      ),
      CustomIconButton(
        icon: Iconsax.edit_2_copy,
        color: TColors.black,
        onPressed: onEdit,
      ),
    ],
    actionsPadding: EdgeInsets.only(right: TSizes.spaceAppBar),
  );
}
