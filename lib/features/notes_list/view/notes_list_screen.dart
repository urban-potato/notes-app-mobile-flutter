import 'package:flutter/material.dart';
import 'package:notes_app/features/notes_list/widgets/note_tile.dart';
import 'package:notes_app/generated/l10n.dart';
import 'package:notes_app/repositories/notes/models/note.dart';

class NotesListScreen extends StatefulWidget {
  const NotesListScreen({super.key});

  @override
  State<NotesListScreen> createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  final notesList = [
    const Note(
      title: 'Note 1',
      description: "Full description 1...",
      dateTime: '2024-04-13 17:58',
    ),
    const Note(
      title: 'Note 2',
      description: "Full description 2...",
      dateTime: '2024-04-12 17:58',
    ),
    const Note(
      title: 'Note 3',
      description: "Full description 3...",
      dateTime: '2024-04-11 17:58',
    ),
    const Note(
      title: 'Note 4',
      description: "Full description 4...",
      dateTime: '2024-04-10 17:58',
    ),
    const Note(
      title: 'Note 5',
      description: "Full description 5...",
      dateTime: '2024-04-09 17:58',
    ),
    const Note(
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
        titleSpacing: MediaQuery.of(context).size.width * 0.075,
        scrolledUnderElevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.075),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _NotesNumberText(notesList: notesList),
            const SizedBox(height: 10),
            _NotesTilesList(notesList: notesList)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: S.of(context).newNote,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
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
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
