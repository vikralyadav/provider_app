import 'package:app/providers/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnotherScreen extends StatelessWidget {
  const AnotherScreen({super.key});

  @override
  Widget build(BuildContext context) {


      var fav = context.watch<MovieProvider>().favlist;

    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite movies list "),
      ),
      body: ListView.builder(
        itemCount: fav.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Text("Movie ${fav[index]}"),
            trailing: ,
          );

      }),
    );
  }
}