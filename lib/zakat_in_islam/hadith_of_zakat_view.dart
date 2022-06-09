import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakat_frontend/data/model/zakat_in_islam.dart';
import 'package:zakat_frontend/zakat_in_islam/bloc/zakat_in_islam_bloc.dart';

import '../data/model/zakat_in_islam.dart';

class HadithOfZakatView extends StatefulWidget {
  HadithOfZakatView({Key? key}) : super(key: key);

  @override
  State<HadithOfZakatView> createState() => _HadithOfZakatViewState();
}

class _HadithOfZakatViewState extends State<HadithOfZakatView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ZakatInIslamBloc()..add(ZakatInIslamLoadingEvent()),
      child: Scaffold(
          appBar: AppBar(title: Text('Significant of Zakat in Hadith')),
          body: BlocBuilder<ZakatInIslamBloc, ZakatInIslamState>(
              builder: ((context, state) {
                if (state is ZakatInIslamLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ZakatInIslamLoadedState) {
                  return ListView.builder(
                      itemCount: state.zakatInIslam.length,
                      itemBuilder: (context, index) {
                        return _buildHaditCard(state.zakatInIslam[index]);
                      });
                } else if (state is ZakatInIslamFailedToLoadState) {
                  return Center(
                    child: Text(state.error.toString()),
                  );
                } else {
                  return Center(
                    child: Text("Something is wrong!"),
                  );
                }
              }))),
    );
  }

  Widget _buildHaditCard(ZakatInIslam hadith) {
    return (Card(
      margin: EdgeInsets.all(15).copyWith(bottom: 0),
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: (
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("হাদিস নংঃ ${hadith.hadithNo}", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    ElevatedButton(onPressed: () {}, child: Text(hadith.grade ?? '')),
                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))
                  ],
                ),
                Text(hadith.narrationInBengali ??'')
              ],
            ),
          )),
    ));
  }
}