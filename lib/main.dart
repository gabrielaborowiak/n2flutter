import 'package:flutter/material.dart';
import 'package:n2flutter/Nota.dart';

void main() {
  runApp(Nota());
}

class Nota extends StatelessWidget {
  const Nota({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: CalcNota(),
          ),
        ),
      ),
    );
  }
}

class CalcNota extends StatefulWidget {
  const CalcNota({Key? key}) : super(key: key);

  @override
  _CalcNotaState createState() => _CalcNotaState();
}

class _CalcNotaState extends State<CalcNota> {
  double n1 = 0;
  double n2 = 0;
  double n3 = 0;

  double avg = 0;
  String situation = "";

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Você foi $situation!!!"),
      content: Text("Sua média é $avg"),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Digite as notas",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          ' 1ª Nota',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (nota) {
                          n1 = double.parse(nota);
                        },
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          '2ª Nota',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (nota) {
                          n2 = double.parse(nota);
                        },
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          '3ª Nota',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (nota) {
                          n3 = double.parse(nota);
                        },
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                'Calcular',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
              onPressed: () async {
                Status status = await calculaNotas(n1, n2, n3);
                avg = status.avg;
                situation = status.situation;
                showAlertDialog(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
