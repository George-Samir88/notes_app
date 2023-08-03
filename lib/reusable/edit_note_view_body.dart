import 'package:flutter/material.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/reusable/custom_app_bar.dart';
import 'package:notes_app/reusable/custom_text_field.dart';
import 'package:notes_app/reusable/edit_note_colors_list_view.dart';
import 'package:notes_app/reusable/show_snack_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key, required this.noteModel});

  final NoteModel noteModel;
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    titleController.text = noteModel.title;
    var contentController = TextEditingController();
    contentController.text = noteModel.subTitle;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomAppBar(
                  title: 'Edit Note',
                  icon: Icons.check,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      noteModel.title = titleController.text;
                      noteModel.subTitle = contentController.text;
                      noteModel.save();
                      showSnackBar(
                          context: context,
                          content: 'Task updated successfully');
                      NotesCubit.getOb(context).fetchNotes();
                      Navigator.pop(context);
                    }
                  },
                ),
                const SizedBox(
                  height: 50.0,
                ),
                CustomTextField(
                  hint: 'Title',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Title must not be empty';
                    }
                    return null;
                  },
                  controller: titleController,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomTextField(
                  hint: 'Content',
                  maxLines: 5,
                  controller: contentController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Content must not be empty';
                    }
                    return null;
                  },
                ),
                EditNoteColorListView(noteModel: noteModel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
