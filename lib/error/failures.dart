import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {


  Failure();

  @override
  List<Object> get props => [];
}

// Api failures
class ApiError extends Failure {
  final String? title;
  final String message;
  ApiError( {this.title,required  this.message}) : super();
}