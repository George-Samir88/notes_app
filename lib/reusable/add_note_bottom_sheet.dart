import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/reusable/custom_button.dart';
import 'package:notes_app/reusable/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            children: [
              CustomTextField(
                hint: 'Title',
                maxLines: 1,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: CustomTextField(
                  hint: 'Content',
                  maxLines: 5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 100.0,
                ),
                child: CustomButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
