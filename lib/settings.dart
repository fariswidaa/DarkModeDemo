import 'package:flutter/material.dart';

import 'package:DarkModeDemo/theme_changer.dart';


enum SingingCharacter { darkMode, lightMode }

SingingCharacter _character = SingingCharacter.darkMode;

ThemeChanger themeChangeProvider = new ThemeChanger();

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  void initState() {
    getCurrentAppTheme();
    super.initState();
    print('init state from settings.dart');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
        ),
      ),
      body: Container(
        child: ListTile(
          title: const Text('Dark mode'),
          onTap: () => showDialog(
            context: context,
            builder: (_) => DarkModeDialog(),
          ),
        ),
      ),
    );
  }
}

  
  ///
  /// This method will access the preference and
  /// return the result of the preference
  ///
  getCurrentAppTheme() async {
    // create a var to store the pref
    final themePref = await themeChangeProvider.themeModePreferences.getTheme();
    if (themePref) {
      _character = SingingCharacter.darkMode;
      // print the values for debugging purposes
      print(_character);
    } else {
      _character = SingingCharacter.lightMode;
      print(_character);
    }
    // get access to the preference through themeChangeProvider
    print(await themeChangeProvider.themeModePreferences.getTheme());
  }

  /// Create a method that will check the value,
  /// of the Radio buttons
  /// and save the theme preference on theme_pref
  /// The returning value is void

  checkRadioButtonToSavePref(BuildContext context) {
    switch (_character) {
      case SingingCharacter.darkMode:
        // save the dark mode
        themeChangeProvider.darkThemeSetter(true);
        Navigator.of(context).pop();
        print(_character);
        break;
      case SingingCharacter.lightMode:
        // save the light mode
        themeChangeProvider.darkThemeSetter(false);
        Navigator.of(context).pop();
        print(_character);
        break;
      default:
        // save the light mode
        throw Exception();
        break;
    }
  }


class DarkModeDialog extends StatefulWidget {
  @override
  _DarkModeDialogState createState() => _DarkModeDialogState();
}

class _DarkModeDialogState extends State<DarkModeDialog> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pick a theme'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            RadioListTile<SingingCharacter>(
              value: SingingCharacter.darkMode,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  print(_character);
                });
              },
              title: Text('Dark Mode'),
            ),
            RadioListTile<SingingCharacter>(
              value: SingingCharacter.lightMode,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  print(_character);
                });
                // _handleRadioValueChange(value);
              },
              title: Text('Light Mode'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed:() {
            Navigator.of(context).pop();
            getCurrentAppTheme();
          } 
        ),
        FlatButton(
          child: Text('OK'),
          // create a method
          onPressed: () => checkRadioButtonToSavePref(context),
        ),
      ],
    );
  }
}
