abstract class HomeState {}

class HomeInitialState extends HomeState {}

class IsCountriesLoading extends HomeState {}

class CountriesList extends HomeState {
  final List<dynamic> countries;
  CountriesList({required this.countries});
}

class ErrorLoadingCountries extends HomeState {
  final String errorMessage;
  ErrorLoadingCountries({required this.errorMessage});
}

class FilteredCountries extends HomeState {
  final List<dynamic> filteredCountries;
  FilteredCountries({required this.filteredCountries});
}

class SortedCountries extends HomeState {
  final List<dynamic> sortedCountries;
  SortedCountries({required this.sortedCountries});
}
