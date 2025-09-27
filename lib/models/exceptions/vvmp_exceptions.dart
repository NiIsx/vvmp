
import 'package:vvmp/models/exceptions/statics/vvmp_exception_types.dart';

class VvmpException implements Exception{
  final String message;
  final VvmpException? exception;
  final VvmpExceptionTypes type;

  VvmpException.private(this.message, Object? error) 
  : type = VvmpExceptionTypes.private,
    exception = error is VvmpException ? error : (error == null ? null : VvmpException.private(error.toString(), null));

  VvmpException.public(this.message, Object? error) 
  : type = VvmpExceptionTypes.public,
    exception = error is VvmpException ? error : (error == null ? null : VvmpException.public(error.toString(), null));


  static String extractAllMessages(VvmpException? exception)        
  {
    String result;

    if(exception == null){
      return '';
    }
    else{
        result = "${exception.message} ";
    }

    if (exception.exception != null){
      result = "$result${extractAllMessages(exception.exception)}";
    }
    return result;
  }

  static String extractPublicMessages(VvmpException? exception)        
  {
    String result;

    if(exception == null){
      return '';
    }

    if (exception.type == VvmpExceptionTypes.public){
        result = "${exception.message} ";
    }
    else{
        result = '';
    }

    if (exception.exception != null){
      result = "$result${extractPublicMessages(exception.exception)}";
    }
    return result;
  }
}