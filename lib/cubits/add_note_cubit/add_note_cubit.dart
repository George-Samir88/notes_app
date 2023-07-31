import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  static AddNoteCubit getOb(context) => BlocProvider.of<AddNoteCubit>(context);

  addNote(NoteModel noteModel) {
    emit(AddNoteLoadingState());
    try {
      Box<NoteModel> noteBox = Hive.box<NoteModel>(kHiveBox);
      noteBox.add(noteModel);
      emit(AddNoteSuccessState());
    } catch (err) {
      print(err.toString());
      emit(AddNoteFailureState(err.toString()));
    }
  }
}
