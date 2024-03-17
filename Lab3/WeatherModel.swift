//
//  WeatherModel.swift
//  Lab3
//
//  Created by Chizoba Orakwue on 2024-03-17.
//

import Foundation

struct WeatherResponse: Decodable {
    let location: Location
    let current: Weather
}

struct Location: Decodable {
    let name: String
}

struct Weather: Decodable {
    let temp_c: Float
    let condition: WeatherCondition
}

struct WeatherCondition: Decodable {
    let text: String
    let code: Int
}
