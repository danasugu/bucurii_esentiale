import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class VisitSite extends StatefulWidget {
  @override
  _VisitSiteState createState() => _VisitSiteState();
}

class _VisitSiteState extends State<VisitSite> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://bucuriiesentiale.ro/despre/povestea-bucuriilor-esentiale/',
    );
  }
}
