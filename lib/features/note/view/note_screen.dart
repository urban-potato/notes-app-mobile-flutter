import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/generated/l10n.dart';

@RoutePage()
class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key, required this.id});

  final int id;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final notesList = TempData.notesList;

  late TextEditingController? titleController;
  late TextEditingController? descriptionController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(
      text: notesList[widget.id].title,
    );
    descriptionController = TextEditingController(
      text: notesList[widget.id].description,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textFieldDecoration = InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.thirdDark),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.mainGreen),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
      isCollapsed: true,
    );

    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding:
              EdgeInsets.symmetric(horizontal: AppMeasures.padding(context)),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      controller: titleController,
                      decoration: textFieldDecoration,
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
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).description,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      controller: descriptionController,
                      decoration: textFieldDecoration,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardAppearance: Brightness.dark,
                      minLines: null,
                      maxLines: null,
                      textAlign: TextAlign.justify,
                      onTapOutside: (PointerDownEvent event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.mainGreen),
                          foregroundColor:
                              MaterialStateProperty.all(AppColors.mainTextDark),
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
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(AppColors.mainGreen),
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
