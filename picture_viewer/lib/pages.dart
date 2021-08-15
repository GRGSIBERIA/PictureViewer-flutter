import 'dart:html';
import 'package:flutter/material.dart';

class ImportPageWidget extends StatefulWidget {
  ImportPageWidget({Key? key}) : super(key: key);

  @override
  State<ImportPageWidget> createState() => _ImportPageState();
}

class _ImportPageState extends State<ImportPageWidget> {
  final _formKey = GlobalKey<FormState>();
  String? _targetDirectory = '';
  double _indicate = 0.0;

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
                onSaved: (String? value) {
                  _targetDirectory = value;
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                  onPressed: () async {
                    // ディレクトリが入力され、かつボタンが押下されたとき
                    if (_formKey.currentState!.validate()) {
                      // ディレクトリを捜査して画像ファイルをDBに入力する
                      _formKey.currentState!.save();
                    }
                  },
                  child: const Text('Import')),
            )
          ],
        ));
  }
}

class SearchPageWidget extends StatefulWidget {
  SearchPageWidget({Key? key}) : super(key: key);

  @override
  State<SearchPageWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPageWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
          expandedHeight: 150,
          flexibleSpace: const FlexibleSpaceBar(
              title: TextField(
                  decoration: InputDecoration(hintText: 'keywords ...')))),
      SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
              color: index.isOdd ? Colors.white : Colors.black12,
              height: 100.0,
              child: Center(
                child: Text('$index'),
              ));
        }),
      )
    ]);
  }
}
