// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/theme/cubit/theme_cubit.dart';
import 'package:flutter_counter/weather/views/weather_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({
    super.key,
    required this.weatherRepository,
  });

  final WeatherRepository weatherRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: weatherRepository,
      child: BlocProvider(
        create: (_) => ThemeCubit(),
        child: const WeatherAppView(),
      ),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<ThemeCubit, Color>(
      builder: (context, state) => MaterialApp(
        theme: ThemeData(
          primaryColor: state,
          textTheme: GoogleFonts.rajdhaniTextTheme(),
          appBarTheme: AppBarTheme(
            titleTextStyle: GoogleFonts.rajdhaniTextTheme(textTheme)
                .apply(bodyColor: Colors.white)
                .headline6,
          ),
        ),
        home: const WeatherPage(),
      ),
    );
  }
}
