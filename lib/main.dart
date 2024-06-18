import 'package:app/providers/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
    create: (_) => MovieProvider(),
    child: MyApp()
    
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Provider(),
    );
  }
}
class Provider extends StatelessWidget {
  const Provider({super.key});

  @override
  Widget build(BuildContext context) {
     var fav = context.watch<MovieProvider>().favlist;
    print(fav);
    return Scaffold(
      appBar: AppBar(
        title: Text("choose movies list ${fav.length}"),
      ),
     body: ListView.builder(
      itemCount: 40,
      itemBuilder: (BuildContext context, int  index){
        return ListTile(
          title: Text("movie $index"),
          trailing: GestureDetector(
            onTap: () {
              if(!fav.contains(index)){
                context.read<MovieProvider>().addtoList(index);

              }else{
                context.read<MovieProvider>().removeFav(index);
              }

            },
            child: Icon(Icons.favorite, color: fav.contains(index)? Colors.red: Colors.grey)),
        );
      }),
    );
  }
}
