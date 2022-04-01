import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_task1_app/data/models/weather_model.dart';
import 'package:weather_task1_app/data/utils/colors.dart';
import 'package:weather_task1_app/providers/theme_provider.dart';

class CustomWeatherBody extends StatelessWidget {
  final WeatherModel weather;
  final String failMessage;
  final bool loading;

  const CustomWeatherBody._({
    Key? key,
    required this.weather,
    this.failMessage = "",
    this.loading = false,
  }) : super(key: key);

  factory CustomWeatherBody.success({required WeatherModel weather}) {
    return CustomWeatherBody._(weather: weather);
  }

  factory CustomWeatherBody.loading() {
    return CustomWeatherBody._(
      weather: WeatherModel.fromJson({}),
      loading: true,
    );
  }

  factory CustomWeatherBody.fail({required String message}) {
    return CustomWeatherBody._(
      weather: WeatherModel.fromJson({}),
      failMessage: message,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          ThemeProvider.of(context, listen: false).isLight
              ? "assets/images/background_light.png"
              : "assets/images/background_dark.png",
          height: MediaQuery.of(context).size.height * 2,
          fit: BoxFit.cover,
        ),
        body(context),
      ],
    );
  }

  Widget body(BuildContext context) {
    if (loading) {
      return CupertinoActivityIndicator(
        radius: 20,
        color: Theme.of(context).iconTheme.color,
      );
    }
    if (weather.datetimeMs == -1) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          failMessage.isNotEmpty ? failMessage : "Xatolik sodir bo'ldi :(",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline2?.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
        ),
      );
    }
    final date = DateTime.fromMillisecondsSinceEpoch(weather.datetimeMs);
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                  ),
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: MyColors.blue),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        date.toTime(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        date.toMonthDay(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        date.toWeekDay(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(fontSize: 40),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  "assets/images/gerb.png",
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    "assets/images/${weather.weatherCode}.png",
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${weather.airT > 0 ? "+" : ""}${weather.airT}",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(fontSize: 50),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "o",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(fontSize: 30),
                          ),
                        ],
                      ),
                      Text(
                        weather.city.title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

extension on DateTime {
  String toTime() {
    return "${hour < 10 ? "0" : ""}$hour:${minute < 10 ? "0" : ""}$minute";
  }

  String toMonthDay() {
    String monthName = "Dekabr";
    if (month == 1) monthName = "Yanvar";
    if (month == 2) monthName = "Fevral";
    if (month == 3) monthName = "Mart";
    if (month == 4) monthName = "Aprel";
    if (month == 5) monthName = "May";
    if (month == 6) monthName = "Iyun";
    if (month == 7) monthName = "Iyul";
    if (month == 8) monthName = "Avgust";
    if (month == 9) monthName = "Sentabr";
    if (month == 10) monthName = "Oktabr";
    if (month == 11) monthName = "Noyabr";
    if (month == 12) monthName = "Dekabr";
    return "$day $monthName";
  }

  String toWeekDay() {
    if (weekday == 0) return "Yanshanba";
    if (weekday == 1) return "Dushanba";
    if (weekday == 2) return "Seshanba";
    if (weekday == 3) return "Chorshanba";
    if (weekday == 4) return "Payshanba";
    if (weekday == 5) return "Juma";
    return "Shanba";
  }
}
