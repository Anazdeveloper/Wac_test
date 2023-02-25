import 'package:flutter/material.dart';
import 'package:wac_test/app_strings.dart';

class WacSearchView extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String? hint;

  WacSearchView({this.onChanged, this.hint});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16.0),
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText:hint?? AppStrings().search_profile, border: InputBorder.none),
          onChanged: onChanged,
        ),
      ),
    );
  }
}