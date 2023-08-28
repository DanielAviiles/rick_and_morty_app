import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty_app/core/theme/color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.warning_amber_outlined, size: 4.h, color: mainGrey),
          SizedBox(height: 5.h),
          Text(
            message,
            style: GoogleFonts.jost(fontSize: 15.sp),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
