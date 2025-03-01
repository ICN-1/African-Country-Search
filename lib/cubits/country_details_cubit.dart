import 'dart:convert';
import 'package:african_countries_search/repositories/retrieve_countries.dart';
import 'package:african_countries_search/states/country_details_state.dart';
import 'package:african_countries_search/utils/constants/app_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryDetailsCubit extends Cubit<CountryDetailsState> {
  CountryDetailsCubit() : super(CountryDetailsInitialState());

  Future<void> getDetails(CountryDetailsEvent event) async {
    emit(IsCountryDetailsLoading());
    RetrieveCountries retrieveCountries = RetrieveCountries();
    if (event is LoadCountryDetailsEvent) {
      try {
        final response = await retrieveCountries.getCountryDetails(
          event.countryName,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          var countryDetails = json.decode(response.body)[0];
          emit(
            LoadedCountryDetails(
              countrySlides: [
                countryDetails["flags"]["png"] ?? AppText.placeholderImage,
                countryDetails["coatOfArms"]["png"] ?? AppText.placeholderImage,
              ],
              countryName: event.countryName,
              countryPopulation: countryDetails["population"].toString(),
              countryRegion: countryDetails["region"] ?? "Unknown",
              countryCapital: countryDetails["capital"]?[0] ?? "Unknown",
              countryLanguage:
                  countryDetails["languages"]?.entries.first.value ?? "Unknown",
              countryIndependence: countryDetails["independent"] ?? false,
              countryArea: countryDetails["area"]?.toString() ?? "Unknown",
              countryCurrency:
                  countryDetails["currencies"]?.keys?.first ?? "Unknown",
              countryTimeZone:
                  countryDetails["timezones"]?.take(2).join(', ') ?? "Unknown",
              countryDiallingCode:
                  "${countryDetails["idd"]?["root"] ?? "Unknown"}${countryDetails["idd"]?["suffixes"]?[0] ?? ""}",
              countryDrivingSide: countryDetails["car"]?["side"] ?? "Unknown",
            ),
          );
        } else {
          emit(
            ErrorLoadingCountryDetails(
              "Failed to load country details. Try again later.",
            ),
          );
        }
      } catch (error) {
        emit(
          ErrorLoadingCountryDetails(
            "Failed to load country details. Try again later.",
          ),
        );
      }
    }
  }
}
