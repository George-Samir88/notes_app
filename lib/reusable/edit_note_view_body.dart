import 'package:flutter/material.dart';
import 'package:notes_app/reusable/custom_app_bar.dart';
import 'package:notes_app/reusable/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomAppBar(
                title: 'Edit Note',
                icon: Icons.check,
              ),
              SizedBox(
                height: 50.0,
              ),
              CustomTextField(
                hint: 'Title',
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomTextField(hint: 'Content' , maxLines: 5,),
            ],
          ),
        ),
      ),
    );
  }
}
