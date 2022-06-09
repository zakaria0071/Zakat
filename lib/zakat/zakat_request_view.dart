import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakat_frontend/data/model/zakat_request.dart';
import 'package:zakat_frontend/zakat/bloc/zakat_request_bloc.dart';

import '../data/model/zakat_request.dart';

class ZakatRequestView extends StatelessWidget {
  const ZakatRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imgUrl =
        "https://preview.colorlib.com/theme/lovecare/images/cause-2.jpg.webp";
    return Scaffold(
        body: BlocProvider(
      create: (context) => ZakatRequestBloc()..add(LoadZakatRequestEvent()),
      child: Scaffold(
          appBar: AppBar(title: Text("All Request")),
          body: Center(
            child: BlocBuilder<ZakatRequestBloc, ZakatRequestState>(
                builder: ((context, state) {
              if (state is LoadingZakatRequestState) {
                return CircularProgressIndicator();
              } else if (state is LoadedZakatRequestState) {
                return RefreshIndicator(
                    child: ListView.builder(
                        itemCount: state.zakatRequests.length,
                        itemBuilder: (context, index) {
                          return buildCard(state.zakatRequests[index]);
                        }),
                    onRefresh: () async =>
                        BlocProvider.of<ZakatRequestBloc>(context)
                            .add(PullToRefreshZakatRequestEvent()));
              } else if (state is FailedToLoadZakatRequestState) {
                return Text(state.error.toString());
              } else {
                return Text("Undefine state");
              }
            })),
          )),
    ));
  }

  Widget buildCard(ZakatRequest request) => ExpandableNotifier(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Image.network(request.imageUrl),
              ScrollOnExpand(
                  child: ExpandablePanel(
                theme: ExpandableThemeData(
                    tapBodyToCollapse: true,
                    tapBodyToExpand: true,
                    iconColor: Colors.red),
                header: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    request.requestTitle,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                collapsed: Text(
                  request.requestDescription,
                  softWrap: true,
                  maxLines: 3,
                  style: TextStyle(fontSize: 18),
                ),
                expanded: Text(
                  request.requestDescription,
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
                      'Raised: ${request.donationList.fold(0, (sum, donation) => donation.donationAmount)}',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text('Goal: ${request.requestAmount}',
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
      ));
}
