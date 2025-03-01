import 'package:african_countries_search/cubits/home_cubit.dart';
import 'package:african_countries_search/cubits/theme_cubit.dart';
import 'package:african_countries_search/states/home_state.dart';
import 'package:african_countries_search/states/theme_state.dart';
import 'package:african_countries_search/widgets/country_tile.dart';
import 'package:african_countries_search/widgets/search_field.dart';
import 'package:african_countries_search/utils/constants/app_colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          20.0,
          MediaQuery.of(context).padding.top + 20.0,
          20.0,
          20.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "African Countries",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
                ),

                BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () => context.read<ThemeCubit>().toggleTheme(),
                      child: Icon(
                        state is CurrentThemeState
                            ? state.currentTheme == ThemeMode.light
                                ? Icons.sunny
                                : Icons.mode_night_rounded
                            : ThemeMode.system == ThemeMode.light
                            ? Icons.sunny
                            : Icons.mode_night_rounded,
                      ),
                    );
                  },
                ),
              ],
            ),

            SizedBox(height: 20.0),

            SearchField(
              controller: context.read<HomeCubit>().searchController,
              icon: Icons.search_rounded,
              iconSize: 32.0,
              hint: "Search Country",
              onSearch: (search) {
                context.read<HomeCubit>().filterCountriesList(search);
              },
            ),

            SizedBox(height: 20.0),

            BlocBuilder<HomeCubit, HomeState>(
              builder: (contextA, state) {
                if (state is IsCountriesLoading) {
                  return CircularProgressIndicator();
                } else if (state is ErrorLoadingCountries) {
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
                } else if (state is FilteredCountries ||
                    state is CountriesList) {
                  final countries =
                      state is FilteredCountries
                          ? state.filteredCountries
                          : (state as CountriesList).countries;

                  countries.sort((a, b) {
                    return a["name"]["official"].compareTo(
                      b["name"]["official"],
                    );
                  });

                  final groupedCountries =
                      <String, List<Map<String, dynamic>>>{};
                  for (var country in countries) {
                    String firstLetter =
                        country["name"]["official"][0].toUpperCase();
                    if (!groupedCountries.containsKey(firstLetter)) {
                      groupedCountries[firstLetter] = [];
                    }
                    groupedCountries[firstLetter]!.add(country);
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: groupedCountries.keys.length,
                      itemBuilder: (contextB, sectionIndex) {
                        final sectionLetter = groupedCountries.keys.elementAt(
                          sectionIndex,
                        );
                        final sectionCountries =
                            groupedCountries[sectionLetter]!;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                sectionLetter,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppColours.grey4,
                                ),
                              ),
                            ),
                            Column(
                              children:
                                  sectionCountries.map<Widget>((country) {
                                    return Column(
                                      children: [
                                        CountryTile(
                                          onSelect:
                                              () => contextB
                                                  .read<HomeCubit>()
                                                  .goToDetailsScreen(
                                                    context,
                                                    country["name"] != null
                                                        ? country["name"]["official"]
                                                        : "Country name",
                                                  ),
                                          image:
                                              country["flags"] != null
                                                  ? country["flags"]["png"]
                                                  : "",
                                          countryName:
                                              country["name"] != null
                                                  ? country["name"]["official"]
                                                  : "Country name",
                                          countryCapital:
                                              country["capital"] != null
                                                  ? country["capital"][0]
                                                  : "Country capital",
                                        ),
                                        SizedBox(height: 20.0),
                                      ],
                                    );
                                  }).toList(),
                            ),
                          ],
                        );
                      },
                    ),
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
