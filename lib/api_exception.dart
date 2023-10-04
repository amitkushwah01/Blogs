class MyException implements Exception
{
  String? heading;
  String? msg;

  MyException({this.heading , this.msg});

  String toString()
  {
    return '$heading:$msg';
  }

}
class FetchDataException extends MyException{
  FetchDataException(String msg) :super(heading: 'FetchDataExceptionMSG',msg: msg);
}

class BadReqException extends MyException{
  BadReqException(String msg) :super(heading: 'BadReqExceptionMSG',msg: msg);
}

class UnauthorisedException extends MyException{
  UnauthorisedException(String msg) :super(heading: 'UnauthorisedExceptionMSG',msg: msg);
}

class InvalidInpurException extends MyException{
  InvalidInpurException(String msg) :super(heading: 'InvalidInpurExceptionMSG',msg: msg);
}