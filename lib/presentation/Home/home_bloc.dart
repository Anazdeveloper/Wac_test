import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wac_test/app_strings.dart';
import 'package:wac_test/data/models/profile_model.dart';
import 'package:wac_test/data/repos/wac_repo.dart';
import 'package:wac_test/presentation/Home/home_events.dart';
import 'package:wac_test/presentation/Home/home_states.dart';
import 'package:wac_test/presentation/utils/string_extension.dart';

class HomeBloc extends Bloc<HomeEvents,HomeStates> {
  late List<Profile> _profiles;
  HomeBloc(): super(GetProfilesLoadingState()) {
    on<GetProfilesEvent>((event, emit) async {
      try {
        if(event.name != null) {
          emit(GetProfilesLoadingState());
          final profiles = List<Profile>.of(_profiles.where((element) => element.name.containsIgnoreCase(event.name!)));
          if(profiles.isEmpty) {
            emit(GetProfilesEmptyState(message: AppStrings().no_records));
            return;
          }
          emit(GetProfilesSuccessState(profiles: profiles));
          return;
        }
        emit(GetProfilesLoadingState());
        _profiles = await WacRepository().getProfile();
        emit(GetProfilesSuccessState(profiles: _profiles));
      } catch (e) {
        emit(GetProfilesFailureState(failureMessage: e.toString()));
      }
    });
  }
}