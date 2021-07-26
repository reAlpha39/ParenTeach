import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Margin Kanan Kiri
const double margin = 21;

/// Global Base Color
const blackColor = Color(0xFF000000);
const blackColor2 = Color(0xFF353535);
const pinkColor = Color(0xFFFF5976);
const blueColor = Color(0xFF3EB6C1);
const yellowAccentColor = Color(0xFFFBBB00);
const greyBackgroundColor = Color(0xFFF1F3F6);

/// Black Text Style
/// Gunakan method copyWith() untuk mengubah propertinya
TextStyle blackText = GoogleFonts.poppins();
TextStyle blackTextBold = GoogleFonts.poppins(fontWeight: FontWeight.bold);
TextStyle blackText2 = GoogleFonts.poppins(color: blackColor2);
TextStyle blackTextBold2 =
    GoogleFonts.poppins(color: blackColor2, fontWeight: FontWeight.bold);

/// Black Text Style
/// Gunakan method copyWith() untuk mengubah propertinya
TextStyle whiteText = GoogleFonts.poppins(
  color: Colors.white,
);
TextStyle whiteTextBold =
    GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold);

/// Black Text Style
/// Gunakan method copyWith() untuk mengubah propertinya
TextStyle pinkText = GoogleFonts.poppins(
  color: pinkColor,
);
TextStyle pinkTextBold =
    GoogleFonts.poppins(color: pinkColor, fontWeight: FontWeight.bold);
