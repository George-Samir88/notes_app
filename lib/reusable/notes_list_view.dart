import 'package:flutter/cupertino.dart';
import 'package:notes_app/reusable/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return const Padding(
        padding: EdgeInsets.only(bottom: 12.0),
        child: NoteItem(),
      );
    });
  }
}
