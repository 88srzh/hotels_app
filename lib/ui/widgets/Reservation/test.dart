import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          textTheme: const TextTheme(
            labelLarge: TextStyle(color: Colors.white),
          )),
      home: const SubmitPage(),
    );
  }
}

class SubmitPage extends StatelessWidget {
  const SubmitPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Validation')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: TextSubmitForm(onSubmit: (value) => print(value)),
        ),
      ),
    );
  }
}

class TextSubmitForm extends StatefulWidget {
  const TextSubmitForm({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;

  @override
  State createState() => _TextSubmitFormState();
}

class _TextSubmitFormState extends State<TextSubmitForm> {
  // declare a GlobalKey
  final _formKey = GlobalKey<FormState>();
  bool _submitted = false;
  String _name = '';

  void _submit() {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(_name);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 80,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter your name',
              ),
              autovalidateMode: _submitted
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              // The validator receives the text that the user has entered.
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Can\'t be empty';
                }
                if (text.length < 4) {
                  return 'Too short';
                }
                return null;
              },
              onChanged: (text) => setState(() => _name = text),
            ),
          ),
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: _name.isNotEmpty ? _submit : null,
              child: Text(
                'Submit',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}