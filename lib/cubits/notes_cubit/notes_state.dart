import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoadingState extends NotesState {}

class NotesSuccessState extends NotesState {
  final List<NoteModel> noteModel;

  NotesSuccessState({required this.noteModel});
}

class NotesFailureState extends NotesState {
  final String error;

  NotesFailureState({required this.error});
}
