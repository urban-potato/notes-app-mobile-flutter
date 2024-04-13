import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/repositories/notes/models/note.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.secondaryDark,
      ),
      child: _noteInfo(context),
    );
  }

  ListTile _noteInfo(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: _noteTitle(context),
      subtitle: _noteDescriptionAndTime(context),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 26),
      onTap: () {},
    );
  }

  Padding _noteTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        note.title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
      ),
    );
  }

  Column _noteDescriptionAndTime(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _noteDescription(context),
        const SizedBox(height: 7),
        _noteTime(context),
      ],
    );
  }

  Text _noteDescription(BuildContext context) {
    return Text(
      note.description,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 18),
    );
  }

  Row _noteTime(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.alarm, size: 20),
        const SizedBox(width: 6),
        Text(
          note.dateTime,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}
