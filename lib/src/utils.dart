import 'package:brazil_license_plate_drawing/src/brazil_plate_category.dart';
import 'package:flutter/material.dart';

import '../brazil_license_plate_drawing.dart';

mixin PlateUtils {
  
   /// Converts an old plate [String] to the Mercosul standard.
   ///
   /// The old card must be in "AAA9999" format.
   ///
   /// Returns the new plate in the Mercosur pattern.
  static String convertToMercosulPlate(String? oldPlate) {
    if (oldPlate == null) {
      throw ArgumentError.notNull('oldPlate');
    }

    String cleanPlate = oldPlate.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

    RegExp oldPlateRegex = RegExp(r'^([A-Z]{3})(\d{4})$');
    if (!oldPlateRegex.hasMatch(cleanPlate)) {
      throw FormatException('Invalid old plate format.');
    }

    String newPlate = cleanPlate.replaceAllMapped(oldPlateRegex, (match) => '${match[1]}${match[2]![0]}${match[1]![2]}${match[2]!.substring(1)}');

    return newPlate.toUpperCase();
  }

  /// Converts a [String] from Mercosul license plate to the old standard.
   ///
   /// The Mercosul license plate must be in the "AAA1A11" format.
   ///
   /// Returns the new plate in the old pattern.
  static String convertToOldPlate(String? newPlate) {
    if (newPlate == null) {
      throw ArgumentError.notNull('newPlate');
    }

    String cleanPlate = newPlate.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

    RegExp newPlateRegex = RegExp(r'^([A-Z]{3})(\d)([A-Z]{1})(\d{2})$');
    if (!newPlateRegex.hasMatch(cleanPlate)) {
      throw FormatException('Invalid mercosul format.');
    }

    String oldPlate = cleanPlate.replaceAllMapped(newPlateRegex, (match) => '${match[1]}${match[3]}${match[4]}');

    return oldPlate.toUpperCase();
  }

  /// Create a [ThreeLettersPlate] or [MercosulPlate] from [String]. The plate type is auto-selected by format of [String].
  ///  The [category] is auto-converted from [BrazilMercosulPlateCategory] to [BrazilThreeLettersPlateCategory] if needed.
 static Widget? createPlate(String plate, {String? locality, BrazilMercosulPlateCategory category = BrazilMercosulPlateCategory.particular, double? width, double? height}) {
    locality = locality?.trim() ?? "";
    if (ThreeLettersPlate.isValidPlate(plate)) {
      return ThreeLettersPlate(
        plate,
        height: height,
        width: width,
        locality: locality,
        showLocality: locality.trim() != "",
        category: category.convertToThreeLetters,
      );
    } else if (MercosulPlate.isValidPlate(plate)) {
      return MercosulPlate(
        plate,
        height: height,
        width: width,
        category: category,
      );
    }
    return null;
  }
}
