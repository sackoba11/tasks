import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({super.key, required this.tag, this.onDeleted});

  final String tag;
  final Function()? onDeleted;

  @override
  Widget build(BuildContext context) {
    return Chip(
      deleteIcon: Icon(Icons.close, color: TColors.levelHighdColor),
      onDeleted: onDeleted,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
      label: Text(tag),
    );
  }
}
