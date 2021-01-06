import 'package:flutter/material.dart';
import 'package:kishanapp/model/govtscheme.dart';
import 'package:kishanapp/widgets/scheme-card.dart';
import 'package:easy_localization/easy_localization.dart';

class SchemesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SchemesPageState();
  }
}

class _SchemesPageState extends State<SchemesPage> {
  final List<Schemes> schemes = SchemesList.getSchemes();
  Widget _buildNewsList() {
    return ListView.builder(
      itemCount: schemes.length,
      itemBuilder: (BuildContext context, int index) {
        return SchemesCard(scheme: schemes[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Goverment Schemes").tr(),
        backgroundColor: Colors.green,
      ),
      body: _buildNewsList(),
    );
  }
}
