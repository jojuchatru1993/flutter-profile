import 'package:flutter/material.dart';

import 'package:profile/src/shared_preferences/user_preferences.dart';

import 'package:profile/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secundaryColor;
  int _gender;
  String _username;

  TextEditingController _textController;

  final prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();

    prefs.lastPage = SettingsPage.routeName;

    _gender = prefs.gender;
    _secundaryColor = prefs.secundaryColor;
    _username = prefs.username;

    _textController = new TextEditingController(text: _username);
  }

  _setSelectedRadio(int value) {
    prefs.gender = value;
    _gender = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: (prefs.secundaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
              value: _secundaryColor,
              title: Text('Secundary Color'),
              onChanged: (value) {
                setState(() {
                  _secundaryColor = value;
                  prefs.secundaryColor = value;
                });
              }),
          RadioListTile(
              value: 1,
              title: Text('Male'),
              groupValue: _gender,
              onChanged: _setSelectedRadio),
          RadioListTile(
              value: 2,
              title: Text('Female'),
              groupValue: _gender,
              onChanged: _setSelectedRadio),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                  labelText: 'Username', helperText: 'Name or username'),
              onChanged: (value) {
                prefs.username = value;
              },
            ),
          )
        ],
      ),
    );
  }
}
