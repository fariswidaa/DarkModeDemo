import 'package:flutter/material.dart';

import 'package:DarkModeDemo/theme_changer.dart';

//bool checkValue = true;

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ThemeChanger themeChangeProvider = new ThemeChanger();

  int _radioValue = -1;

  void initState() {
    //getCurrentAppTheme();
    super.initState();
    print('init state from settings.dart');
    //setCheckValueSetter();
  }

  void getCurrentAppTheme() async {
    print(await themeChangeProvider.themeModePreferences.getTheme());
    themeChangeProvider.darkThemeSetter(
        await themeChangeProvider.themeModePreferences.getTheme());
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
                  RadioListTile(
                    value: 0,
                    groupValue: _radioValue,
                    onChanged: (value) {
                      _handleRadioValueChange(value);
                    },
                    title: Text('Dark Mode'),
                  ),
                  RadioListTile(
                    value: 1,
                    groupValue: _radioValue,
                    onChanged: (value) {
                      _handleRadioValueChange(value);
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
                onPressed: () => checkRadioButtonToSavePref(),
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
    switch (_radioValue){
      case 0 :
      // save the dark mode 
      themeChangeProvider.darkThemeSetter(true);
      Navigator.of(context).pop();
      break ;
      case 1 : 
      // save the light mode 
      themeChangeProvider.darkThemeSetter(false);
      Navigator.of(context).pop();
      break ;
      default :
      // save the light mode 
      themeChangeProvider.darkThemeSetter(false);
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