import 'package:flutter/material.dart';
import 'package:notes_app/reusable/add_note_bottom_sheet.dart';
import 'package:notes_app/reusable/custom_app_bar.dart';
import 'package:notes_app/reusable/notes_list_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              context: context,
              builder: (context) =>const AddNoteBottomSheet());
        },
        child: const Icon(Icons.add),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomAppBar(icon: Icons.search, title: 'Notes'),
              Expanded(child: NotesListView()),
            ],
          ),
        ),
      ),
    );
  }
}
