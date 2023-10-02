import 'dart:convert';
import 'package:blog_explorer/HomePage.dart';
import 'package:blog_explorer/models/blogModelFile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main()
{
  runApp(MyApp());
}
class MyApp extends StatefulWidget
{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
Future<BlogeModel> fetchBlogs() async {
  var mUrl = "https://api.pexels.com/v1/search?query=nature&per_page=1";
  var response = await http.get(Uri.parse(mUrl), headers: {
    "Authorization": "GYJm0cNufW4Kyb11oaox1HyiCUdi9Gf3SDC4tFAsXBa65gVqS6RFvqp6"
  });

  if (response.statusCode == 200) {
    // Request successful, handle the response data here
    print('Response data: ${response.body}');
    var data = jsonDecode(response.body);
    return BlogeModel.fromJson(data);
  } else {
    // Request failed
    print('Request failed with status code: ${response.statusCode}');
    print('Response data: ${response.body}');
    return BlogeModel();
  }
}
