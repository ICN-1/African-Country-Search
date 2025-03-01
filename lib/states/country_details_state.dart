abstract class CountryDetailsState {}

class CountryDetailsInitialState extends CountryDetailsState {}

class IsCountryDetailsLoading extends CountryDetailsState {}

class LoadedCountryDetails extends CountryDetailsState {
  final List<String> countrySlides;
  final String countryName;
  final String countryPopulation;
  final String countryRegion;
  final String countryCapital;
  final String countryLanguage;
  final bool countryIndependence;
  final String countryArea;
  final String countryCurrency;
  final String countryTimeZone;
  final String countryDiallingCode;
  final String countryDrivingSide;

  LoadedCountryDetails({
    required this.countrySlides,
    required this.countryName,
    required this.countryPopulation,
    required this.countryRegion,
    required this.countryCapital,
    required this.countryLanguage,
    required this.countryIndependence,
    required this.countryArea,
    required this.countryCurrency,
    required this.countryTimeZone,
    required this.countryDiallingCode,
    required this.countryDrivingSide,
  });
}

class ErrorLoadingCountryDetails extends CountryDetailsState {
  final String errorMessage;
  ErrorLoadingCountryDetails(this.errorMessage);
}

abstract class CountryDetailsEvent {}

class LoadCountryDetailsEvent extends CountryDetailsEvent {
  final String countryName;
  LoadCountryDetailsEvent({required this.countryName});
}
