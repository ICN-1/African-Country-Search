import 'dart:convert';
import 'package:african_countries_search/cubits/country_details_cubit.dart';
import 'package:african_countries_search/repositories/retrieve_countries.dart';
import 'package:african_countries_search/routes/app_routes.dart';
import 'package:african_countries_search/states/country_details_state.dart';
import 'package:african_countries_search/states/home_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  TextEditingController searchController = TextEditingController();
  List<dynamic> allCountries = [];
  Future<void> getAllCountries() async {
    emit(IsCountriesLoading());
    RetrieveCountries retrieveCountries = RetrieveCountries();

    try {
      final response = await retrieveCountries.getAllCountries();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> countriesList = json.decode(response.body);
        allCountries = countriesList;
        emit(CountriesList(countries: countriesList));
      } else {
        emit(
          ErrorLoadingCountries(
            errorMessage:
                "Failed to get all countries. Please restart this application.",
          ),
        );
      }
    } catch (error) {
      emit(
        ErrorLoadingCountries(
          errorMessage:
              "Failed to get all countries. Please restart this application.",
        ),
      );
    }
  }

  void filterCountriesList(String search) {
    final filteredList =
        allCountries.where((country) {
          return country['name']['official'].toLowerCase().contains(
            search.toLowerCase(),
          );
        }).toList();
    emit(FilteredCountries(filteredCountries: filteredList));
  }

  void sortCountries(List<dynamic> countryList) {
    final groupedMap = <String, List<dynamic>>{};

    for (var country in countryList) {
      final firstLetter = country["name"]["official"][0].toUpperCase();
      if (!groupedMap.containsKey(firstLetter)) {
        groupedMap[firstLetter] = [];
      }

      groupedMap[firstLetter]?.add(country);
    }

    groupedMap.forEach((key, value) {
      value.sort(
        (a, b) => a["name"]["official"].compareTo(b["name"]["official"]),
      );
    });

    var sortedGroupedList =
        groupedMap.entries.toList()..sort((a, b) => a.key.compareTo(b.key));
    emit(SortedCountries(sortedCountries: [sortedGroupedList]));
  }

  void goToDetailsScreen(BuildContext context, name) {
    Navigator.pushNamed(context, AppRoutes.viewDetailsScreen);
    final countryDetailsCubit = context.read<CountryDetailsCubit>();
    countryDetailsCubit.getDetails(LoadCountryDetailsEvent(countryName: name));
  }
}
