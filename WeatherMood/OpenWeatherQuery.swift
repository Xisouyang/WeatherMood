//
//  Router.swift
//  WeatherMood
//
//  Created by Stephen Ouyang on 7/31/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import Foundation

class OpenWeatherQuery {
    
    var route: Route
    var params: [URLQueryItem]
    
    init(route: Route, params: [URLQueryItem]) {
        self.route = route
        self.params = params
    }
    
    static func createCurrentWeatherParams(lat: Float, lon: Float) -> [URLQueryItem] {
        return [URLQueryItem(name: "lat", value: String(lat)),
                URLQueryItem(name: "lon", value: String(lon)),
                URLQueryItem(name: "appid", value: Constants.api)]
    }
    
    static func createCityWeatherParams(city: String, country: String) -> [URLQueryItem] {
        return [URLQueryItem(name: "q", value: "\(city),\(country)"),
                URLQueryItem(name: "appid", value: Constants.api)]
    }
    
    var scheme: String {
        switch self.route {
        case .currentWeatherData:
            return "https"
        }
    }
    
    var host: String {
        switch self.route {
        case .currentWeatherData:
            return "api.openweathermap.org"
        }
    }
    
    var path: String {
        switch self.route {
        case .currentWeatherData:
            return "/data/2.5/weather"
        }
    }
    
    var method: String {
        switch self.route {
        case .currentWeatherData:
            return "GET"
        }
    }
}

enum Route {
    case currentWeatherData

}
