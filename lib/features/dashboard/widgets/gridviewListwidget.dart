import 'package:flutter/material.dart';

class GridViewListWidget extends StatelessWidget {
  const GridViewListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text("Vertical List with Image "),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 9,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset("assets/Flutter.png"),
                  ),
                );
              }),
        )
      ],
    );
  }
}
