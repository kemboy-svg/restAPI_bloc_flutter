part of 'user_bloc.dart';

@immutable
sealed class UserState extends Equatable {}

final class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}
