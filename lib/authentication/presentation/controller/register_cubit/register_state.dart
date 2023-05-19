abstract class RegisterEngStates{}

class RegisterEngInitialState extends RegisterEngStates {}

class RegisterEngChangeObscureTextState extends RegisterEngStates {}

class RegisterEngChangeGenderState extends RegisterEngStates {}

class RegisterEngPickImageLoadingState extends RegisterEngStates {}

class RegisterEngPickImageSuccessState extends RegisterEngStates {}

class RegisterEngPickImageErrorState extends RegisterEngStates {
  final String error;

  RegisterEngPickImageErrorState({required this.error});
}

class RegisterEngPickResumeLoadingState extends RegisterEngStates {}

class RegisterEngPickResumeSuccessState extends RegisterEngStates {}

class RegisterEngPickResumeErrorState extends RegisterEngStates {
  final String error;

  RegisterEngPickResumeErrorState({required this.error});
}