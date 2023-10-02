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
  late Future<BlogeModel> blogobj;

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

//<<<<<<<<    Tabbar Start  END  >>>>>>>>>>>

//<<<<<<<<    Continer Start    >>>>>>>>>>>

          // Expanded(
          //   child:
          //   ListView.builder(
          //     // itemCount: 10,
          //     itemBuilder: (context, index) {
          //     return
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Column(
          //           children: [
          //             Container(
          //               child: Center(child: Text('Wallpaper')),
          //               height: 250,
          //               color: Colors.yellow,
          //             ),
          //             Container(
          //               height: 100,
          //               width: MediaQuery.sizeOf(context).width,
          //               color: Colors.blueAccent,
          //                 child:Center(
          //                   child: Text('Content  ')
          //                 ),
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),

//<<<<<<<<    Conatiner Start  END  >>>>>>>>>>>

Expanded(
  child:FutureBuilder<BlogeModel>(
    future : blogobj,
    builder: (context, snapshot) {

      if(snapshot.hasData)
      {
        return ListView.builder(
          itemBuilder: (context, index) {
            return 
            // Text(snapshot.data!.blogs!.length);
            // Image.network(snapshot.data!.blogs!.)
            Container(child: Text(' Hello'),);
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