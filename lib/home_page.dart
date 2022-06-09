import 'dart:ui';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:zakat_frontend/session/session_cubit.dart';
import 'package:zakat_frontend/widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Zakat')),
      drawer: DrawerWidget(),
      body: ListView(
        children: [
          buildCard(
              'Help the poor people',
              'https://www.nrc.no/image/100838/coronavirus_refugees.jpg?width=1200&height=800'),
          buildCard1(
              'coronavirus refugees',
              'https://static.scientificamerican.com/sciam/cache/file/4F8C0EFA-12E3-411C-9EE155D1B3766E19_source.jpg'),
          buildCard2(
              'palestinian refugees camp',
              'https://www.evrensel.net/images/840/upload/dosya/127911.jpg')
        ],

          ),
    );
  }

  Widget buildCard(String title, String urlImage) => ExpandableNotifier(

      child: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          clipBehavior: Clip.antiAlias,

          child: Column(
            children: [
              Image.network(urlImage),
              ScrollOnExpand(
                  child: ExpandablePanel(
                    theme: ExpandableThemeData(
                        tapBodyToCollapse: true,
                        tapBodyToExpand: true,
                        iconColor: Colors.red),
                    header: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    collapsed: const Text(
                      "edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros",
                      softWrap: true,
                      maxLines: 3,
                      style: TextStyle(fontSize: 18),
                    ),
                    expanded: const Text(
                      "edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros,edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus erosedac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros,edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus erosedac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros,edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus erosedac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros",
                      style: TextStyle(fontSize: 18),
                    ),
                    builder: (_, collapsed, expanded) => Padding(
                      padding:
                      const EdgeInsets.all(10.0).copyWith(top: 0, bottom: 0),
                      child: Expandable(collapsed: collapsed, expanded: expanded),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // alignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Raised: 8000৳',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text('Goal: 10000৳',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16))
                  ],
                ),
              )
            ],
          ),
        ),

      )
  );
  Widget buildCard1(String title, String urlImage) => ExpandableNotifier(

      child: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          clipBehavior: Clip.antiAlias,

          child: Column(
            children: [
              Image.network(urlImage),
              ScrollOnExpand(
                  child: ExpandablePanel(
                    theme: ExpandableThemeData(
                        tapBodyToCollapse: true,
                        tapBodyToExpand: true,
                        iconColor: Colors.red),
                    header: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    collapsed: Text(
                      "edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros",
                      softWrap: true,
                      maxLines: 3,
                      style: TextStyle(fontSize: 18),
                    ),
                    expanded: Text(
                      "edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros,edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus erosedac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros,edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus erosedac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros,edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus erosedac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros",
                      style: TextStyle(fontSize: 18),
                    ),
                    builder: (_, collapsed, expanded) => Padding(
                      padding:
                      const EdgeInsets.all(10.0).copyWith(top: 0, bottom: 0),
                      child: Expandable(collapsed: collapsed, expanded: expanded),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Raised: 8000৳',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text('Goal: 10000৳',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16))
                  ],
                ),
              )
            ],
          ),
        ),

      )
  );
  Widget buildCard2(String title, String urlImage) => ExpandableNotifier(

      child: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          clipBehavior: Clip.antiAlias,

          child: Column(
            children: [
              Image.network(urlImage),
              ScrollOnExpand(
                  child: ExpandablePanel(
                    theme: ExpandableThemeData(
                        tapBodyToCollapse: true,
                        tapBodyToExpand: true,
                        iconColor: Colors.red),
                    header: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    collapsed: Text(
                      "edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros",
                      softWrap: true,
                      maxLines: 3,
                      style: TextStyle(fontSize: 18),
                    ),
                    expanded: Text(
                      "edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros,edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus erosedac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros,edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus erosedac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros,edac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus erosedac odio aliquet, fringilla odio eget, tincidunt nunc. Duis aliquet pulvinar ante tempor etiam lacus eros",
                      style: TextStyle(fontSize: 18),
                    ),
                    builder: (_, collapsed, expanded) => Padding(
                      padding:
                      const EdgeInsets.all(10.0).copyWith(top: 0, bottom: 0),
                      child: Expandable(collapsed: collapsed, expanded: expanded),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Raised: 8000৳',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text('Goal: 10000৳',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16))
                  ],
                ),
              )
            ],
          ),
        ),

      )
  );
}
