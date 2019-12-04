import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartwallet/ui/widgets/common_scaffold.dart';
import 'package:smartwallet/ui/widgets/login_background.dart';
import 'package:smartwallet/utils/translations.dart';

import 'contact_widget.dart';

class ContactPage extends StatelessWidget {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  bodyData() => Stack(fit: StackFit.expand, children: <Widget>[
        LoginBackground(
          showIcon: false,
        ),
        ContactWidget(),
      ]);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      actionFirstIcon: null,
      appTitle:
          Translations.of(context).text("drawer_contact_us").toUpperCase(),
      showOrderItems: false,
      scaffoldKey: _scaffoldState,
      bodyData: bodyData(),
    );
  }
}
