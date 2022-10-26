import 'package:flutter/material.dart';
import 'package:life_expectancy/user_data.dart';

import 'hesap.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuç Sayfası'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
                child: Text(
              Hesap(_userData).hesaplama().ceil().toString(),
              style: TextStyle(
                  fontSize: 78,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            )),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Geri Dön!',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
