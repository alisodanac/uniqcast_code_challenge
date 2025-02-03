import 'package:equatable/equatable.dart';
import 'package:uniqcast_code_challenge/core/errors/error_messages.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);
  @override
  List<Object?> get props => [message];
}

class NetworkFailure extends Failure {
 
  const NetworkFailure() : super(ErrorMessages.noInternetErrorMessage);
  
  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure() : super(ErrorMessages.serverErrorMessage);
  
  @override
  List<Object?> get props => [message];
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure() : super(ErrorMessages.emptyCashMessage);
  
  @override
  List<Object?> get props => [message];
}


class WrongDataFailure extends Failure{
  const WrongDataFailure():super(ErrorMessages.wrongDataErrorMessage);
  
  @override
  List<Object?> get props => [message];

}

class UnknownFailure extends Failure{
  const UnknownFailure():super(ErrorMessages.unknownErrorMessage);
  
  @override
  List<Object?> get props => [message];
  
}