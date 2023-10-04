import 'dart:convert';
import 'dart:io';
import 'package:blog_explorer/api_exception.dart';
import 'package:http/http.dart' as httpClient;
class ApiHelper{

  Future<dynamic> getAPI(String url , { Map<String,String>? header } ) async{

    late var jsonResponse;
    try{
      var response = await httpClient.get(Uri.parse(url) , headers:header);
      // print(response);
      jsonResponse = checkResponsefun(response);
    }
    on SocketException{
      print('No Internet');
      throw FetchDataException('No Internet');
    }
    return jsonResponse;
  }
}



dynamic checkResponsefun(httpClient.Response response){
 
  switch(response.statusCode){
    case 200:
    var responseJson = json.decode(response.body.toString());
    // print(responseJson);
    return responseJson;
    case 400:
    throw BadReqException(response.body.toString());
    case 401:
    case 402:
    case 403:
    UnauthorisedException(response.body.toString());
    case 500:
    default:
    throw FetchDataException('New Error');
  }
}