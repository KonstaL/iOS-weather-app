//
//  FirstViewController.swift
//  iOS-weatherapp
//
//  Created by Konsta Lehtinen on 09/10/2018.
//  Copyright © 2018 Konsta Lehtinen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class WeatherViewController: UIViewController {
    var weatherViewModel: WeatherViewModel?;
    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBAction func btnClicked(_ sender: Any) {
        self.weatherViewModel!.updateWeather();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.weatherViewModel = WeatherViewModel(weatherService: WeatherService.getInstance());
    
        self.weatherViewModel?.currentWeatherString.bind(to: self.weatherLabel.rx.text);
        self.weatherViewModel?.currentLocation.bind(to: self.locationLabel.rx.text);
        self.weatherViewModel?.currentWeatherDesc.bind(to: self.weatherTypeLabel.rx.text);
        self.weatherViewModel?.currentWeatherIcon.map({val in UIImage(named: val)}).bind(to: self.weatherImageView.rx.image)
        
        
        self.weatherViewModel?.updateWeather();
    }


}

