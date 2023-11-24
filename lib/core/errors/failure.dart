import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection timeout with ApiServier');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServier');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServier');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to ApiServer was canceld");
      case DioExceptionType.connectionError:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure("Unexpected Error, Please try later");
        }
      //("SocketException')
      default:
        return ServerFailure('Opps There are an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found, please try later!");
    } else if (statusCode == 500) {
      return ServerFailure('internal servier error, Please try later');
    }
    return ServerFailure('Opps There are an Error, Please try again');
  }
}
