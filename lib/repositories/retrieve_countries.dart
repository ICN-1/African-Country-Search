import 'package:african_countries_search/utils/constants/app_text.dart';
import 'package:http/http.dart' as http;

class RetrieveCountries {
  Future<http.Response> getAllCountries() async {
    final url = Uri.parse(
      '${AppText.baseUrl}region/africa?status=true&fields=name,languages,capital,flags',
    );
    try {
      final response = await http.get(url);
      return response;
    } catch (error) {
      throw Exception(
        "Error getting all countries: $error",
      );
    }
  }

  Future<http.Response> getCountryDetails(String countryName) async {
    final url = Uri.parse(
      '${AppText.baseUrl}name/$countryName',
    );
    try {
      final response = await http.get(url);
      return response;
    } catch (error) {
      throw Exception(
        "Error getting countries details: $error",
      );
    }
  }
}
