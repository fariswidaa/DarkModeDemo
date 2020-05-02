import 'package:flutter/material.dart';

import 'package:DarkModeDemo/theme_changer.dart';

//bool checkValue = true;

enum SingingCharacter { darkMode, lightMode }

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  ThemeChanger themeChangeProvider = new ThemeChanger();

  int _radioValue = -1;

  SingingCharacter _character = SingingCharacter.darkMode;

  void initState() {
    getCurrentAppTheme();
    super.initState();
    print('init state from settings.dart');
  }
  
///
/// This method will access the preference and 
/// return the result of the preference 
/// 
  getCurrentAppTheme() async {
    // create a var to store the pref
    final themePref = await themeChangeProvider.themeModePreferences.getTheme() ;
    if (themePref){
      _character = SingingCharacter.darkMode ;
      // print the values for debugging purposes 
      print (_character);
    } else {
      _character = SingingCharacter.lightMode ;
      print (_character);
    }
    // get access to the preference through themeChangeProvider
    print(await themeChangeProvider.themeModePreferences.getTheme());
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
          onTap: () => _showingDialog(),
        ),
      ),
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          print('Dark Mode');
          break;
        case 1:
          print('Light Mode');
          break;
        default:
          print('none');
      }
    });
  }
/* 
  _onChanged(bool value) async {
    setState(() {
      checkValue = value;
      print(checkValue);
      themeChangeProvider.darkThemeSetter(value);
    });
  }

  void checkValueSetter(bool value) {
    checkValue = value;
    print('the value from Settings for checkValue is  $checkValue');
  }

  void setCheckValueSetter() {
    checkValue = themeChangeProvider.darkTheme;
  } */

/*   Widget _showDialog() {
    return SimpleDialog(
      title: Text('Choose a theme'),
      children: <Widget>[
        RadioListTile(
          value: 0,
          groupValue: _radioValue,
          onChanged: _handleRadioValueChange,
        //  title: Text('Dark Mode'),
        ),
        RadioListTile(
          value: 1,
          groupValue: _radioValue,
          onChanged: _handleRadioValueChange,
         // title: Text('Light Mode'),
        ),
      ],
    );
  } */

  Future<void> _showingDialog() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Pick a theme'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  RadioListTile<SingingCharacter>(
                    value: SingingCharacter.darkMode,
                    groupValue: _character,
                    onChanged: ( SingingCharacter value) {
                      setState((){
                          _character = value;
                          print(_character);
                      });
                     // _handleRadioValueChange(value);
                    },
                    title: Text('Dark Mode'),
                  ),
                  RadioListTile<SingingCharacter>(
                    value: SingingCharacter.lightMode,
                    groupValue: _character,
                    onChanged: ( SingingCharacter value) {
                      setState((){
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
            actions : <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('OK'),
                // create a method 
                onPressed: () => 
                checkRadioButtonToSavePref(),
              ),
            ],
          );
        },
        );
  }
 
 
  /// Create a method that will check the value,
  /// of the Radio buttons 
  /// and save the theme preference on theme_pref
  /// The returning value is void 
  
 checkRadioButtonToSavePref () {
    switch (_character){
      case SingingCharacter.darkMode :
      // save the dark mode 
      themeChangeProvider.darkThemeSetter(true);
      Navigator.of(context).pop();
      print (_radioValue);
      break ;
      case SingingCharacter.lightMode : 
      // save the light mode 
      themeChangeProvider.darkThemeSetter(false);
      Navigator.of(context).pop();
      print (_radioValue);
      break ;
      default :
      // save the light mode 
      throw Exception() ;
      break ;
    }
    
  }
}

/*  class RadioListTileForMode extends StatelessWidget {
    final listName ;
    final value;
    final groupValue;
    
    const RadioListTileForMode({
      this.listName,
      this.value,
      this.groupValue,
    });

  @override
  Widget build(BuildContext context) {
 return GestureDetector (
   onTap: () {
     
   },
      child : Container(
        child : Row(
          children :<Widget> [
              Radio(
                value: value,
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              Padding(
                padding : EdgeInsets.only(left : 4.0),
                child : Text (
                      listName,
                ),
              ),
          ],
        ),
      ),
    );
  }
  } */