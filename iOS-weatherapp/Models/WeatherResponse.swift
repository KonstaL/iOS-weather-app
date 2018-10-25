//
//  Weather.swift
//  iOS-weatherapp
//
//  Created by Konsta Lehtinen on 14/10/2018.
//  Copyright © 2018 Konsta Lehtinen. All rights reserved.
//

import Foundation

struct WeatherResponse: Codable {
    var coord: Coord;
    var weather: [Weather];
    var name: String;
    var main: WeatherData;
    
    init?(json: [String: Any]) {
        guard
            let coord = Coord(json: json["coord"] as! [String: Any]),
            let weatherArr = (json["weather"] as? [[String: Any]]),
            let name = json["name"] as? String,
            let main = WeatherData(json: json["main"] as! [String: Any])
            else {
                NSLog("JSON parsing failed");
                return nil
        }
        let weather = weatherArr.compactMap({val in Weather(json: val)});
        
        self.coord = coord;
        self.weather = weather;
        self.name = name;
        self.main = main;
    }
}

struct Coord: Codable {
    var lat: Double;
    var lon: Double;
    var alt: Double?;
    
    init?(json: [String: Any]) {
        guard
            let lat = json["lat"] as? Double,
            let lon = json["lon"] as? Double
            else {
                NSLog("Coordinate JSON parsing failed");
                return nil
        }
        
        self.lat = lat
        self.lon = lon
        if let alt = json["alt"] as? Double {
            self.alt = alt;
        }
    }
}

struct Weather: Codable {
    var id: Int;
    var main: String;
    var description: String;
    var icon: String;
    
    init?(json: [String: Any]) {
        guard
            let id = json["id"] as? Int,
            let main = json["main"] as? String,
            let description = json["description"] as? String,
            let icon = json["icon"] as? String
            else {
                NSLog("JSON parsing failed");
                return nil
        }
        self.id = id;
        self.main = main;
        self.description = description;
        self.icon = icon;
    }
}

struct WeatherData: Codable {
    var temp: Double;
    // and other properties like pressurem, min and max temp
    
    init?(json: [String: Any]) {
        guard
            let temp = json["temp"] as? Double
            else {
                NSLog("JSON parsing failed");
                return nil
        }
        self.temp = temp
    }
}

/*
 main
 temp    272.72
 pressure    1000
 humidity    100
 temp_min    272.15
 temp_max    273.15
 */
/*
 {
 "coord": {
 "lon": 139.01,
 "lat": 35.02
 },
 "weather": [
 {
 "id": 800,
 "main": "Clear",
 "description": "clear sky",
 "icon": "01n"
 }
 ],
 "base": "stations",
 "main": {
 "temp": 285.514,
 "pressure": 1013.75,
 "humidity": 100,
 "temp_min": 285.514,
 "temp_max": 285.514,
 "sea_level": 1023.22,
 "grnd_level": 1013.75
 },
 "wind": {
 "speed": 5.52,
 "deg": 311
 },
 "clouds": {
 "all": 0
 },
 "dt": 1485792967,
 "sys": {
 "message": 0.0025,
 "country": "JP",
 "sunrise": 1485726240,
 "sunset": 1485763863
 },
 "id": 1907296,
 "name": "Tawarano",
 "cod": 200
 }
 */
