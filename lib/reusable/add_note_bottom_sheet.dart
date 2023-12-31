import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/reusable/colors_list_view.dart';
import 'package:notes_app/reusable/custom_button.dart';
import 'package:notes_app/reusable/custom_text_field.dart';
import 'package:notes_app/reusable/show_snack_bar.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailureState) {
            showSnackBar(
                context: context,
                content: 'Error, try again ${state.err}',
                actionColor: Colors.red);
            debugPrint('err ${state.err}');
          } else if (state is AddNoteSuccessState) {
            showSnackBar(context: context, content: 'Task added successfully');
            NotesCubit.getOb(context).fetchNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          String? title, content;
          return AbsorbPointer(
            absorbing: state is AddNoteLoadingState ? true : false,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 32.0),
                child: Form(
                  key: _formKey,
                  autovalidateMode:
                      AddNoteCubit.getOb(context).autoValidateMode,
                  child: Column(
                    children: [
                      CustomTextField(
                        hint: 'Title',
                        maxLines: 1,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'enter title';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          title = value!;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: CustomTextField(
                          hint: 'Content',
                          onSaved: (value) {
                            content = value!;
                          },
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'please enter content';
                            }
                            return null;
                          },
                          maxLines: 5,
                        ),
                      ),
                      const ColorsListView(),
                      if (state is AddNoteLoadingState)
                        const Padding(
                          padding: EdgeInsets.only(top: 50.0),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      else
                        Padding(
                          padding: EdgeInsets.only(
                            top: 50.0,
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: CustomButton(
                            onTab: () {
                              var currentDate = DateTime.now();
                              var formattedDay =
                                  DateFormat.yMd().format(currentDate);
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                NoteModel noteModel = NoteModel(
                                    date: formattedDay.toString(),
                                    color: Colors.amber.value,
                                    subTitle: content.toString(),
                                    title: title.toString());
                                AddNoteCubit.getOb(context).addNote(noteModel);
                              } else {
                                AddNoteCubit.getOb(context)
                                    .changeAutoValidateMode();
                              }
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
