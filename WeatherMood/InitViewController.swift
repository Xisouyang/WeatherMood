//
//  ViewController.swift
//  WeatherMood
//
//  Created by Stephen Ouyang on 7/31/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class InitViewController: UIViewController {
    
    var locationLabel = UILabel()
    var cityField = UITextField()
    var countryField = UITextField()
    var goButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createLocationLabel(label: locationLabel)
        locationLabelConstraints()
        
        createField(field: cityField, msg: "City")
        createField(field: countryField, msg: "Country")
        latFieldConstraints()
        longFieldConstraints()
        
        createButton(button: goButton)
        goButtonConstraints()
    }
}

extension InitViewController {
    
    func createLocationLabel(label: UILabel) {
        label.text = "Where Are You?"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(label)
        locationLabelConstraints()
    }
    
    func createField(field: UITextField, msg: String) {
        field.borderStyle = .none
        field.textColor = .black
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 5
        field.placeholder = msg
        field.textAlignment = .center
        view.addSubview(field)
    }
    
    func createButton(button: UIButton) {
        button.setTitle("Go", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1), for: .highlighted)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 98/255, green: 168/255, blue: 238/255, alpha: 1)
        button.addTarget(self, action: #selector(goButtonTapped), for: .touchUpInside)
        view.addSubview(button)
    }
}

extension InitViewController {
    @objc func goButtonTapped() {
        setLocation()
    }
    
    func setLocation() {
        
        MoodViewController.city = cityField.text!
        MoodViewController.country = countryField.text!
        
        let next = MoodViewController()
        self.navigationController?.pushViewController(next, animated: true)
    }
}

extension InitViewController {
    
    func locationLabelConstraints() {
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        locationLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 40).isActive = true
        locationLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        locationLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
    }
    
    func latFieldConstraints() {
        cityField.translatesAutoresizingMaskIntoConstraints = false
        cityField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cityField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        cityField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityField.topAnchor.constraint(equalToSystemSpacingBelow: locationLabel.topAnchor, multiplier: 8).isActive = true
    }
    
    func longFieldConstraints() {
        countryField.translatesAutoresizingMaskIntoConstraints = false
        countryField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        countryField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        countryField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        countryField.topAnchor.constraint(equalToSystemSpacingBelow: locationLabel.topAnchor, multiplier: 15).isActive = true
    }
    
    func goButtonConstraints() {
        goButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        goButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        goButton.topAnchor.constraint(equalToSystemSpacingBelow: countryField.topAnchor, multiplier: 20).isActive = true
    }
}



