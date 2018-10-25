import Foundation;
import RxSwift;
import CoreLocation;
//
//  ApiService.swift
//  iOS-weatherapp
//
//  Created by Konsta Lehtinen on 09/10/2018.
//  Copyright © 2018 Konsta Lehtinen. All rights reserved.
//
/**
 Singleton class that handles HTTP connections as a service
 */
class WeatherService {
   
    
    static let celsiusInKelvin = 273.15;

    let apiService: ApiService = ApiService.getInstance();
    static fileprivate var instance: WeatherService!;
    
    static func getInstance() -> WeatherService {
        if let weatherService = WeatherService.instance {
            return weatherService;
        }
        WeatherService.instance = WeatherService.init();
        
        return WeatherService.getInstance();
    }
    
    fileprivate init() {}
    
    
    func updateWeather() -> Observable<WeatherResponse?> {
        print("getting weather....")
        return apiService.getUrl(
            url: "https://api.openweathermap.org/data/2.5/weather?lat=61.49911&lon=23.78712&appid=dd73f9202eec3c60f5b7a86e7a4056f2"
        )
    } 
}
