//
//  LocationViewModel.swift
//  iOS-weatherapp
//
//  Created by Konsta Lehtinen on 15/10/2018.
//  Copyright © 2018 Konsta Lehtinen. All rights reserved.
//

import Foundation


class LocationViewModel {
    fileprivate var weatherService: WeatherService;
    
    /*
     Get services as parameter instead of initializing them in the consructor
     to eneble easier refactors in the future (eg. adding DI or Mock Services)
     */
    init(weatherService: WeatherService) {
        self.weatherService = weatherService;
    }
}
