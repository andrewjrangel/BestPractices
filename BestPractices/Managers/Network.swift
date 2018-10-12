//
//  Network.swift
//  BestPractices
//
//  Created by Andrew Rangel on 10/11/18.
//  Copyright © 2018 Antifragile Development. All rights reserved.
//

import Foundation

class NetworkManager {
    
    /**
     - Parameter completionHandler: response with type of `Weather`
     - Attention: This currently returns MOCK data
    */
    func getNowWeather(completionHandler:((_ response:Weather) -> Void)) {
        networkCall(url:"baseURL/weather/now", method:.get) {
            response in
            // convert response data to weather
            completionHandler(Weather(temp: 70.0, windSpeed: 5.0))
        }
    }
    
    /**
     - Parameter completionHandler: response with type of `WeatherError`
     - Attention: This currently returns MOCK data
     */
    func updateWeatherLocation(completionHandler:((_ response:WeatherError) -> Void)) {
        networkCall(url:"baseURL/weather/location", method:.push) {
            response in
            // Here is a convenient spot to type the response to a specific type
            // This allows for more flexibility on the network layer / implementation
            // cast error as Weather error type and return
            completionHandler(WeatherError.none)
        }
    }
    
    /**
     - parameters:
     - url: The full url you want to call
     - method: An enum NetworkCallMethod for what type of call you are making
     
     */
    func networkCall(url:String, method:NetworkCallMethod, completionHandler:((_ response:String) -> Void)) {
        print("call API integration layer with call: \(url) for method: \(method)")
        completionHandler("fake data")
    }
}

enum NetworkCallMethod {
    case get
    case push
}

struct Weather {
    var temp:Double
    var windSpeed:Double
    // etc
}

enum WeatherError {
    case badAuth
    case serverError
    case badLocation
    case noLocation
    case noConnection
    case none
}
