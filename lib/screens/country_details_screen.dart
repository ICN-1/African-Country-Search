import 'package:african_countries_search/cubits/country_details_cubit.dart';
import 'package:african_countries_search/states/country_details_state.dart';
import 'package:african_countries_search/utils/constants/app_text.dart';
import 'package:african_countries_search/widgets/country_details_tile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryDetailsScreen extends StatelessWidget {
  const CountryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          20.0,
          MediaQuery.of(context).padding.top + 20.0,
          20.0,
          40.0,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_rounded, size: 24.0),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: BlocBuilder<CountryDetailsCubit, CountryDetailsState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text(
                          state is LoadedCountryDetails
                              ? state.countryName
                              : "Country Name",
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.0),

            BlocBuilder<CountryDetailsCubit, CountryDetailsState>(
              builder: (context, state) {
                if (state is IsCountryDetailsLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (state is ErrorLoadingCountryDetails) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                if (state is LoadedCountryDetails) {
                  return Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: state.countrySlides.length,
                        itemBuilder: (context, index, _) {
                          return Container(
                            width: double.infinity,
                            height: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Image.network(
                              state.countrySlides[index] != ""
                                  ? state.countrySlides[index]
                                  : AppText.placeholderImage,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 1.0,
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CountryDetailsTile(
                          label: "Population:",
                          detail: state.countryPopulation,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CountryDetailsTile(
                          label: "Region:",
                          detail: state.countryRegion,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CountryDetailsTile(
                          label: "Capital:",
                          detail: state.countryCapital,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CountryDetailsTile(
                          label: "Official Language:",
                          detail: state.countryLanguage,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CountryDetailsTile(
                          label: "Independent:",
                          detail: state.countryIndependence ? "Yes" : "No",
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CountryDetailsTile(
                          label: "Area:",
                          detail: state.countryArea,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CountryDetailsTile(
                          label: "Currency:",
                          detail: state.countryCurrency,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CountryDetailsTile(
                          label: "Time zone(s):",
                          detail: state.countryTimeZone,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CountryDetailsTile(
                          label: "Dailing Code:",
                          detail: state.countryDiallingCode,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CountryDetailsTile(
                          label: "Driving side:",
                          detail: state.countryDrivingSide,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
