//
//  WeatherViewModel.swift
//  iOS-weatherapp
//
//  Created by Konsta Lehtinen on 15/10/2018.
//  Copyright © 2018 Konsta Lehtinen. All rights reserved.
//

import Foundation;
import RxSwift;

class WeatherViewModel {
    let celsiusInKelvin = 273.15;
    fileprivate var weatherService: WeatherService;
    
    fileprivate let currentWeather: BehaviorSubject<WeatherResponse?> =  BehaviorSubject(value: nil);
    var currentWeatherString: Observable<String>;
    var currentLocation: Observable<String>;
    var currentWeatherDesc: Observable<String>;
    var currentWeatherIcon: Observable<String>;
    
    /*
     Get services as parameter instead of initializing them in the consructor
     to eneble easier refactors in the future (eg. adding DI or Mock Services)
     */
    init(weatherService: WeatherService) {
        self.weatherService = weatherService;
        self.currentWeatherString = self.currentWeather
            .filter({val in val != nil})
            .map({val in String(val!.main.temp - WeatherService.celsiusInKelvin ) + "°C"})
        
        self.currentLocation = self.currentWeather
            .filter({val in val != nil})
            .map({val in val!.name});
        
        self.currentWeatherDesc = self.currentWeather
            .filter({val in val != nil})
            .map({val in val!.weather.first!.description})
        
        self.currentWeatherIcon = self.currentWeather
            .filter({val in val != nil})
            .map({val in val!.weather.first!.description})
            .map({val in WeatherViewModel.getIconName(val)});
    }
    
    
    func updateWeather() {
        weatherService.updateWeather().subscribe({
            res in
            
            if let val = res.element {
                if let weather = val {
                    self.currentWeather.onNext(weather);
                }
            }
        })
    }
    
    fileprivate static func getIconName(_ input:String) -> String {
        let str = input.lowercased();
        
        if(str.range(of: "sunny") != nil) {
            return "sunny";
        } else if(str.range(of: "cloudy") != nil) {
            return "cloudy";
        } else if(str.range(of: "rainy") != nil) {
            return "rainy";
        }
        
        return "sunny";
    }
}


