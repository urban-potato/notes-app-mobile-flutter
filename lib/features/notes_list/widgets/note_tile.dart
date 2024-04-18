import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/repositories/notes/models/note.dart';
import 'package:notes_app/router/router.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.secondaryDark,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: _NoteInfo(note: note),
          )),
    );
  }
}

class _NoteInfo extends StatelessWidget {
  const _NoteInfo({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: _NoteTitle(title: note.title),
      subtitle: _NoteDescriptionAndTime(note: note),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 26),
      onTap: () {
        AutoRouter.of(context).push(NoteRoute(id: note.id));
      },
    );
  }
}

class _NoteTitle extends StatelessWidget {
  const _NoteTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
      ),
    );
  }
}

class _NoteDescriptionAndTime extends StatelessWidget {
  const _NoteDescriptionAndTime({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (note.description != null && note.description != '')
          _NoteDescription(description: note.description),
        const SizedBox(height: 7),
        _NoteTime(dateTime: note.dateTime)
      ],
    );
  }
}

class _NoteDescription extends StatelessWidget {
  const _NoteDescription({
    super.key,
    required this.description,
  });

  final String? description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description ?? '',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18),
    );
  }
}

class _NoteTime extends StatelessWidget {
  const _NoteTime({
    super.key,
    required this.dateTime,
  });

  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.alarm, size: 20),
        const SizedBox(width: 6),
        Text(
          dateTime,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}
