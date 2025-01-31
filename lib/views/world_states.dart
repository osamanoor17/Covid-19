// ignore_for_file: annotate_overrides, must_be_immutable

import 'package:covid19/models/WorldStatesModel.dart';
import 'package:covid19/services/utilities/states_services.dart';
import 'package:covid19/views/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorsList = <Color>[Colors.blue, Colors.green, Colors.red];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Covid Tracker",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.white70,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              FutureBuilder(
                  future: statesServices.fetchWorldStatesRecord(),
                  builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                          flex: 1,
                          child: SpinKitFadingCircle(
                            controller: _controller,
                            color: Colors.white,
                            size: 50,
                          ));
                    } else {
                      return Column(
                        children: [
                          PieChart(
                            chartRadius:
                                MediaQuery.of(context).size.width / 3.5,
                            legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left),
                            dataMap: {
                              "Total cases":
                                  double.parse(snapshot.data!.cases.toString()),
                              "Recovered": double.parse(
                                  snapshot.data!.recovered.toString()),
                              "Deaths":
                                  double.parse(snapshot.data!.deaths.toString())
                            },
                            animationDuration:
                                const Duration(microseconds: 1200),
                            chartType: ChartType.ring,
                            colorList: colorsList,
                            chartValuesOptions: const ChartValuesOptions(
                                showChartValuesInPercentage: true),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: Card(
                              child: Column(
                                children: [
                                  ReusableRow(
                                    title: 'Total Cases',
                                    value: snapshot.data!.cases.toString(),
                                  ),
                                  ReusableRow(
                                      title: 'Total Deaths',
                                      value: snapshot.data!.deaths.toString()),
                                  ReusableRow(
                                    title: 'Total Recovered',
                                    value: snapshot.data!.recovered.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Active',
                                    value: snapshot.data!.active.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Critical',
                                    value: snapshot.data!.critical.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Today Deaths',
                                    value:
                                        snapshot.data!.todayDeaths.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Today Recovered',
                                    value: snapshot.data!.todayRecovered
                                        .toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Tests',
                                    value: snapshot.data!.tests.toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CountriesList()));
                            },
                            style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                    Colors.green),
                                minimumSize: WidgetStateProperty.all<Size>(
                                    const Size(250, 50)),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                )),
                            child: const Text(
                              'Track Countries',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({super.key, required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          if (title != "Tests") const Divider(),
        ],
      ),
    );
  }
}
