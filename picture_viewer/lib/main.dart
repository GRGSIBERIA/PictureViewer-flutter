import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class ImportPageWidget extends StatefulWidget {
  ImportPageWidget({Key? key}) : super(key: key);

  @override
  State<ImportPageWidget> createState() => _ImportPageState();
}

class _ImportPageState extends State<ImportPageWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Enter importing directory path'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter correct directory path';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                  onPressed: () {
                    // ディレクトリが入力され、かつボタンが押下されたとき
                    if (_formKey.currentState!.validate()) {
                      // ディレクトリを捜査して画像ファイルをDBに入力する
                    }
                  },
                  child: const Text('Submit')),
            )
          ],
        ));
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MaterialApp(
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(tabs: [
                  Tab(icon: Icon(Icons.add_a_photo)),
                  Tab(icon: Icon(Icons.image_search)),
                  Tab(icon: Icon(Icons.image)),
                  Tab(icon: Icon(Icons.local_bar))
                ]),
                title: const Text('Picture Viewer'),
              ),
              body: TabBarView(
                children: [
                  ImportPageWidget(),
                  Icon(Icons.image_search),
                  Icon(Icons.image),
                  Icon(Icons.local_bar)
                ],
              ),
            )));
  }
}
