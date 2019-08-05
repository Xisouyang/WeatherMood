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
    var dataArr: [WeatherModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        let param = OpenWeatherQuery.createCityWeatherParams(city: MoodViewController.city, country: MoodViewController.country)
        let router = OpenWeatherQuery(route: Route.currentWeatherData, params: param)
        
        NetworkLayer.request(router: router) { (result: Result<WeatherModel>) in
            switch result {
            case .success(let result):
                
                print("success")
                print(result)
                self.dataArr.append(result)
                
                DispatchQueue.main.async {
                    self.createDataStack()
                }
                
                
            case .failure( let error):
                print("fail")
                print(error)
                
                DispatchQueue.main.async {
                    let errorMessage = self.createErrorMsg()
                    self.view.addSubview(errorMessage)
                    self.errorMsgConstraints(errorMsg: errorMessage)
                }
            }
        }
    }
}

extension MoodViewController {
    
    func createErrorMsg() -> UILabel {
        
        let errorMsg = UILabel()
        errorMsg.text = "Error! Please enter valid location!"
        errorMsg.textAlignment = .center
        errorMsg.font = UIFont.systemFont(ofSize: 20)
        return errorMsg
    }
    
    func errorMsgConstraints(errorMsg: UILabel) {
        
        errorMsg.translatesAutoresizingMaskIntoConstraints = false
        errorMsg.heightAnchor.constraint(equalToConstant: 60).isActive = true
        errorMsg.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        errorMsg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        errorMsg.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension MoodViewController {
    
    func createLabel(msg: String) -> UILabel {
        let label = UILabel()
        label.text = msg
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }
    
    func createDataStack() {
        
        let titleLabel = self.createLabel(msg: self.dataArr.first!.name)
        let weatherLabel = self.createLabel(msg: (self.dataArr.first?.weather[0].weatherDescription)!)
        let tempLabel = self.createLabel(msg: String(format: "%f F", (self.dataArr.first?.main.temp)!))
        
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, weatherLabel, tempLabel])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        self.view.addSubview(stack)
        self.stackConstraints(stack: stack)
    }
    
    func stackConstraints(stack : UIStackView) {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        stack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 10).isActive = true
    }
}
