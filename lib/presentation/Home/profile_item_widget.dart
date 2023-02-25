import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wac_test/data/models/profile_model.dart';
import 'package:wac_test/presentation/utils/widgets/wac_image.dart';

class ProfileItemWidget extends StatelessWidget {
  final Profile profile;

  ProfileItemWidget({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.blueAccent,
            width: 3.0
          ),
          borderRadius: BorderRadius.circular(20.0)
        ),
        elevation: 2.0,
        child: ListTile(
          leading: WacImage(imageProvider: NetworkImage(profile.profileImage ?? ""), width: 50, height: 50, radius: 4.0,),
          title: Text(profile.name),
          subtitle: Text(profile.company == null ? "" : profile.company!.name),
        ),
      ),
    );
  }
}