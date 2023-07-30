import 'package:flutter/material.dart';
import 'package:notes_app/reusable/custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomAppBar(
                title: 'Edit Note',
                icon: Icons.edit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
