import 'package:flutter/material.dart';
import 'package:notes_app/repositories/notes/models/note.dart';

abstract class AppColors {
  static Color mainDark = const Color(0xFF252525);
  static Color mainGreen = const Color(0xFF3DD178);
  static Color secondaryDark = const Color(0xFF323232);
  static Color thirdDark = const Color(0xFF7C7C7C);
  static Color mainGreenDark = const Color(0xFF066736);
  static Color mainRed = const Color(0xFFE32C2C);

  static Color mainTextDark = Colors.white;
  static Color secondaryTextDark = const Color(0xFF939393);
  static Color thirdTextDark = const Color(0xFFC9C9C9);
}

abstract class AppMeasures {
  static double padding(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.075;
  }
}

abstract class TempData {
  static List<Note> notesList = [
    const Note(
      id: 0,
      title: 'Note 1',
      description: "Full description 1...",
      dateTime: '2024-04-13 17:58',
    ),
    const Note(
      id: 1,
      title: 'Note 2',
      description: "Full description 2...",
      dateTime: '2024-04-12 17:58',
    ),
    const Note(
      id: 2,
      title: 'Note 3',
      description: "Full description 3...",
      dateTime: '2024-04-11 17:58',
    ),
    const Note(
      id: 3,
      title: 'Note 4',
      description: "Full description 4...",
      dateTime: '2024-04-10 17:58',
    ),
    const Note(
      id: 4,
      title: 'Note 5',
      description: "Full description 5...",
      dateTime: '2024-04-09 17:58',
    ),
    const Note(
      id: 5,
      title: 'Note 6',
      description: "Full description 6...",
      dateTime: '2024-04-08 17:58',
    ),
  ];
}
