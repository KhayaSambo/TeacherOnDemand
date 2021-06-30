
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class AricleScreen extends StatefulWidget {
  AricleScreen();

  @override
  AricleScreenState createState() => AricleScreenState();
}

class AricleScreenState extends State<AricleScreen> {
  AricleScreenState();

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
    );
   
  }
}
