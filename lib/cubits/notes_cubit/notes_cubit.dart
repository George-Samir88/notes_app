import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_state.dart';
import 'package:notes_app/models/note_model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  static NotesCubit getOb(context) => BlocProvider.of<NotesCubit>(context);

  List<NoteModel>? notesModelList;

  fetchNotes() {
    Box<NoteModel> notes = Hive.box(kHiveBox);
    notesModelList = notes.values.toList();
    emit(NotesSuccessState());
  }
}
