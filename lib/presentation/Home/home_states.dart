import 'package:equatable/equatable.dart';
import 'package:wac_test/data/models/profile_model.dart';

class HomeStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class GetProfilesLoadingState extends HomeStates {

}

class GetProfilesSuccessState extends HomeStates {
  final List<Profile> profiles;

  GetProfilesSuccessState({required this.profiles});

  @override
  List<Object?> get props => [profiles];
}

class GetProfilesEmptyState extends HomeStates {
  final String message;

  GetProfilesEmptyState({required this.message});

  @override
  List<Object?> get props => [message];
}

class GetProfilesFailureState extends HomeStates {
  final String failureMessage;

  GetProfilesFailureState({required this.failureMessage});

  @override
  List<Object?> get props => [failureMessage];
}