import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last_exam/utils/color.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    Key? key,
    required this.isActive,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);
  final bool isActive;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h,
      decoration: BoxDecoration(
        color: isActive
            ? MyColors.LightishGreen
            : MyColors.LightishGreen.withOpacity(0.4),
        borderRadius: BorderRadius.circular(90.r),
      ),
      child: ElevatedButton(
        onPressed: isActive ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.LightishGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
        ),
        child: Text(
          buttonText,
          style: GoogleFonts.raleway().copyWith(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
