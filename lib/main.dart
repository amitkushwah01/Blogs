import 'dart:convert';
import 'package:blog_explorer/API_helper.dart';
import 'package:blog_explorer/HomePage.dart';
import 'package:blog_explorer/bloc/bloc_bloc.dart';
import 'package:blog_explorer/models/blogModelFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as httpClient;
void main()
{
  runApp(BlocProvider<BlocBloc>(
    create: (context) => BlocBloc(),
    child: MyApp())
  );
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),home: HomePage(),
    );
  }
}

// Future<MyBlogModel> fetchBlogs() async{
//   var mUrl = 'https://intent-kit-16.hasura.app/api/rest/blogs';

//   var data = await ApiHelper().getAPI(mUrl , header:  {"x-hasura-admin-secret":"32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6"});
//   return MyBlogModel.fromJson(data);
// }





// First

// Future<MyBlogModel> fetchBlogs() async{
//   var mUrl = 'https://intent-kit-16.hasura.app/api/rest/blogs';

//   var response = await httpClient.get(Uri.parse(mUrl) , headers: {"x-hasura-admin-secret":"32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6"});

//   if(response.statusCode==200)
//   {
//     print('Ok');
//     var data = jsonDecode(response.body);
//     return MyBlogModel.fromJson(data);
//   }
//   else
//   {
//     print(response.statusCode);
//     return MyBlogModel();
//   }
// }