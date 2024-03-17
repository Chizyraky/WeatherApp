//
//  WeatherUtilities.swift
//  Lab3
//
//  Created by Chizoba Orakwue on 2024-03-17.
//

import UIKit

extension ViewController {
       
    internal func loadWeather(search: String?) {
        guard let search = search else {
            return
        }
        
        guard let url = getURL(query: search) else {
            printContent("Could not get URL")
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                print("Received error from data task method")
                return
            }
            
            guard let data = data else {
                print("No data found")
                return
            }
            
            if let weatherResponse = self.parseJson(data: data) {
                
                DispatchQueue.main.async {
                    
                    let tempStr = weatherResponse.current.temp_c
                    self.tempCelsius = Float(tempStr)
                    self.changeTemperatureUnit()
                    
                    self.locationLabel.text = weatherResponse.location.name
                    self.temperatureLabel.text = "\(tempStr)°C"
                    
                    self.displayWeatherConditionImage(weatherCode: weatherResponse.current.condition.code)
                    self.displayWeatherConditionText(weatherCode: weatherResponse.current.condition.code)
                    
                }
            }
            
        }
        
        dataTask.resume()
    }
    
    internal func getWeatherDetailsForCurrLocation(latitude: Double, longitude: Double) {
        let query = "\(latitude),\(longitude)"
        
        loadWeather(search: query)
    }
    
    internal func changeTemperatureUnit() {
            if isFahrenheit {
                let temperatureFahrenheit = celsiusToFahrenheit(tempCelsius)
                temperatureLabel.text = "\(temperatureFahrenheit)°F"
            } else {
                temperatureLabel.text = "\(tempCelsius)°C"
            }
        }
    
    private func displayWeatherConditionImage(weatherCode: Int) {
        if let symbolName = symbolForWeatherCode(weatherCode) {
            let config = UIImage.SymbolConfiguration(paletteColors: [
                          .systemRed, .systemYellow
                ])
            weatherConidtionImage.preferredSymbolConfiguration = config
            weatherConidtionImage.image = UIImage(systemName: symbolName)
            
        } else {
            print("Unknown weather condition code: \(weatherCode)")
        }
    }
    
    private func displayWeatherConditionText(weatherCode: Int) {
        if let weatherCondition = weatherConditions.first(where: { $0.code == weatherCode }) {
            self.weatherConditionLabel.text = weatherCondition.text
        }
    }

    private func getURL(query: String) -> URL? {
        let baseUrl = "https://api.weatherapi.com/v1/"
        let currentEndPoint = "current.json"
        let apiKey = "97bc65b7f52c42da86910922241703"
        
        let url = "\(baseUrl)\(currentEndPoint)?key=\(apiKey)&q=\(query)"
        
        return URL(string: url)
    }

    private func parseJson(data: Data) -> WeatherResponse? {
        let decoder = JSONDecoder()
        var weather: WeatherResponse?
        
        do{
            weather = try decoder.decode(WeatherResponse.self, from: data)
        } catch {
            print("Error decoding \(error)")
        }
        return weather
    }
       
    private func celsiusToFahrenheit(_ celsius: Float) -> Float {
        return (celsius * 9/5) + 32
    }
}
