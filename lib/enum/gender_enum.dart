import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String baseAsset = 'assets/gender_icons';
const Color genderIconColor = Colors.black;

enum Gender {
  male,
  female,
  genderless,
  unknown,
}

extension GenderIcon on Gender {
  Widget get icon {
    switch (this) {
      case Gender.male:
        return SvgPicture.asset('$baseAsset/male.svg', color: genderIconColor,width: 20, height: 20,);
      case Gender.female:
        return SvgPicture.asset('$baseAsset/female.svg', color: genderIconColor,width: 23, height: 23,);
      case Gender.genderless:
        return SvgPicture.asset('$baseAsset/genderless.svg', color: genderIconColor,width: 23, height: 23,);
      case Gender.unknown:
        return SvgPicture.asset('assets/question_mark.svg', color: genderIconColor,width: 25, height: 25,);
    }
  }
}

extension GenderTitle on Gender{
  String get title{
    switch(this){
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.genderless:
        return 'Genderless';
      case Gender.unknown:
        return 'Unknown';
    }
  }
}