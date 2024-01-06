import 'package:flutter/material.dart';
import 'package:untitled3/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFirstPage(),
    );
  }
}

class MyFirstPage extends StatefulWidget {
  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  TextEditingController _textController = TextEditingController();
  Color _pageColor = Colors.white;
  Color _buttonColor = Colors.grey;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
                color: _pageColor,
              ),
              child: TextField(
                controller: _textController,
                onChanged: (text) {
                  setState(() {
                    _pageColor = text.length == 4 ? Colors.grey : Colors.white;
                    _buttonColor = text.length == 4 ? Colors.white : Colors.grey;
                    _errorMessage = ''; // Clear error message
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Kullanıcı Adınız',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_textController.text.length < 4) {
                  setState(() {
                    _errorMessage = 'Eksik veya yanlış tuşladınız!';
                  });
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: _buttonColor,
                onPrimary: Colors.black,
              ),
              child: Text('Giriş Yap'),
            ),
            SizedBox(height: 10),
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      backgroundColor: _pageColor,
    );
  }
}
