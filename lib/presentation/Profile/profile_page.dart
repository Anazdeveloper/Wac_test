import 'package:flutter/material.dart';
import 'package:wac_test/app_strings.dart';
import 'package:wac_test/data/models/profile_model.dart';
import 'package:wac_test/presentation/Profile/arguments/profile_arguments.dart';
import 'package:wac_test/presentation/utils/widgets/wac_image.dart';

class ProfilePage extends StatefulWidget {
  final ProfileArguments arguments;

  ProfilePage({required this.arguments});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Profile ? _profile;

  @override
  void initState() {
    _profile = widget.arguments.profile;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings().profile),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: MediaQuery.of(context).size.height * 0.075,
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.height * 0.088,
                      child: WacImage(
                        imageProvider: NetworkImage(
                            _profile?.profileImage ?? ""),
                        radius: MediaQuery.of(context).size.height * 0.098,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(_profile!.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                const SizedBox(
                  height: 10.0,
                ),
                Text(_profile!.email, style: const TextStyle(fontSize: 15.0)),
                const SizedBox(
                  height: 10.0,
                ),
                Text("${_profile!.address.suite}, ${_profile!.address.street}, ${_profile!.address.city}, ${_profile!.address.zipcode}", maxLines: 2),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppStrings().contact_number, style: TextStyle(color: Colors.blueGrey),),
                    Text(_profile!.phone ?? AppStrings().not_available)
                  ],
                ),
                const Divider(
                  color: Colors.blueGrey,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppStrings().website, style: TextStyle(color: Colors.blueGrey),),
                    Text(_profile!.website ?? AppStrings().not_available)
                  ],
                ),
                const Divider(
                  color: Colors.blueGrey,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppStrings().username, style: TextStyle(color: Colors.blueGrey),),
                    Text(_profile!.username)
                  ],
                ),
                const Divider(
                  color: Colors.blueGrey,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppStrings().company_name, style: TextStyle(color: Colors.blueGrey),),
                    Text(_profile!.company != null ? _profile!.company!.name : AppStrings().not_available),
                  ],
                ),
                const Divider(
                  color: Colors.blueGrey,
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}