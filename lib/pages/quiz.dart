import 'dart:math';

import 'package:flags/models/country.dart';
import 'package:flags/widgets/flagimage.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _score;
  int _result;

  List<Country> _countries = [
    Country('ar', 'Argentina'),
    Country('br', 'Brazil'),
    Country('ca', 'Canada'),
    Country('es', 'Spain'),
    Country('mx', 'Mexico'),
    Country('pt', 'Portugal'),
    Country('tr', 'Turkey'),
    Country('gr', 'Greece'),
    Country('eg', 'Egypt'),
    Country('au', 'Australia'),
    Country('ci', 'Côte d\'Ivoire'),
    Country('cm', 'Cameroon'),
    Country('cy', 'Cyprus'),
    Country('gh', 'Ghana'),
    Country('jm', 'Jamaica'),
    Country('jp', 'Japan'),
    Country('kz', 'Kazachstan'),
    Country('mt', 'Malta'),
    Country('sy', 'Syria'),
    Country('ch', 'Switzerland')
  ];

  List shuffle(List items) {
    var random = new Random();

    // Go through all elements.
    for (var i = items.length - 1; i > 0; i--) {
      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);
      // Shuffle
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }
    setState(() {
      this._result = random.nextInt(3);
    });
    return items;
  }

  void _validateAnswer(flag) {
    if (_countries[this._result].flag == flag) {
      setState(() {
        this._score++;
      });
      shuffle(this._countries);
    }
  }

  @override
  void initState() {
    super.initState();
    shuffle(this._countries);
    this._score = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _formPadding = 50.0;
    return Scaffold(
        appBar: AppBar(title: Text("Flags")),
        body: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        bottom: _formPadding, top: _formPadding),
                    child: Text(
                      "Pick the right flag!",
                      style: TextStyle(fontSize: 30),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: _formPadding, top: _formPadding),
                    child: Text(
                      _countries[_result].name,
                      style: TextStyle(fontSize: 50),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: _formPadding, top: _formPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlagImageWidget(
                          flag: _countries[0].flag,
                          onFlagSelected: (flag) {
                            _validateAnswer(flag);
                          },
                        ),
                        FlagImageWidget(
                          flag: _countries[1].flag,
                          onFlagSelected: (flag) {
                            _validateAnswer(flag);
                          },
                        ),
                        FlagImageWidget(
                          flag: _countries[2].flag,
                          onFlagSelected: (flag) {
                            _validateAnswer(flag);
                          },
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: _formPadding, top: _formPadding),
                    child: Text(
                      "Score : " + _score.toString(),
                      style: TextStyle(fontSize: 30),
                    )),
              ],
            )));
  }
}
