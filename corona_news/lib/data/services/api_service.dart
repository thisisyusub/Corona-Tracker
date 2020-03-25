import 'package:http/http.dart' as http;

class ApiService {
  ApiService._internal() {
    client = http.Client();
  }

  http.Client client;

  static final ApiService _instance = ApiService._internal();

  factory ApiService() {
    return _instance;
  }
}
