import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/reusable/custom_button.dart';
import 'package:notes_app/reusable/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailureState) {
          debugPrint('err ${state.err}');
        } else if (state is AddNoteSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        String? title, content;
        return SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AddNoteCubit.getOb(context).autoValidateMode,
              child: ModalProgressHUD(
                inAsyncCall: state is AddNoteLoadingState ? true : false,
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
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 100.0,
                      ),
                      child: CustomButton(
                        onTab: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
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
    );
  }
}
