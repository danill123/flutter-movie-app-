import 'package:flutter/material.dart';
import 'package:flutter_dude/model/api.dart';
import 'package:flutter_dude/pages/MovieApp.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (BuildContext context) => Api())
  ], child: movieApp()));
}

/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider 로 Material App 을 감싸서 BLoC 제공
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => Counter(),
          ),
          ChangeNotifierProvider(create: (BuildContext context) => Tester()),
          Provider(create: (BuildContext context) => Api())
        ],
        child: Consumer<Counter>(builder: (context, counter, _) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: MyHomePage(),
          );
        }));
  }
}

// Provider 를 사용하면 StatelessWidget 이어도 괜찮다.
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider 에서 counter 를 획득
    final counter = Provider.of<Counter>(context);
    final tester = Provider.of<Tester>(context);
    final api = Provider.of<Api>(context);

    // hello() async {
    //   await tester.testing;
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter app with Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${tester.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: tester.testing,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/

/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
*/
