//
//  WeatherConditionDataProvider.swift
//  Lab3
//
//  Created by Chizoba Orakwue on 2024-03-17.
//

import Foundation

extension ViewController {
    
    func loadWeatherConditions() {
                    weatherConditions = [
                        WeatherCondition(text: "Sunny", code: 1000),
                        WeatherCondition(text: "Partly cloudy", code: 1003),
                        WeatherCondition(text: "Cloudy", code: 1006),
                        WeatherCondition(text: "Overcast", code: 1009),
                        WeatherCondition(text: "Mist", code: 1030),
                        WeatherCondition(text: "Patchy rain possible", code: 1063),
                        WeatherCondition(text: "Patchy snow possible", code: 1066),
                        WeatherCondition(text: "Patchy sleet possible", code: 1069),
                        WeatherCondition(text: "Patchy freezing drizzle possible", code: 1072),
                        WeatherCondition(text: "Thundery outbreaks possible", code: 1087),
                        WeatherCondition(text: "Blowing snow", code: 1114),
                        WeatherCondition(text: "Blizzard", code: 1117),
                        WeatherCondition(text: "Fog", code: 1135),
                        WeatherCondition(text: "Freezing fog", code: 1147),
                        WeatherCondition(text: "Patchy light drizzle", code: 1150),
                        WeatherCondition(text: "Light drizzle", code: 1153),
                        WeatherCondition(text: "Freezing drizzle", code: 1168),
                        WeatherCondition(text: "Heavy freezing drizzle", code: 1171),
                        WeatherCondition(text: "Patchy light rain", code: 1180),
                        WeatherCondition(text: "Light rain", code: 1183),
                        WeatherCondition(text: "Moderate rain at times", code: 1186),
                        WeatherCondition(text: "Moderate rain", code: 1189),
                        WeatherCondition(text: "Heavy rain at times", code: 1192),
                        WeatherCondition(text: "Heavy rain", code: 1195),
                        WeatherCondition(text: "Light freezing rain", code: 1198),
                        WeatherCondition(text: "Moderate or heavy freezing rain", code: 1201),
                        WeatherCondition(text: "Light sleet", code: 1204),
                        WeatherCondition(text: "Moderate or heavy sleet", code: 1207),
                        WeatherCondition(text: "Patchy light snow", code: 1210),
                        WeatherCondition(text: "Light snow", code: 1213),
                        WeatherCondition(text: "Patchy moderate snow", code: 1216),
                        WeatherCondition(text: "Moderate snow", code: 1219),
                        WeatherCondition(text: "Patchy heavy snow", code: 1222),
                        WeatherCondition(text: "Heavy snow", code: 1225),
                        WeatherCondition(text: "Ice pellets", code: 1237),
                        WeatherCondition(text: "Light rain shower", code: 1240),
                        WeatherCondition(text: "Moderate or heavy rain shower", code: 1243),
                        WeatherCondition(text: "Torrential rain shower", code: 1246),
                        WeatherCondition(text: "Light sleet showers", code: 1249),
                        WeatherCondition(text: "Moderate or heavy sleet showers", code: 1252),
                        WeatherCondition(text: "Light snow showers", code: 1255),
                        WeatherCondition(text: "Moderate or heavy snow showers", code: 1258),
                        WeatherCondition(text: "Light showers of ice pellets", code: 1261),
                        WeatherCondition(text: "Moderate or heavy showers of ice pellets", code: 1264),
                        WeatherCondition(text: "Patchy light rain with thunder", code: 1273),
                        WeatherCondition(text: "Moderate or heavy rain with thunder", code: 1276),
                        WeatherCondition(text: "Patchy light snow with thunder", code: 1279),
                        WeatherCondition(text: "Moderate or heavy snow with thunder", code: 1282),
                    ]
                }
    
        internal func symbolForWeatherCode(_ code: Int) -> String? {
                switch code {
                case 1000: return "sun.max.fill"
                case 1003: return "cloud.sun.fill"
                case 1006, 1009: return "cloud.fill"
                case 1030: return "sun.rain.circle"
                case 1063, 1192, 1195, 1198, 1201: return "cloud.rain"
                case 1066, 1210, 1213, 1216, 1219, 1222, 1225: return "cloud.snow"
                case 1069, 1204, 1207: return "smoke.fill"
                case 1072, 1150, 1153, 1168, 1171: return "cloud.drizzle"
                case 1087: return "cloud.bolt"
                case 1114, 1117: return "wind.snow"
                case 1135, 1147: return "cloud.fog.fill"
                case 1180, 1183, 1186, 1189: return "sun.rain"
                case 1237, 1261: return "snowflake.road.lane.dashed"
                case 1240, 1243, 1246: return "sun.rain.circle.fill"
                case 1249: return "cloud.sleet.circle.fill"
                case 1252: return "cloud.sleet"
                case 1255, 1258, 1264: return "sun.snow"
                case 1273, 1276: return "cloud.bolt.rain"
                case 1279, 1282: return "wind.snow.circle"
                default: return nil
                }
            }
    
}
