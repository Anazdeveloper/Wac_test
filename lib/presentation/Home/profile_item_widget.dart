import 'package:flutter/material.dart';
import 'package:wac_test/data/models/profile_model.dart';
import 'package:wac_test/presentation/utils/widgets/wac_image.dart';

class ProfileItemWidget extends StatelessWidget {
  final Profile profile;
  final void Function()? onTap;

  ProfileItemWidget({required this.profile, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.blueAccent,
            width: 3.0
          ),
          borderRadius: BorderRadius.circular(20.0)
        ),
        elevation: 2.0,
        child: ListTile(
          onTap: onTap,
          leading: WacImage(imageProvider: NetworkImage(profile.profileImage ?? ""), width: 50, height: 50, radius: 4.0,),
          title: Text(profile.name),
          subtitle: Text(profile.company == null ? "" : profile.company!.name),
        ),
      ),
    );
  }
}