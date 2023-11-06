import 'package:flutter/material.dart';

class AppShowTextField extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets? contentPadding;
  final String? label;
  final TextEditingController? controller;
  final String? errorLabel;
  final String? placeholder;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  final TextInputType? textInputType;
  final Function(String)? onSubmit;
  final bool readOnly;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? focusBorderColor;
  final double radius;
  const AppShowTextField(
      {super.key,
      //
      this.label,
      this.controller,
      this.errorLabel,
      this.padding = EdgeInsets.zero,
      this.contentPadding,
      this.placeholder,
      required this.onChanged,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.onSubmit,
      this.readOnly = false,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixIcon,
      this.onTap,
      this.backgroundColor = Colors.transparent,
      this.focusBorderColor,
      this.radius = 8

      //
      });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
