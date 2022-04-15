import 'package:api_integration/apis.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? input;
  String displayText = 'Enter a number and press the button';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              onChanged: (value) {
                final inputNum = int.parse(value);
                input = inputNum;
              },
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            ElevatedButton(
              onPressed: () async {
                final _result = await getNumber(number: input);
                print(_result.text);
                setState(() {
                  displayText = _result.text ?? 'No text found :(';
                });
              },
              child: const Text(
                'Get Result',
              ),
            ),
            Text(displayText)
          ],
        ),
      ),
    );
  }
}
