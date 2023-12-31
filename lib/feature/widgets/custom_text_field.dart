import 'package:aqua_fit/helpers/app_colors.dart';
import 'package:aqua_fit/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
    required this.hintText,
    this.controller,
    this.inputFormatters,
    this.radius = 16,
    this.suffix,
    this.maxLines = 1,
    this.borderColor,
    this.textAlign,
    this.style,
    this.keyboard,
    this.bgColor,
  });
  final Function(String)? onChanged;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final Widget? suffix;
  final double radius;
  final int maxLines;
  final Color? borderColor;
  final Color? bgColor;
  final TextAlign? textAlign;
  final TextStyle? style;
  final TextInputType? keyboard;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboard,
      textAlign: widget.textAlign ?? TextAlign.start,
      maxLines: widget.maxLines,
      style: widget.style ??
          AppTextStyles.s15W600(
            color: Colors.black,
          ),
      controller: widget.controller,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.bgColor ?? AppColors.white,
        prefixIcon: widget.suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            width: 1,
            color: widget.borderColor ?? Colors.grey,
          ),
        ),
        hintText: widget.hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            width: 2,
            color: widget.borderColor ?? AppColors.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            width: 2,
            color: widget.borderColor ?? AppColors.grey,
          ),
        ),
      ),
    );
  }
}
