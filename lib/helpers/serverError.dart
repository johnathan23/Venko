import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/material.dart';
import 'package:venko/helpers/ui.dart';
import 'package:venko/utils/constants.dart';

class ServerError implements Exception {
  int _errorCode;
  String _errorMessage = "";
  BuildContext _context;

  ServerError({BuildContext context, DioError error}) {
    _context = context;
    _handleError(error);
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        _errorMessage = "Petición cancelada";
        break;

      case DioErrorType.CONNECT_TIMEOUT:
        _errorMessage = "El tiempo de conexión expiro";
        break;

      case DioErrorType.DEFAULT:
        _errorMessage = "Verifica tu conexión a internet";
        break;

      case DioErrorType.RECEIVE_TIMEOUT:
        _errorMessage = "El tiempo de espera ha expirado";
        break;

      case DioErrorType.RESPONSE:
        _errorCode = error.response.statusCode;
        switch (error.response.statusCode) {
          case WITHOUT_AUTHORIZATION:
            _errorMessage = 'El usuario no tiene autorización';
            break;
          case INTERNAL_ERROR_SERVER:
            _errorMessage = 'Presentamos problemas en el servidor, por favor intentelo mas tarde';
            break;
          default:   
            _errorMessage = 'Código de respuesta recibido: $_errorCode\n${error.response.data['message']}';
        }
        break;

      case DioErrorType.SEND_TIMEOUT:
        _errorMessage = "El tiempo de espera al recibir la respuesta del servidor ha expirado";
        break;
    }
    
    showInfoDialog(
      context: _context, 
      title: 'Información', 
      message: _errorMessage
    );
  }
}
