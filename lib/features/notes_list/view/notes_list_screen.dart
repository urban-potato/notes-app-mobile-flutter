import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/features/notes_list/widgets/note_tile.dart';
import 'package:notes_app/generated/l10n.dart';
import 'package:notes_app/repositories/notes/models/note.dart';
import 'package:notes_app/resources/resources.dart';

@RoutePage()
class NotesListScreen extends StatefulWidget {
  const NotesListScreen({super.key});

  @override
  State<NotesListScreen> createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  final notesList = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).allNotes),
        titleSpacing: AppMeasures.padding(context),
        scrolledUnderElevation: 0,
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
        itemBuilder: (BuildContext context, int index) {
          final note = notesList[index];

          return NoteTile(note: note);
        },
      ),
    );
  }
}
