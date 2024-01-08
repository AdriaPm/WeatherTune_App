import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void openAPIWebsite(String url) async {
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

// ignore: must_be_immutable
class Hyperlink extends StatelessWidget {
  final String link;
  final TextStyle style;
  Hyperlink({super.key, required this.link, required this.style});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          openAPIWebsite(link);
        },
        child: Text(link, style: style));
  }
}
