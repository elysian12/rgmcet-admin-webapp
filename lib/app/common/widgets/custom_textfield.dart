// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: MyTextStyle.hintStyle,
        filled: true,
        fillColor: AppColors.whiteColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.hintColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.hintColor,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 1.h,
          horizontal: 10.w,
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final bool isReadOnly;
  final bool multiLine;
  final bool showSuffix;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final String suffixIcon;
  final String label;
  final Function(String)? onChanged;

  const CustomTextFormField({
    Key? key,
    this.isReadOnly = false,
    this.multiLine = false,
    this.showSuffix = true,
    this.onTap,
    this.controller,
    required this.suffixIcon,
    required this.label,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 13.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          SizedBox(
            height: 4.h,
          ),
          TextFormField(
            onChanged: onChanged,
            readOnly: isReadOnly,
            controller: controller,
            onTap: onTap,
            maxLines: multiLine ? 4 : null,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.whiteColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.whiteColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.whiteColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.whiteColor,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 1.h,
                horizontal: 10.w,
              ),
              suffixIconConstraints: showSuffix
                  ? BoxConstraints(
                      maxHeight: 34,
                      maxWidth: 34,
                    )
                  : null,
              suffixIcon: showSuffix
                  ? Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Image.asset(
                        suffixIcon,
                        height: 24.h,
                        width: 24.w,
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
