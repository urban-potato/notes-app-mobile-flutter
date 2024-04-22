import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/generated/l10n.dart';

@RoutePage()
class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding:
              EdgeInsets.symmetric(horizontal: AppMeasures.padding(context)),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                _TitleAreaWidget(id: id),
                const SizedBox(height: 10),
                _DescriptionAreaWidget(id: id),
                const SizedBox(height: 26),
                const _ButtonsAreaWidget(),
              ],
            ),
          ),
        ));
  }
}

class _TitleAreaWidget extends StatelessWidget {
  const _TitleAreaWidget({
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _TitleWidget(),
        const SizedBox(height: 4),
        _NoteTitleWidget(id: id),
      ],
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).title,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

class _NoteTitleWidget extends StatefulWidget {
  const _NoteTitleWidget({
    required this.id,
  });

  final int id;

  @override
  State<_NoteTitleWidget> createState() => _NoteTitleWidgetState();
}

class _NoteTitleWidgetState extends State<_NoteTitleWidget> {
  late TextEditingController? titleController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(
      text: _NotesData.notesList[widget.id].title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: titleController,
      decoration: _TextFieldDecoration.decoration,
      style: Theme.of(context).textTheme.bodyMedium,
      textCapitalization: TextCapitalization.sentences,
      keyboardAppearance: Brightness.dark,
      minLines: null,
      maxLines: null,
      maxLength: 100,
      textAlign: TextAlign.justify,
      textInputAction: TextInputAction.done,
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}

class _DescriptionAreaWidget extends StatelessWidget {
  const _DescriptionAreaWidget({
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _DescriptionWidget(),
        const SizedBox(height: 4),
        _NoteDescriptionWidget(id: id),
      ],
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget();

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).description,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

class _NoteDescriptionWidget extends StatefulWidget {
  const _NoteDescriptionWidget({
    required this.id,
  });

  final int id;

  @override
  State<_NoteDescriptionWidget> createState() => _NoteDescriptionWidgetState();
}

class _NoteDescriptionWidgetState extends State<_NoteDescriptionWidget> {
  late TextEditingController? descriptionController;

  @override
  void initState() {
    super.initState();

    descriptionController = TextEditingController(
      text: _NotesData.notesList[widget.id].description,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: descriptionController,
      decoration: _TextFieldDecoration.decoration,
      style: Theme.of(context).textTheme.bodyMedium,
      textCapitalization: TextCapitalization.sentences,
      keyboardAppearance: Brightness.dark,
      minLines: null,
      maxLines: null,
      textAlign: TextAlign.justify,
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}

class _ButtonsAreaWidget extends StatelessWidget {
  const _ButtonsAreaWidget();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _SaveButtonWidget(),
        _CancelButtonWidget(),
      ],
    );
  }
}

class _SaveButtonWidget extends StatelessWidget {
  const _SaveButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.mainGreen),
          foregroundColor: MaterialStateProperty.all(AppColors.mainTextDark),
          textStyle: MaterialStateProperty.all(
              Theme.of(context).textTheme.titleMedium),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 10),
          ),
        ),
        child: Text(S.of(context).save),
      ),
    );
  }
}

class _CancelButtonWidget extends StatelessWidget {
  const _CancelButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(AppColors.mainGreen),
          textStyle: MaterialStateProperty.all(
              Theme.of(context).textTheme.titleMedium),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(0),
          ),
        ),
        child: Text(S.of(context).cancel),
      ),
    );
  }
}

abstract class _TextFieldDecoration {
  const _TextFieldDecoration();

  static final decoration = InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.thirdDark),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: AppColors.mainGreen),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
    isCollapsed: true,
  );
}

abstract class _NotesData {
  const _NotesData();

  static final notesList = TempData.notesList;
}
