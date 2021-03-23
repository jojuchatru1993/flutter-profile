import 'package:flutter/material.dart';
import 'package:profile/src/shared_preferences/user_preferences.dart';

import 'package:profile/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('User Preferences'),
        backgroundColor: (prefs.secundaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Secundary Color: ${prefs.secundaryColor}'),
        Divider(),
        Text('Gender: ${prefs.gender}'),
        Divider(),
        Text('Username: ${prefs.username}'),
        Divider()
      ]),
    );
  }
}
