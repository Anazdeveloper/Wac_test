import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wac_test/app_strings.dart';
import 'package:wac_test/presentation/Home/home_bloc.dart';
import 'package:wac_test/presentation/Home/home_events.dart';
import 'package:wac_test/presentation/Home/home_states.dart';
import 'package:wac_test/presentation/Home/profile_item_widget.dart';
import 'package:wac_test/presentation/Profile/arguments/profile_arguments.dart';
import 'package:wac_test/presentation/utils/widgets/app_loader.dart';
import 'package:wac_test/presentation/utils/widgets/errors.dart';
import 'package:wac_test/presentation/utils/widgets/wac_search_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _homeBloc = HomeBloc();

  @override
  void initState() {
    _homeBloc.add(GetProfilesEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings().wac_test),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
                top: AppBar().preferredSize.height - 20,
                left: 10,
                right: 10,
                child: WacSearchView(
                  onChanged: (value) {
                    _homeBloc.add(GetProfilesEvent(name: value));
                  },
                )
            ),
            Positioned(
                top: AppBar().preferredSize.height + 40,
                left: 0,
                right: 0,
                bottom: 10,
                child: BlocBuilder(
                  bloc: _homeBloc,
                  builder: (context, state) {
                    if(state is GetProfilesSuccessState) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return ProfileItemWidget(
                                profile: state.profiles[index],
                                onTap: () {
                                  Navigator.of(context).pushNamed('/profile_page', arguments: ProfileArguments(profile: state.profiles[index]));
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(height: 10.0);
                            },
                            itemCount: state.profiles.length
                        ),
                      );
                    }
                    if(state is GetProfilesEmptyState) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: ErrorMessage(
                          message: state.message,
                        ),
                      );
                    }
                    if(state is GetProfilesLoadingState) {
                      return const Center(
                        child: AppLoader()
                      );
                    }
                    return Container();
                  },
                ),
            )
          ],
        )
      ),
    );
  }
}