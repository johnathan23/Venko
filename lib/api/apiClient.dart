import 'package:retrofit/http.dart';
import 'package:venko/api/response/responseDto.dart';
import 'package:venko/dtos/personDto.dart';
import 'package:venko/res/dimens.dart';
import 'package:venko/utils/constants.dart';
import 'package:dio/dio.dart';

part 'apiClient.g.dart';


@RestApi(baseUrl: BASE_ADDRESS)
abstract class ApiClient {

  factory ApiClient(Dio dio){
    dio.options = BaseOptions(
      receiveTimeout: time_20, 
      connectTimeout: time_20
    );
    return _ApiClient(dio);
  }

  // --------- ENDPOINTS ---------

  // ------ Doctor ------

  @GET('$ITEM_URL/medico')
  Future<List<PersonDto>> getDoctors();

  @POST('$ITEM_URL/medico')
  Future<void> newDoctor(@Body() PersonDto personDto);

  @PUT('$ITEM_URL/medico')
  Future<ResponseDto> updateDoctor(@Body() PersonDto personDto);

  @DELETE('$ITEM_URL/medico/{documentNumber}')
  Future<ResponseDto> deleteDoctor(@Path('documentNumber') String documentNumber);

  @GET('$ITEM_URL/medico/{documentNumber}')
  Future<PersonDto> searchDoctor(@Path('documentNumber') String documentNumber);

  // ------ Patient ------

  @GET('$ITEM_URL/paciente')
  Future<List<PersonDto>> getPatients();

}