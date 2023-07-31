import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(BottomSheetInitial());

  static AddNoteCubit getOb(context) => BlocProvider.of<AddNoteCubit>(context);

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void changeAutoValidateMode() {
    autoValidateMode = AutovalidateMode.always;
    emit(ChangeAutoValidateModeState());
  }

  addNote(NoteModel noteModel) async {
    emit(AddNoteLoadingState());
    try {
      Box<NoteModel> noteBox = Hive.box<NoteModel>(kHiveBox);
      await noteBox.add(noteModel);
      emit(AddNoteSuccessState());
    } catch (err) {
      debugPrint(err.toString());
      emit(AddNoteFailureState(err.toString()));
    }
  }
}
