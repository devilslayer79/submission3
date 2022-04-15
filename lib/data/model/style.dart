import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color.fromARGB(255, 109, 105, 105);
var secondaryColor = Colors.orange.shade700;
var softColor = Colors.yellow.shade100;

const double defaultPadding = 5.0;
const double smallSizedBox = 10.0;
const double mediumSizedBox = 15.0;
const double largeSizedBox = 25.0;

final myTextTheme = TextTheme(
  headline1: GoogleFonts.josefinSans(
      fontSize: 124, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.josefinSans(
      fontSize: 77, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.josefinSans(fontSize: 62, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.josefinSans(
      fontSize: 44, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.josefinSans(fontSize: 31, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.josefinSans(
      fontSize: 26, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.josefinSans(
      fontSize: 21, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.josefinSans(
      fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.quicksand(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.quicksand(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.quicksand(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.quicksand(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
