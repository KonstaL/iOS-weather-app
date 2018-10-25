//
//  SecondViewController.swift
//  iOS-weatherapp
//
//  Created by Konsta Lehtinen on 09/10/2018.
//  Copyright © 2018 Konsta Lehtinen. All rights reserved.
//

import UIKit

class ForecastController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Return the number of cells
        return 5;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherTableViewCell;
        
        //Change the cell
        cell.weatherImageVIew.image = UIImage(named: "sunny");
        
        return cell;
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

