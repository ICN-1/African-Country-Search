import 'package:african_countries_search/cubits/country_details_cubit.dart';
import 'package:african_countries_search/cubits/theme_cubit.dart';
import 'package:african_countries_search/cubits/home_cubit.dart';
import 'package:african_countries_search/routes/app_routes.dart';
import 'package:african_countries_search/screens/country_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home_screen.dart';
import 'states/theme_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()..getInitialTheme()),
        BlocProvider(create: (_) => HomeCubit()..getAllCountries()),
        BlocProvider(create: (_) => CountryDetailsCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          ThemeMode theme = ThemeMode.system;
          if (state is CurrentThemeState) {
            theme = state.currentTheme;
          }
          return MaterialApp(
            title: "African Countries",
            themeMode: theme,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            initialRoute: AppRoutes.homeScreen,
            routes: {
              AppRoutes.homeScreen: (_) => HomeScreen(),
              AppRoutes.viewDetailsScreen: (_) => CountryDetailsScreen(),
            },
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
