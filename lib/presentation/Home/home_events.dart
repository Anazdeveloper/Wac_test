import 'package:equatable/equatable.dart';

class HomeEvents extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class GetProfilesEvent extends HomeEvents {
  final String ? name;

  GetProfilesEvent({this.name});

  @override
  List<Object?> get props => [name];
}