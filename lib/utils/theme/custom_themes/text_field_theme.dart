import 'package:flutter/material.dart';

import 'text_theme.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.all(0),
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
    hintStyle: TTextTheme.ligthTextTheme.labelMedium,
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: TTextTheme.ligthTextTheme.labelMedium!.copyWith(
      fontSize: 14,
    ),

    border: UnderlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: TTextTheme.ligthTextTheme.labelMedium!.color!.withOpacity(0.5),
        width: 0.5,
      ),
    ),
    enabledBorder: UnderlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: TTextTheme.ligthTextTheme.labelMedium!.color!.withOpacity(0.5),
        width: 0.5,
      ),
    ),
    focusedBorder: UnderlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: TTextTheme.ligthTextTheme.labelMedium!.color!,
        width: 1,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: Colors.red, width: 1.0),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: Colors.orange, width: 2.0),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.all(0),
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.white),
    hintStyle: TTextTheme.darkTextTheme.labelMedium,
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: TTextTheme.darkTextTheme.labelMedium!.copyWith(
      fontSize: 14,
    ),
    border: const UnderlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: TTextTheme.ligthTextTheme.labelMedium!.color!.withOpacity(0.5),
        width: 0.5,
      ),
    ),
    enabledBorder: const UnderlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: TTextTheme.darkTextTheme.labelMedium!.color!.withOpacity(0.5),
        width: 0.5,
      ),
    ),
    focusedBorder: UnderlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: TTextTheme.darkTextTheme.labelMedium!.color!,
        width: 1,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: Colors.red, width: 1.0),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: Colors.orange, width: 2.0),
    ),
  );
}
