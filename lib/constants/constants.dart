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
      title: 'About dogs',
      description:
          """Dogs are fantastic animals. They love people more than people can love themselves. Dogs are the cleverest of all pets and most other animals. Dogs have absolutely human eyes in which you can read that they understand everything. There are few people who can be called loyal, but every dog is completely loyal to its master. I read and heard many sad stories when after losing a master dogs grieved so much, that stopped to take food and died. There exist lots of breeds of dogs, so that we can choose the one that suits us best. Personally I prefer to keep large dogs. I have two Irish wolfhounds. But I keep them in my country house, so my dogs have enough space to feel comfortable. That is very important to consider all the necessary conditions for dogs. For example, you should not buy a big dog if you leave in a small flat. And if you have a large flat, but do not have a suitable place near your house to walk your dog – also think then. Dogs should not feel uncomfortable only because we just want to keep them. So I love big dogs, but not without hair. Mostly mastiffs and dogs of fighting breeds have very short hair. I do not like such dogs. I see a lot of difference between «faces» of fighting dogs and other breeds. I cannot read anything in the eyes of fighting dogs, but read everything in the eyes of other dogs. But this is, of course, my personal opinion. I really do not understand people who keep dogs of so-called decorative breeds. Some of these dogs are smaller than cats. What is the point in keeping a dog that can hardly bark? Almost any of these dogs costs more, than a big one. I do not know why, but it is mostly lonely old people that keep decorative dogs.

I also like not pedigree dogs. And if you want a dog, but do not have enough money you can take a stray dog or a dog from a shelter. These dogs can be even cleverer and more understanding than pedigree dogs.
When you leave alone and have a cat you may still feel lonely, because cats always exist by themselves. But you will never feel lonely when you have dog, because dogs have a man's soul.

There are numerous cases when dogs saved their masters and their families from various disasters. I think dogs are not just animals, they are real angels. And besides I would not call such a clever and understanding living being a «pet».""",
      dateTime: '2024-04-13 17:58',
    ),
    const Note(
      id: 1,
      title: 'Buy milk',
      description: null,
      dateTime: '2024-04-12 17:58',
    ),
    const Note(
      id: 2,
      title:
          'Note hehe hello ksiengsd fefohdusu ejefeh efe eefef efefeg  oefhuwef efweuhew odmgnew j dfiojeg djeg',
      description: "Full description 3",
      dateTime: '2024-04-11 17:58',
    ),
    const Note(
      id: 3,
      title: 'Note 4',
      description: '',
      dateTime: '2024-04-10 17:58',
    ),
    const Note(
      id: 4,
      title: 'Note 5',
      description: "Full description 5",
      dateTime: '2024-04-09 17:58',
    ),
    const Note(
      id: 5,
      title: 'Note 6',
      description: "Full description 6",
      dateTime: '2024-04-08 17:58',
    ),
  ];
}
