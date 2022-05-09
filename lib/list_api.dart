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
    return ListView.builder(
      itemCount: dataAPI.length,
      itemBuilder: (context, index) {
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
          child: Column(
            children: [
              Text("API name: " + apiName),
              Text("What her do: " + description),
              Text("How to make authentication: " + authform.toString()),
              Text("Have HTTPS support: " + hasHttps),
              Text("Have Cors? " + cors),
              RichText(
                text: TextSpan(children: [
                  const TextSpan(
                      text: "Link: ", style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: "Click here",
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          await launchUrl(link);
                        })
                ]),
              ),
              Text("Category: " + category),
            ],
          ),
        );
      },
    );
  }
}
