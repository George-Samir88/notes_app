import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_state.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/reusable/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notesList =
            NotesCubit.getOb(context).notesModelList ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: NoteItem(noteModel: notesList[index]),
                );
              }),
        );
      },
    );
  }
}
