import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last_exam/utils/color.dart';

import '../add_card_page.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String dropdownValue = 'UzCard';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      // width: 190,
      child: DropdownButtonFormField(
        // elevation: 10,
        borderRadius: BorderRadius.circular(30),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.neutral4, width: 1.w),
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.neutral4, width: 1.w),
              borderRadius: BorderRadius.circular(30).r),
          filled: true,
        ),
        dropdownColor: MyColors.white,
        value: dropdownValue,
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>[
          'UzCard',
          'Humo',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: GoogleFonts.raleway().copyWith(
                      color: dropdownValue == dropdownValue
                          ? MyColors.neutral5
                          : MyColors.black,
                      fontSize: 14.sp),
                ),
                Image.asset(
                    cards[value.length == 6
                        ? 0
                        : value.length == 4
                            ? 1
                            : 0],
                    width: 40.w,
                    height: 40.h)
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
