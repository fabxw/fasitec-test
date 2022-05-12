import 'package:flutter/material.dart';
import 'package:teste_fasitec/list_api.dart';
import 'api.dart';
// ignore_for_file: prefer_const_constructors

void main() async {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List entries;
  String? count;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text("APIs"),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        backgroundColor: Color.fromARGB(255, 255, 225, 136),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Carregando Dados",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  CircularProgressIndicator()
                ],
              ));
            default:
              if (snapshot.hasError) {
                //debugPrint(snapshot.data?[0]);
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                entries = snapshot.data?["entries"];

                return ListAPI(dataAPI: entries);
              }
          }
        },
      ),
    );
  }
}
