import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _ChangeTextPage();
}

class _ChangeTextPage extends State<MyHomePage> {
  final List<String> _buttonTexts = const [
    'Привет, Flutter!',
    'Красивая картинка',
    'What a wonderful world!',
  ];

  int _currentIndex = 0;

  void _changeText() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _buttonTexts.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Sholpan'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
            icon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.network(
                'https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=1024x1024&w=0&k=20&c=z8_rWaI8x4zApNEEG9DnWlGXyDIXe-OmsAyQ5fGPVV8=',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: _buttonTexts[_currentIndex],
                  hintStyle: TextStyle(color: Colors.black),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
              ),
              ElevatedButton(
                onPressed: _changeText,
                child: Text('Изменить текст'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: const Center(child: Text('This second page')),
    );
  }
}
