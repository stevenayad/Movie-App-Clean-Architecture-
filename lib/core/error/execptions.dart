import 'package:movie_app/core/network/error_message_model.dart';

class ServerExecption implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerExecption({required this.errorMessageModel});
}
