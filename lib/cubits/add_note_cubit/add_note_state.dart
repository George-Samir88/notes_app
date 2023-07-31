part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class BottomSheetInitial extends AddNoteState {}

class ChangeAutoValidateModeState extends AddNoteState {}

class AddNoteLoadingState extends AddNoteState {}

class AddNoteSuccessState extends AddNoteState {}

class AddNoteFailureState extends AddNoteState {
  final String err;

  AddNoteFailureState(this.err);
}
