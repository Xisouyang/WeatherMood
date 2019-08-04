//
//  InitViewController.swift
//  WeatherMood
//
//  Created by Stephen Ouyang on 8/1/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class MoodViewController: UIViewController {
    
    static var city: String = ""
    static var country: String = ""
    
    var errorMsg = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        let param = OpenWeatherQuery.createCityWeatherParams(city: MoodViewController.city, country: MoodViewController.country)
        let router = OpenWeatherQuery(route: Route.currentWeatherData, params: param)
        
        NetworkLayer.request(router: router) { (result: Result<WeatherModel>) in
            switch result {
            case .success(let result):
                print("success")
                
            case .failure( let error):
                print("fail")
                print(error)
                DispatchQueue.main.async {
                    self.createErrorMsg()
                }
            }
        }

        // Do any additional setup after loading the view.
    }
}

extension MoodViewController {
    
    func createErrorMsg() {
        errorMsg.text = "Error! Please enter valid location!"
        errorMsg.textAlignment = .center
        errorMsg.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(errorMsg)
        errorMsgConstraints()
    }
}

extension MoodViewController {
    
    func errorMsgConstraints() {
        
        errorMsg.translatesAutoresizingMaskIntoConstraints = false
        errorMsg.heightAnchor.constraint(equalToConstant: 60).isActive = true
        errorMsg.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        errorMsg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        errorMsg.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
