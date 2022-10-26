import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/result_page.dart';
import 'package:life_expectancy/user_data.dart';

import 'icon_cinsiyet.dart';
import 'my_widget.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 0.0;
  double sporGunu = 0.0;
  int boy = 170;
  int kilo = 70;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'YAŞAM BEKLENTİSİ',
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: MyWidget(
                      child: buildRowOutlineButton('BOY', boy),
                    ),
                  ),
                  Expanded(
                    child: MyWidget(
                      child: buildRowOutlineButton('KİLO', kilo),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: MyWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Haftada Kaç Kere spor yapıyorsunuz?',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    sporGunu.round().toString(),
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    value: sporGunu,
                    onChanged: (double newValue) {
                      setState(() {
                        sporGunu = newValue;
                      });
                    },
                    divisions: 7,
                    min: 0,
                    max: 7,
                  )
                ],
              ),
            )),
            Expanded(
              child: MyWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Günde Kaç Sigara İçiyorsunuz?',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      icilenSigara.round().toString(),
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Slider(
                      value: icilenSigara,
                      onChanged: (double newValue) {
                        setState(() {
                          icilenSigara = newValue;
                        });
                      },
                      min: 0,
                      max: 30,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyWidget(
                      renk: seciliCinsiyet == 'KADIN'
                          ? Colors.lightBlue[100]
                          : Colors.white,
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = 'KADIN';
                        });
                      },
                      child: IconCinsiyet(
                          cinsiyet: 'KADIN', icon: FontAwesomeIcons.venus),
                    ),
                  ),
                  Expanded(
                    child: MyWidget(
                      renk: seciliCinsiyet == 'ERKEK'
                          ? Colors.lightBlue[100]
                          : Colors.white,
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = 'ERKEK';
                        });
                      },
                      child: IconCinsiyet(
                        cinsiyet: 'ERKEK',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ButtonTheme(
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(UserData(
                              kilo: kilo,
                              boy: boy,
                              seciliCinsiyet: seciliCinsiyet,
                              icilenSigara: icilenSigara,
                              sporGunu: sporGunu))));
                },
                child: Text(
                  'HESAPLA',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildRowOutlineButton(String header, int number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            header,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            header == 'BOY' ? boy.toString() : kilo.toString(),
            style: kMetinStili,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shadowColor: Colors.black54,
                  elevation: 5,
                  side: BorderSide(
                    color: Colors.black54,
                    width: .5,
                  )),
              onPressed: () {
                setState(() {
                  header == 'BOY' ? boy++ : kilo++;
                });
              },
              child: Icon(FontAwesomeIcons.plus),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shadowColor: Colors.black54,
                  elevation: 5,
                  side: BorderSide(
                    color: Colors.black54,
                    width: .5,
                  )),
              onPressed: () {
                setState(() {
                  header == 'BOY' ? boy-- : kilo--;
                });
              },
              child: Icon(FontAwesomeIcons.minus),
            ),
          ],
        )
      ],
    );
  }
}
