/// Represents a category of a plate type. Each category must have its own
/// color theme representation.
///

import 'package:brazil_license_plate_drawing/src/plate_color_set.dart';
import 'package:flutter/material.dart';

enum BrazilMercosulPlateCategory {
  particular,
  comercial,
  especial,
  oficial,
  diplomatico,
  colecionador,
  colecionadorNacional,
}

extension BrazilMercosulPlateCategoryEx on BrazilMercosulPlateCategory {
  /// Return the equivalent [BrazilThreeLettersPlateCategory] of this [BrazilMercosulPlateCategory]
  BrazilThreeLettersPlateCategory get convertToThreeLetters {
    switch (this) {
      case BrazilMercosulPlateCategory.comercial:
        return BrazilThreeLettersPlateCategory.comercial;
      case BrazilMercosulPlateCategory.especial:
        return BrazilThreeLettersPlateCategory.especial;
      case BrazilMercosulPlateCategory.oficial:
        return BrazilThreeLettersPlateCategory.oficial;
      case BrazilMercosulPlateCategory.diplomatico:
        return BrazilThreeLettersPlateCategory.diplomatico;
      case BrazilMercosulPlateCategory.colecionador:
      case BrazilMercosulPlateCategory.colecionadorNacional:
        return BrazilThreeLettersPlateCategory.colecionador;
      case BrazilMercosulPlateCategory.particular:
      default:
        return BrazilThreeLettersPlateCategory.particular;
    }
  }

  PlateColorSet get plateColor {
    switch (this) {
      case BrazilMercosulPlateCategory.comercial:
        return PlateColorSet(
          backgroundColor: Colors.white,
          borderColor: Colors.red,
          lettersCollor: Colors.red,
        );

      case BrazilMercosulPlateCategory.especial:
        return PlateColorSet(
          backgroundColor: Colors.white,
          borderColor: Colors.green,
          lettersCollor: Colors.green,
        );

      case BrazilMercosulPlateCategory.oficial:
        return PlateColorSet(
          backgroundColor: Colors.white,
          borderColor: Colors.blue,
          lettersCollor: Colors.blue,
        );

      case BrazilMercosulPlateCategory.diplomatico:
        return PlateColorSet(
          backgroundColor: Colors.white,
          borderColor: Color(0xffdaa520),
          lettersCollor: Color(0xffdaa520),
        );

      case BrazilMercosulPlateCategory.colecionador:
        return PlateColorSet(
          backgroundColor: Colors.white,
          borderColor: Colors.grey,
          lettersCollor: Colors.grey,
        );

      case BrazilMercosulPlateCategory.colecionadorNacional:
        return PlateColorSet(
          backgroundColor: Colors.black,
          borderColor: Colors.white,
          lettersCollor: Colors.white,
        );

      case BrazilMercosulPlateCategory.particular:
      default:
        return PlateColorSet(
          backgroundColor: Colors.white,
          borderColor: Colors.black,
          lettersCollor: Colors.black,
        );
    }
  }
}

enum BrazilThreeLettersPlateCategory {
  particular,
  comercial,
  especial,
  oficial,
  diplomatico,
  colecionador,
  aprendizagem,
  representacao,
}

extension BrazilThreeLettersPlateCategoryEx on BrazilThreeLettersPlateCategory {
  double get lettersHeightRelation {
    if (this == BrazilThreeLettersPlateCategory.representacao) {
      return 0.8;
    }

    return 1.0;
  }

  /// Return the equivalent [BrazilMercosulPlateCategory] of this [BrazilThreeLettersPlateCategory]
  BrazilMercosulPlateCategory get convertToMercosul {
    switch (this) {
      case BrazilThreeLettersPlateCategory.aprendizagem:
      case BrazilThreeLettersPlateCategory.comercial:
        return BrazilMercosulPlateCategory.comercial;
      case BrazilThreeLettersPlateCategory.especial:
        return BrazilMercosulPlateCategory.especial;
      case BrazilThreeLettersPlateCategory.oficial:
        return BrazilMercosulPlateCategory.oficial;
      case BrazilThreeLettersPlateCategory.diplomatico:
        return BrazilMercosulPlateCategory.diplomatico;
      case BrazilThreeLettersPlateCategory.colecionador:
        return BrazilMercosulPlateCategory.colecionador;
      case BrazilThreeLettersPlateCategory.representacao:
        return BrazilMercosulPlateCategory.diplomatico;
      case BrazilThreeLettersPlateCategory.particular:
      default:
        return BrazilMercosulPlateCategory.particular;
    }
  }

  PlateColorSet get plateColor {
    switch (this) {    

      case BrazilThreeLettersPlateCategory.comercial:
        return PlateColorSet(
          backgroundColor: Colors.red[700]!,
          borderColor: Colors.red[900]!,
          lettersCollor: Colors.white,
        );

      case BrazilThreeLettersPlateCategory.oficial:
        return PlateColorSet(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFececec),
          lettersCollor: Colors.black,
        );

      case BrazilThreeLettersPlateCategory.especial:
        return PlateColorSet(
          backgroundColor: Colors.green[700]!,
          borderColor: Colors.green[900]!,
          lettersCollor: Colors.white,
        );

      case BrazilThreeLettersPlateCategory.diplomatico:
        return PlateColorSet(
          backgroundColor: Colors.blue[700]!,
          borderColor: Colors.blue[900]!,
          lettersCollor: Colors.white,
        );

      case BrazilThreeLettersPlateCategory.colecionador:
        return PlateColorSet(
          backgroundColor: Color(0xFF353535),
          borderColor: Color(0xFF242424),
          lettersCollor: Colors.white,
        );

      case BrazilThreeLettersPlateCategory.aprendizagem:
        return PlateColorSet(
          backgroundColor: Color(0xFFFFFFFF),
          borderColor: Color(0xFFececec),
          lettersCollor: Colors.red[700]!,
        );

      case BrazilThreeLettersPlateCategory.representacao:
        return PlateColorSet(
          backgroundColor: Color(0xFF353535),
          borderColor: Color(0xFF242424),
          lettersCollor: Color(0xffdaa520),
        );
        
      case BrazilThreeLettersPlateCategory.particular:
      default:
        return PlateColorSet(
          backgroundColor: Colors.grey[400]!,
          borderColor: Colors.grey,
          lettersCollor: Colors.black,
        );
    }
  }
}

enum BrazilTwoLettersPlateCategory {
  particular,
  comercial,
}

extension BrazilTwoLettersPlateCategoryEx on BrazilTwoLettersPlateCategory {
  PlateColorSet get plateColor {
    switch (this) {
      case BrazilTwoLettersPlateCategory.particular:
        return PlateColorSet(
          backgroundColor: Colors.amber,
          borderColor: Colors.amber[600]!,
          lettersCollor: Colors.black,
        );

      case BrazilTwoLettersPlateCategory.comercial:
        return PlateColorSet(
          backgroundColor: Colors.red[800]!,
          borderColor: Colors.red[900]!,
          lettersCollor: Colors.white,
        );

      default:
        return PlateColorSet(
          backgroundColor: Colors.amber,
          borderColor: Colors.amber[600]!,
          lettersCollor: Colors.black,
        );
    }
  }
}
