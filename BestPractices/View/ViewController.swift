//
//  ViewController.swift
//  BestPractices
//
//  Created by Andrew Rangel on 10/11/18.
//  Copyright © 2018 Antifragile Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nowWeatherLabel:UILabel!
    
    let networkManager = NetworkManager()
    var updateWeather:((_:Weather) -> ())?
    var currentWeather:Weather? {
        // Another favorite thing about Swift, the didSet method
        // The 0 is less than ideal as a default value, should have a fail state
        didSet {
            nowWeatherLabel.text = "\(currentWeather?.temp ?? 0)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        updateWeather = handleUpdateWeather
    }
    
    func configureView() {
        // default values and updates to the view are handled here, great for API driven apps
        // Also want to note the lack of "self". I like keeping self regulated to closures as it makes the code easier to visually parse
        nowWeatherLabel.text = "65"
    }
    
    func updateWeatherLocation() {
        // call a location manager to get users location
        networkManager.updateWeatherLocation { [weak self] (error) in
            self?.handleWeatherLocationUpdate(error: error)
        }
    }
    
    // Wanted to show how guard is a great pattern to keep in mind
    // Not the best implementation
    func handleWeatherLocationUpdate(error:WeatherError) {
        guard error == .none else {
            // show the error to the user
            return
        }
        
        //show success to the user
    }
    
    // This is to show one of my favorite things about Swift, passing closures to avoid delegate pattern
    func handleUpdateWeather(weather:Weather) {
        currentWeather = weather
    }
    
    // MARK:  Buttons
    @IBAction func nextViewWasPressed(sender:UIButton) {
        // Could handle any other prep or actions here for segue
    }
    
    // Here we can pass the closure to update the weather
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNextView" {
            if let destinationViewController = segue.destination as? WeatherViewController {
                destinationViewController.updateWeather = self.updateWeather
            }
        }
    }
}

