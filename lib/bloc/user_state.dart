part of 'user_bloc.dart';

@immutable
sealed class UserState extends Equatable {}

final class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

final class UserLoaded extends UserState {
  UserLoaded(this.users);
  final List<UserModel> users;
  
  @override
  List<Object> get props => [users];
}

final class UserError extends UserState {
  UserError(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}