import 'package:get/get.dart';

class BaseHttp extends GetConnect {
    // @override
    // void onInit() {
    //   // baseUrl = 'https://api.covid19api.com'; // It define baseUrl to
    //   // Http and websockets if used with no [httpClient] instance
    //   httpClient.baseUrl = 'https://api.covid19api.com';
    //
    //   // ===== 登入驗證, 在addRequestModifier之前 =====
    //   //Autenticator will be called 3 times if HttpStatus is
    //   //HttpStatus.unauthorized
    //   httpClient.maxAuthRetries = 3;
    //   httpClient.addAuthenticator<Object?>((request) async {
    //     // final response = await get("http://yourapi/token");
    //     // final token = response.body['token'];
    //     // // Set the header
    //     // request.headers['Authorization'] = "$token";
    //     return request;
    //   });
    //
    //   // ===== request前 =====
    //   httpClient.addRequestModifier<Object?>((request) {
    //     // request.headers['apikey'] = '12345678';
    //     return request;
    //   });
    //
    //   // ===== response後 =====
    //   httpClient.addResponseModifier<Object?>((request, response) {
    //     // CasesModel model = response.body;
    //     // if (model.countries.contains('Brazil')) {
    //     //   model.countries.remove('Brazilll');
    //     // }
    //   });
    //
    //   // 拿到的data可以預處理, ex. array to jsons
    //   // httpClient.defaultDecoder = CasesModel.fromJson;
    // }

    Future<String?> getGoogle() async {
      Response<String> res = await get("https://www.google.com");
      return res.body;
    }
}