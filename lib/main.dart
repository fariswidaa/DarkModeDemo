import 'package:DarkModeDemo/theme.dart';
import 'package:DarkModeDemo/theme_changer.dart';
import 'package:flutter/material.dart';

import 'package:DarkModeDemo/settings.dart';
import 'package:provider/provider.dart';

// TODOs


// 4 = changes in the settings.dart file
// 5 = next
ThemeChanger themeChangeProvider = ThemeChanger();

void main() => runApp(
      ChangeNotifierProvider(
        builder: (context) => ThemeChanger(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void getCurrentAppTheme() async {
    print(await themeChangeProvider.themeModePreferences.getTheme());
    themeChangeProvider.darkThemeSetter(
        await themeChangeProvider.themeModePreferences.getTheme());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(
      builder: (context, counter, child) =>
       MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeModeDark.themeData(counter.darkTheme, context),
        home: Home(),
      ),
    );
  }

  void initState() {
    super.initState();
    getCurrentAppTheme();
    print('init state');
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
          ),
        ],
        title: Text('Dark Mode'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

/* 
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) {
        return themeChangeProvider;
      },
      child: Consumer<ThemeChanger>(
        // the first change is to use the themeChangeProvider variable
        // instead of value
        builder: (BuildContext context, themeChangeProvider, Widget child) {
          print('value from consumer is ${themeChangeProvider.darkTheme}');
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                ThemeModeDark.themeData(themeChangeProvider.darkTheme, context),
            home: Home(),
          );
        },
      ),
    ); */
