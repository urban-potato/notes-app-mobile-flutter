import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/features/notes_list/widgets/language.dart';
import 'package:notes_app/features/notes_list/widgets/note_tile.dart';
import 'package:notes_app/generated/l10n.dart';
import 'package:notes_app/notes_app.dart';
import 'package:notes_app/repositories/notes/models/note.dart';
import 'package:notes_app/resources/resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class NotesListScreen extends StatefulWidget {
  const NotesListScreen({super.key});

  @override
  State<NotesListScreen> createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  final notesList = TempData.notesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).allNotes),
        titleSpacing: AppMeasures.padding(context),
        scrolledUnderElevation: 0,
        actions: const <Widget>[_ChangeLocaleDropdownButtonWidget()],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: AppMeasures.padding(context)),
        child: _Notes(notesList: notesList),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: S.of(context).newNote,
        child: const Icon(
          Icons.add_rounded,
          size: 30,
        ),
        onPressed: () {},
      ),
    );
  }
}

class _ChangeLocaleDropdownButtonWidget extends StatelessWidget {
  const _ChangeLocaleDropdownButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: AppMeasures.padding(context)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Language>(
          value: null,
          dropdownColor: AppColors.fourthDark,
          icon: Icon(
            Icons.language,
            color: AppColors.mainTextDark,
            size: 28,
          ),
          onChanged: (Language? language) =>
              _handleChangeLocale(language, context),
          items: Language.languageList()
              .map<DropdownMenuItem<Language>>(
                (language) => DropdownMenuItem<Language>(
                  value: language,
                  child:
                      _ChangeLocaleDropdownMenuItemWidget(language: language),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void _handleChangeLocale(Language? language, BuildContext context) async {
    if (language != null) {
      NotesApp.setLocale(
        context,
        language.languageCode,
      );

      final sharedPreferences = GetIt.I<SharedPreferences>();
      sharedPreferences.setString(
          SharedPreferencesKeys.locale, language.languageCode);
    }
  }
}

class _ChangeLocaleDropdownMenuItemWidget extends StatelessWidget {
  const _ChangeLocaleDropdownMenuItemWidget({
    super.key,
    required this.language,
  });

  final Language language;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          language.flag,
          style: const TextStyle(fontSize: 28, color: Colors.white),
        ),
        Text(
          language.name,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        )
      ],
    );
  }
}

class _Notes extends StatelessWidget {
  const _Notes({
    super.key,
    required this.notesList,
  });

  final List<Note> notesList;

  @override
  Widget build(BuildContext context) {
    if (notesList.isEmpty) {
      return const _NoNotes();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _NotesNumberText(notesList: notesList),
        const SizedBox(height: 10),
        _NotesTilesList(notesList: notesList),
      ],
    );
  }
}

class _NoNotes extends StatelessWidget {
  const _NoNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            S.of(context).whatsOnYourMind,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.075,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Svgs.womanPointing,
                semanticsLabel: S.of(context).womanPointingToABoardWithNotes,
                fit: BoxFit.scaleDown,
                height: (MediaQuery.of(context).size.width -
                        AppMeasures.padding(context)) *
                    1200 /
                    1600,
                width: MediaQuery.of(context).size.width -
                    AppMeasures.padding(context),
              ),
              Center(
                child: Text(
                  S.of(context).letsWriteWhatsOnYourMind,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NotesNumberText extends StatelessWidget {
  const _NotesNumberText({
    super.key,
    required this.notesList,
  });

  final List<Note> notesList;

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).notesnumberNotes(notesList.length),
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}

class _NotesTilesList extends StatelessWidget {
  const _NotesTilesList({
    super.key,
    required this.notesList,
  });

  final List<Note> notesList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: notesList.length,
        // itemExtent: 150,
        itemBuilder: (BuildContext context, int index) {
          final note = notesList[index];

          return NoteTile(note: note);
        },
      ),
    );
  }
}
