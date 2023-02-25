import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wac_test/data/repos/wac_repo.dart';
import 'package:wac_test/presentation/Home/home_events.dart';
import 'package:wac_test/presentation/Home/home_states.dart';

class HomeBloc extends Bloc<HomeEvents,HomeStates> {
  HomeBloc(): super(GetProfilesLoadingState()) {
    on<GetProfilesEvent>((event, emit) async {
      try {
        emit(GetProfilesLoadingState());
        final profiles = await WacRepository().getProfile();
        emit(GetProfilesSuccessState(profiles: profiles));
      } catch (e) {
        emit(GetProfilesFailureState(failureMessage: e.toString()));
      }
    });
  }
}