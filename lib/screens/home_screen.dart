import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';
import 'package:weather_app/screens/day_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen ({super.key});


@override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget getWeatherIcon(int code) {
    switch (code) {
      case>200 && <= 300 :
      return Image.asset(
        'images/01.png'
      );
        case>300 && <= 400 :
      return Image.asset(
        'images/02.png'
      );
        case>500 && <= 600 :
      return Image.asset(
        'images/03.png'
      );
        case>600 && <= 700 :
      return Image.asset(
        'images/04.png'
      );
        case>700 && <= 800 :
      return Image.asset(
        'images/05.png'
      );
        case == 800 :
      return Image.asset(
        'images/06.png'
      );
        case>800 && <= 804 :
      return Image.asset(
        'images/07.png',
        scale: 1.5,
      );
      default:
      return Image.asset(
        'images/07.png'
      );
    }
  }

 
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
           statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 350,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 350,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
                ),
                BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                  builder: (context, state) {
                    if(state is WeatherBlocSuccess) {
                    return SizedBox(
                width: MediaQuery.of(context).size.width, 
                height: MediaQuery.of(context).size.height,
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                     Text(
                      '📍 ${state.weather.areaName}',
                    style: const TextStyle( 
                      color: Colors.white, 
                      fontWeight: FontWeight.w300 
                      ), 
                    ),
                    const SizedBox(height: 10),
                     Text( 
                      const DayScreen().getGreeting(),
                      style: const TextStyle( 
                        color: Colors.white, 
                        fontSize: 25, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Center(
                      child: getWeatherIcon(state.weather.weatherConditionCode!),
                      // child: Image.asset(
                      //   'images/01.png'
                      //   ),
                    ),
                      
                     Center(
                      child: Text(
                        '${state.weather.temperature!.celsius!.round()}° C',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.w600,
                        )
                      ),
                    ),
                     Center(
                      child: Text(
                        state.weather.weatherMain!.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        )
                      ),
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Text(
                        DateFormat('EEEE dd .').add_jm().format(state.weather.date!),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        )
                      ),
                    ),
                     const SizedBox(height: 15),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                          'images/06.png',
                          scale: 10,
                          ),
                          const SizedBox(width: 5),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                               'Sunrise',
                               style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                               ), 
                              ),
                              const SizedBox(height: 3),
                              Text(
                                 DateFormat().add_jm().format(state.weather.sunrise!),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                          'images/11.png',
                          scale: 7,
                          ),
                          const SizedBox(width: 5),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                               'Sunset',
                               style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                               ), 
                              ),
                              const SizedBox(height: 3),
                              Text(
                                DateFormat().add_jm().format(state.weather.sunset!),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          ],
                        ),
                      ],
                     ),
                     const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Divider(
                        color: Colors.grey,
                      ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                          children: [
                            Image.asset(
                          'images/12.png',
                          scale: 8,
                          ),
                          const SizedBox(width: 5),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                               'Temp Max.',
                               style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                               ), 
                              ),
                              const SizedBox(height: 3),
                              Text(
                                "${state.weather.tempMax!.celsius!.round()}°C",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                          'images/13.png',
                          scale: 20,
                          ),
                          const SizedBox(width: 5),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                               'Temp Min.',
                               style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                               ), 
                              ),
                              const SizedBox(height: 3),
                              Text(
                                "${state.weather.tempMin!.celsius!.round()}°C",
                                // '8° C',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          ],
                        ),
                        ],
                      ),
                      ],
                     ),
            );
                  } else {
                    return Container();
                  }
                  },
          ),
            ],
          ),
        ),
      ),
    );
  }
}


 