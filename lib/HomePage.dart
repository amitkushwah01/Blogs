import 'package:blog_explorer/DetailsScreen.dart';
import 'package:blog_explorer/main.dart';
import 'package:blog_explorer/models/blogModelFile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget
{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    blogobj = fetchBlogs();
    super.initState();
  }
  late Future<MyBlogModel> blogobj;

  var list = [
    'ALL',
    'MERCHANT',
    'BUSINESS',
    'TUTORIAL'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar:AppBar(backgroundColor: Colors.blueGrey,
        title:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(' Bloge And Articles'),
            Container(height: 35,width: 35,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: const Icon(Icons.search)
            )
          ],
        )
        ),
      body:
      Column(
        children: [

//<<<<<<<<    Tabbar Start    >>>>>>>>>>>

          SizedBox(height: 35,
            child:
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
              return
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5)
                      )),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15 , right: 15 ,top: 5 , bottom: 2),
                      child: Text(list[index],style: TextStyle(color: Colors.white , fontSize: 15),),
                    ),
                  ),
                );
              },
            ),
          ),

Expanded(
  child:FutureBuilder<MyBlogModel>(
    future : blogobj,
    builder: (context, snapshot) {

      if(snapshot.hasData)
      {
        return ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Detail(snapshot.data!.blogs![index].imageUrl! , snapshot.data!.blogs![index].title! , snapshot.data!.blogs![index].id!);
                      },
                    ));
                  },
                  child: Image.network(snapshot.data!.blogs![index].imageUrl!)
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Title : - "+snapshot.data!.blogs![index].title! , style: TextStyle(color: Colors.white),),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(" I ' D : - "+snapshot.data!.blogs![index].id! , style: TextStyle(color: Colors.white),),
                ),
              ],
            );
          },
        );
      }

      else if(snapshot.hasError)
      {
        return Center(child: Text('${snapshot.error}'),);
      }

      else
      {
        return Center(child: CircularProgressIndicator());
      }
    },
  )
)

        ],
      ),
    );
  }
}