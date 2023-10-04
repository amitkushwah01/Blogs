import 'package:blog_explorer/API_helper.dart';
import 'package:blog_explorer/models/blogModelFile.dart';

class BlogeRepo{
  Future<MyBlogModel> fetchBlogs() async{
  var mUrl = 'https://intent-kit-16.hasura.app/api/rest/blogs';

  var data = await ApiHelper().getAPI(mUrl , header:  {"x-hasura-admin-secret":"32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6"});
  return MyBlogModel.fromJson(data);
}
}