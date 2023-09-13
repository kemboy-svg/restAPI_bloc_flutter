import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:restapi_bloc/models/user_model.dart';
import 'package:restapi_bloc/repos/repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  // ignore: unused_field
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoading()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final users=await _userRepository.getuser();
        
        emit (UserLoaded(users));
        
        
      } catch (e) {
        emit(UserError(e.toString()));
      }

      
    });
  }
}
