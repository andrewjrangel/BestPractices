//
//  WeatherViewController.swift
//  BestPractices
//
//  Created by Andrew Rangel on 10/11/18.
//  Copyright © 2018 Antifragile Development. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    var updateWeather:((_:Weather) -> ())?
    let networkManager = NetworkManager()
    
    @IBOutlet var updateLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getCurrentWeather()
    }
    
    func getCurrentWeather() {
        networkManager.getNowWeather { [weak self] (weather) in
            // Did this to talk about how weak self is necessary in a closure like this
            // This is because the user could navigate away from this screen before the asnyc call returns
            // Weak self avoids memory leaks
            self?.updateWeather?(weather)
            self?.updateLabel.text = "Weather should now be set to \(weather.temp)"
        }
    }
}
