import 'package:blog_explorer/Blog_repo.dart';
import 'package:blog_explorer/DetailsScreen.dart';
import 'package:blog_explorer/bloc/bloc_bloc.dart';
import 'package:blog_explorer/main.dart';
import 'package:blog_explorer/models/blogModelFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget
{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  var a = Colors.grey[900];
  void initState() {
    BlocProvider.of<BlocBloc>(context).add(TrendingBlogeEvent());
    super.initState();
  }
  late MyBlogModel blogobj;

  var list = [
    'ALL',
    'MERCHANT',
    'BUSINESS',
    'TUTORIAL'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: a,
      appBar:AppBar(backgroundColor: a,
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
                      // color: Colors.black,
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
  child: BlocBuilder<BlocBloc , BlocState>(
    builder: (context, state) {
      if(state is BlogeLoadingState){
        return Center(child: CircularProgressIndicator());
      }
      else if(state is BlogeLoadedState){
        blogobj = state.Modelobj;
        return 
        ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Detail(blogobj.blogs![index].imageUrl! , blogobj.blogs![index].title! , blogobj.blogs![index].id!);
                      },
                    ));
                  },
                  child: Image.network(blogobj.blogs![index].imageUrl!)
                ),
                Container(color: Colors.grey[700],width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Title : - "+blogobj.blogs![index].title! , style: TextStyle(color: Colors.white),),
                  ),
                ),
                Container(color: Colors.grey[700],width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(" I ' D : - "+blogobj!.blogs![index].id! , style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            );
          },
        );
      }
      return Container();
    },
  ),
)

// Expanded(
//   child:FutureBuilder<MyBlogModel>(
//     future : blogobj,
//     builder: (context, snapshot) {

//       if(snapshot.hasData)
//       {
//         return ListView.builder(
//           itemCount: 50,
//           itemBuilder: (context, index) {
//             return
//             Column(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(
//                       builder: (context) {
//                         return Detail(snapshot.data!.blogs![index].imageUrl! , snapshot.data!.blogs![index].title! , snapshot.data!.blogs![index].id!);
//                       },
//                     ));
//                   },
//                   child: Image.network(snapshot.data!.blogs![index].imageUrl!)
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text("Title : - "+snapshot.data!.blogs![index].title! , style: TextStyle(color: Colors.white),),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 10),
//                   child: Text(" I ' D : - "+snapshot.data!.blogs![index].id! , style: TextStyle(color: Colors.white),),
//                 ),
//               ],
//             );
//           },
//         );
//       }

//       else if(snapshot.hasError)
//       {
//         return Center(child: Text('${snapshot.error}'),);
//       }

//       else
//       {
//         return Center(child: CircularProgressIndicator());
//       }
//     },
//   )
// )

        ],
      ),
    );
  }
}