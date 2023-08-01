import 'package:flutter/material.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}


class NotesSuccessState extends NotesState {

  NotesSuccessState();
}

