import 'package:flutter/material.dart';
import 'package:testapp/features/dashboard/widgets/gridviewListwidget.dart';
import 'package:testapp/features/dashboard/widgets/horizontalListwidget.dart';
import 'package:testapp/features/dashboard/widgets/vericalListwidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: const [
          HorizontalList(),
          VerticalList(),
          GridViewListWidget()
        ],
      ),
    );
  }
}
