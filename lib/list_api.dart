// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ListAPI extends StatelessWidget {
  List dataAPI;

  ListAPI({
    Key? key,
    required this.dataAPI,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: dataAPI.length,
            itemBuilder: (context, index) {
              double width = MediaQuery.of(context).size.width;

              var apiName = dataAPI[index]["API"];
              var description = dataAPI[index]["Description"];
              var authform = dataAPI[index]["Auth"] == ""
                  ? "Not required"
                  : dataAPI[index]["Auth"];

              var hasHttps = dataAPI[index]["HTTPS"] ? "Yes" : "No";

              var cors = dataAPI[index]["Cors"];
              var link = dataAPI[index]["Link"];

              var category = dataAPI[index]["Category"];

              return Card(
                margin: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 188, 206, 214),
                        Color.fromARGB(255, 172, 201, 214),
                      ])),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(height: 5),
                        Text(apiName,
                            style: const TextStyle(fontSize: 25, height: 1)),
                        Container(height: 5),
                        SizedBox(
                            width: width * 0.6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    " " + description,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.red[300], fontSize: 12),
                                  ),
                                ),
                              ],
                            )),
                        Container(height: 3),
                        Text(authform.toString() + " authentication"),
                        Container(height: 3),
                        Row(children: [
                          Text("HTTPS support: " + hasHttps),
                          const Text(" | "),
                          Text("Have Cors? " + cors),
                        ], mainAxisAlignment: MainAxisAlignment.center),
                        Container(height: 3),
                        Text("Category: " + category),
                        Container(height: 3),
                        RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                                text: "Link: ",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: "Click here",
                                style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    if (!await launchUrl(Uri.parse(link),
                                        mode: LaunchMode.externalApplication)) {
                                      throw 'Could not launch';
                                    }
                                  })
                          ]),
                        ),
                        Container(height: 5),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
