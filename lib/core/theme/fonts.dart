import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rick_and_morty_app/core/theme/color.dart';

/// This textStyle its for all Logo Text in the aplication
TextStyle get textLogoStyle => GoogleFonts.jost(
      color: colorWhite,
      fontSize: Adaptive.sp(30),
      fontWeight: FontWeight.bold,
    );

/// This textStyle its for all Logo Text in the aplication
TextStyle get textBlueLogoStyle => GoogleFonts.jost(
      color: mainBlue,
      fontSize: Adaptive.sp(32),
      fontWeight: FontWeight.bold,
    );

/// This textStyle its for all Text in the aplication
TextStyle textStyleNormal(Color color) => GoogleFonts.jost(
      color: color,
      fontSize: Adaptive.sp(16),
      fontWeight: FontWeight.w600,
    );

/// This textStyle its for all white Text in the aplication

TextStyle get textWhiteStyle => GoogleFonts.jost(
      color: colorWhite,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(14),
    );

/// This textStyle its for all white Text in the aplication

TextStyle get textWhiteStyleDay => GoogleFonts.jost(
      color: colorWhite,
      fontWeight: FontWeight.w500,
      fontSize: Adaptive.sp(16),
    );

/// This textStyle its for all white Text in the aplication

TextStyle get textBlackStyleDay => GoogleFonts.jost(
      color: mainBlack,
      fontWeight: FontWeight.w500,
      fontSize: Adaptive.sp(16),
    );

TextStyle get textBlackCardThin => GoogleFonts.jost(
      color: mainBlack,
      fontWeight: FontWeight.w400,
      fontSize: Adaptive.sp(17),
    );

/// This textStyle its for all white Text in the aplication

TextStyle get textWhiteStyleButton => GoogleFonts.jost(
      color: colorWhite,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(17),
    );

/// This textStyle its for all white Text in the aplication

TextStyle get textBlackStyleButton => GoogleFonts.jost(
      color: modalTextColor,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(17),
    );

/// This textStyle its for all white Text Outlined in the aplication

TextStyle get texthighlightBlueStyle => GoogleFonts.jost(
      color: highlightBlue,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(16),
    );

/// This textStyle its for all black Text in the aplication

TextStyle get textBlackStyle => GoogleFonts.jost(
      color: mainBlack,
      fontWeight: FontWeight.normal,
      fontSize: Adaptive.sp(15),
    );

/// This textStyle its for all black Text in the aplication

TextStyle get textBlackStyleBold => GoogleFonts.jost(
      color: mainBlack,
      fontWeight: FontWeight.bold,
      fontSize: Adaptive.sp(15),
    );

/// This textStyle its for all black Text in the aplication

TextStyle get textBlackStyleLitte => GoogleFonts.jost(
      color: modalTextColor,
      fontWeight: FontWeight.normal,
      fontSize: Adaptive.sp(14),
    );

/// This textStyle its for all black Text in the aplication
TextStyle get textBlueStyle => GoogleFonts.jost(
      color: highlightBlue,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(15),
    );

/// This textStyle its for all black Text in the aplication
TextStyle get textBlueStyleSubtitle => GoogleFonts.jost(
      color: highlightBlue,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(18),
    );

/// This textStyle its for all black Text in the aplication

TextStyle get textBlackStyleTitle => GoogleFonts.jost(
      color: mainBlack,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(22),
    );

/// This textStyle its for all black code in the aplication
TextStyle get textBlackStyleCode => GoogleFonts.jost(
      color: mainBlack,
      fontWeight: FontWeight.bold,
      fontSize: Adaptive.sp(22),
    );

/// This textStyle its for all black SubTitle in the aplication

TextStyle get textBlackStyleSubTitle => GoogleFonts.jost(
      color: mainBlack,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(18),
    );

TextStyle get textRedStyleSubTitle => GoogleFonts.jost(
      color: highlightGrey,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(18),
    );
TextStyle get textWhiteStyleSubTitle => GoogleFonts.jost(
      color: colorWhite,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(18),
    );

TextStyle get textBlackStyleSubTitleLight => GoogleFonts.jost(
      color: mainBlack,
      fontWeight: FontWeight.w400,
      fontSize: Adaptive.sp(16),
    );

TextStyle get textBlackStyleSubTitleBold => GoogleFonts.jost(
      color: mainBlack,
      fontWeight: FontWeight.bold,
      fontSize: Adaptive.sp(16),
    );

TextStyle get textGrayStyleInput => GoogleFonts.jost(
      color: textGrayInput,
      fontWeight: FontWeight.w500,
      fontSize: Adaptive.sp(17),
    );

TextStyle get textGrayStylePlaceholder => GoogleFonts.jost(
      color: filledHintStyleColor,
      fontWeight: FontWeight.w500,
      fontSize: Adaptive.sp(17),
    );

TextStyle get textBlackStyleThinDescription => GoogleFonts.jost(
      color: mainBlack,
      fontWeight: FontWeight.normal,
      fontSize: Adaptive.sp(15),
    );

TextStyle get textGrayStyleThinDescription => GoogleFonts.jost(
      color: mainGrey,
      fontWeight: FontWeight.normal,
      fontSize: Adaptive.sp(15),
    );

/// This textStyle its for all black Text in the aplication

TextStyle get textBlackStyleTitleJost => GoogleFonts.jost(
      color: mainBlack,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(22),
    );

/// This textStyle its for all Text in the aplication
TextStyle textStyleNormalJost(Color color) => GoogleFonts.jost(
      color: color,
      fontSize: Adaptive.sp(16),
      fontWeight: FontWeight.w600,
    );
