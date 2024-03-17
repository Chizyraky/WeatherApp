//
//  ViewController.swift
//  Lab3
//
//  Created by Chizoba Orakwue on 2024-03-16.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var weatherConidtionImage: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var weatherConditionLabel: UILabel!
    
    @IBOutlet weak var temperatureSwitch: UISwitch!
    
    var isLocationButtonTapped = false
    var isFahrenheit = false
    var tempCelsius: Float = 0.0
    var weatherConditions: [WeatherCondition] = []
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInitialWeatherImage()
        
        searchTextField.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        loadWeatherConditions()
    }
    
    @IBAction func onTempSwitchTapped(_ sender: UISwitch) {
    
        if (locationLabel.text == "Location") {
            sender.isOn = !sender.isOn
            return
        }
        
        sender.isOn = sender.isOn
        isFahrenheit = sender.isOn
        changeTemperatureUnit()
        isFahrenheit = true
    }
    
    @IBAction func onLocationTapped(_ sender: UIButton) {
        resetSwitch()
        isLocationButtonTapped = true
        locationManager.requestLocation()
    }
    
    @IBAction func onSearchTapped(_ sender: UIButton) {
        resetSwitch()
        loadWeather(search: searchTextField.text)
    }
    
    
    private func loadInitialWeatherImage() {
            let config = UIImage.SymbolConfiguration(paletteColors: [
                .systemYellow
                ])
            weatherConidtionImage.preferredSymbolConfiguration = config
            weatherConidtionImage.image = UIImage(systemName: "cloud.fill")
            
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resetSwitch()
        
        textField.endEditing(true)
        loadWeather(search: searchTextField.text)
        return true
    }
    
    private func resetSwitch() {
        if isFahrenheit {
            temperatureSwitch.isOn = !temperatureSwitch.isOn
            isFahrenheit = false
        }
    }
}


extension ViewController {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            getWeatherDetailsForCurrLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            locationManager.stopUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            if isLocationButtonTapped {
                locationManager.requestLocation()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
    }
}


