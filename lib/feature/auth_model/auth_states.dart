class AuthStates {}

class AuthInitialStates extends AuthStates {}

class AuthLoadingStates extends AuthStates {}

class AuthSuccessStates extends AuthStates {}

class AuthErrorStates extends AuthStates {
  final String error;

  AuthErrorStates({required this.error});
}

class updateloadingstates extends AuthStates {}

class updatesuccesstates extends AuthStates {}

class updateerrorstates extends AuthStates {
  final String error;

  updateerrorstates({required this.error});
}
