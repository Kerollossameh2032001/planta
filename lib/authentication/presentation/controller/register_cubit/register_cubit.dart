import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planta/authentication/presentation/controller/register_cubit/register_state.dart';

class RegisterEngCubit extends Cubit<RegisterEngStates> {
  RegisterEngCubit() : super(RegisterEngInitialState());

  static RegisterEngCubit get(context) => BlocProvider.of(context);

  File? personalIDImage;
  File? profileImage;

  var picker = ImagePicker();

  Future<void> pickImage(
      {required ImageSource source, required String key}) async {
    emit(RegisterEngPickImageLoadingState());
    final pickedFile =
        await picker.pickImage(source: source /*ImageSource.gallery*/);
    if (pickedFile != null) {
      key == 'profile'
          ? profileImage = File(pickedFile.path)
          : personalIDImage = File(pickedFile.path);
      emit(RegisterEngPickImageSuccessState());
    } else {
      emit(RegisterEngPickImageErrorState(
          error: 'Error while Upload Image try again'));
    }
  }

  File? resume;
  PlatformFile? resumeDetails;

  //pick File(PDF)
  Future<void> pickDocument() async {
    emit(RegisterEngPickResumeLoadingState());
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      resume = File(result.files.single.path!);
      resumeDetails = result.files.first;
      emit(RegisterEngPickResumeSuccessState());
    } else {
      emit(RegisterEngPickResumeErrorState(error: 'No document Selected'));
    }
  }

  bool obscureText = true;
  Icon visibilityIcon = const Icon(Icons.visibility_off_outlined);

  void changeObscure() {
    obscureText = !obscureText;
    obscureText
        ? visibilityIcon = const Icon(Icons.visibility_off_outlined)
        : visibilityIcon = const Icon(Icons.visibility_outlined);
    emit(RegisterEngChangeObscureTextState());
  }

  String gender = '';

  void changeGender(String currentGender) {
    gender = currentGender;
    emit(RegisterEngChangeGenderState());
  }
}
