import 'dart:convert';

import 'package:http/http.dart' as http;

String notaToJson(Nota data) => json.encode(data.toJson());
var dados;

class Nota {
  Nota({
    required this.notas,
  });

  List<double> notas;

  Map<String, dynamic> toJson() => {
        "notas": List<dynamic>.from(notas.map((x) => x)),
      };
}

Future<Status> calculaNotas(double n1, double n2, double n3) async {
  Nota nota = new Nota(notas: [n1, n2, n3]);
  var url = Uri.parse('http://localhost:8080/status');
  var response = await http.post(url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "*",
        "Access-Control-Allow-Headers": "*"
      },
      body: notaToJson(nota));
  Status status = statusFromJson(response.body);
  dados = status;
  return status;
}

Status statusFromJson(String str) => Status.fromJson(json.decode(str));

class Status {
  Status({
    required this.avg,
    required this.situation,
  });

  double avg;
  String situation;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        avg: json["avg"].toDouble(),
        situation: json["situation"],
      );
}
