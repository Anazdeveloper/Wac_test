import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wac_test/app_strings.dart';
import 'package:wac_test/data/local_storage/local_storage_services.dart';
import 'package:wac_test/data/models/profile_model.dart';
import 'package:wac_test/data/repos/wac_repo.dart';
import 'package:wac_test/presentation/Home/home_events.dart';
import 'package:wac_test/presentation/Home/home_states.dart';
import 'package:wac_test/presentation/utils/string_extension.dart';

class HomeBloc extends Bloc<HomeEvents,HomeStates> {
  late List<Profile> _profiles;
  HomeBloc(): super(GetProfilesLoadingState()) {
    final _localStorage = LocalStorageServices();
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
        final savedString = await _localStorage.getProfiles();
        if(savedString != "") {
          print("Local data available");
          final savedProfiles = List<Profile>.from(jsonDecode(savedString).map((x) => Profile.fromJson(x)));
          _profiles = savedProfiles;
          emit(GetProfilesSuccessState(profiles: _profiles));
          return;
        } else {
          print("Api call needed");
          _profiles = await WacRepository().getProfile();
          await _localStorage.saveProfiles(_profiles);
          emit(GetProfilesSuccessState(profiles: _profiles));
          return;
        }
      } catch (e) {
        print(e);
        emit(GetProfilesFailureState(failureMessage: e.toString()));
      }
    });
  }
}