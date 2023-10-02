import 'package:flutter/material.dart';

class Detail extends StatelessWidget
{
  var url;
  var title;
  var id;

  Detail(this.url , this.title , this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(title: Text('Detail Page')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text( "Title - " + title , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w500)),
          ),
          Center(child: Image.network(url)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Image Id - "+id),
          )
        ],
      ),
    );
  }
}