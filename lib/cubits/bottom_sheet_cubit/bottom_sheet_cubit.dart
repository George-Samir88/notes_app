import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_sheet_state.dart';

class BottomSheetCubit extends Cubit<BottomSheetState> {
  BottomSheetCubit() : super(BottomSheetInitial());

  static BottomSheetCubit getOb(context) =>
      BlocProvider.of<BottomSheetCubit>(context);

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void changeAutoValidateMode() {
    autoValidateMode = AutovalidateMode.always;
    emit(ChangeAutoValidateModeState());
  }
}
