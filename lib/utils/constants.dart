/// ------------ KEY ROUTES TO NAVIGATION ------------
const String HOME_ROUTE = "homePage";
/// ------------ DOCTOR ------------
const String DOCTOR_ROUTE = "doctorPage";
const String NEW_DOCTOR_ROUTE = "newDoctorPage";
const String DETAIL_DOCTOR_ROUTE = "detailDoctorPage";
/// ------------ PATIENT ------------
const String PATIENT_ROUTE = "patientPage";

/// ------------ URL BACKEND ------------
const String BASE_ADDRESS = 'http://certificacion.venko.co:8080';
const String ITEM_URL = '$BASE_ADDRESS/v1';

/// ------------ CODE RESPONSE ------------
const int SUCCESSFUL = 200;
const int SUCCESSFUL_CREATION = 201;
const int SUCCESSFUL_UPDATE = 211;
const int WITHOUT_AUTHORIZATION = 401;
const int INTERNAL_ERROR_SERVER = 500;
