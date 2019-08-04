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
   
    var jsonArr: [WeatherModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        let param = OpenWeatherQuery.createCityWeatherParams(city: MoodViewController.city, country: MoodViewController.country)
        let router = OpenWeatherQuery(route: Route.currentWeatherData, params: param)
        
        NetworkLayer.request(router: router) { (result: Result<WeatherModel>) in
            switch result {
            case .success(let result):
                print("success")
                self.jsonArr.append(result)
                print(self.jsonArr)
                
            case .failure( let error):
                print("fail")
                print(error)
            }
        }
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
