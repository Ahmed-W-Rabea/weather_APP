import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search city"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: TextField(
          onSubmitted: (value) async {
            var getWeathercubit = context.read<GetWeatherCubit>();
            getWeathercubit.getWeather(cityName: value);
            // ignore: unused_local_variable

            Navigator.pop(context);
          },
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              labelText: 'Search',
              hintText: 'Enter city name',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.cyan))),
        ),
      ),
    );
  }
}
