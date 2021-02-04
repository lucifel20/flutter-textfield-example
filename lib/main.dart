import 'package:flutter/material.dart';

void main() => runApp(TextFieldExample());

class TextFieldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    const String APP_TITLE = 'Flutter TextField Example';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      home: HomeRoute(),
    ); // MaterialApp()
  }
}

class HomeRoute extends StatefulWidget {
  @override
  _HomeRoute createState() => _HomeRoute();
}

class _HomeRoute extends State<HomeRoute> {
  //
  @override
  void initState() {
    super.initState();
    _text = '';
    _textEditingController = TextEditingController();
    _textEditingController.addListener(_textEditingListener);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  String _text;
  TextEditingController _textEditingController;

  void _textEditingListener() {
    setState(() => _text = _textEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.indigo,
                    width: 1.0,
                  ), // Border.all()
                ), // BoxDecoration()
                child: Text(
                  _text,
                  textAlign: TextAlign.center,
                ), // Text()
              ), // Container()
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    labelText: 'Text Field',
                    hintText: 'Please input any text :',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ), // BorderRadius.all()
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ), // BorderSide()
                    ), // OutlineInputBorder()
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ), // BorderRadius.all()
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ), // BorderSide()
                    ), // OutlineInputBorder()
                  ), // InputDecoration()
                ), // TextField()
              ), // Container()
            ], // List<Widget>[]
          ), // Column()
        ), // SingleChildScrollView()
      ), // SafeArea()
    ); // Scaffold()
  }
}
