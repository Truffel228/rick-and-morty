import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String baseAsset = 'assets/status_icons';

enum Status {
  alive,
  dead,
  unknown,
}

extension StatusIcon on Status {
  Widget get icon {
    switch (this) {
      case Status.alive:
        return SvgPicture.asset('$baseAsset/alive.svg', width: 25, height: 25,);
      case Status.dead:
        return SvgPicture.asset('$baseAsset/dead.svg', width: 25, height: 25,);
      case Status.unknown:
        return SvgPicture.asset('assets/question_mark.svg', width: 25, height: 25,);
    }
  }
}

extension StatusTitle on Status {
  String get title {
    switch (this) {
      case Status.alive:
        return 'Alive';
      case Status.dead:
        return 'Dead';
      case Status.unknown:
        return 'Unknown';
    }
  }
}
