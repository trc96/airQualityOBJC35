//
//  TRCCityDetailsViewController.swift
//  airQualityOBJC35
//
//  Created by Todd Crandall on 8/12/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

import UIKit

class TRCCityDetailsViewController: UIViewController {
    
    //MARK: - Properties
    var country: String?
    var state: String?
    var city: String?
    
    //MARK: - Outlets
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var aqiLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let city = city,
        let state = state,
        let country = country
            else { return }
        
        TRCCityAirQualityController.fetchData(forCity: city, state: state, country: country) { (cityDetails) in
            if let details = cityDetails {
                self.updateViews(with: details)
            }
        }
    }
    //MARK: - Methods
    func updateViews(with details: TRCCityAirQuality) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = details.city
            self.stateLabel.text = details.state
            self.countryLabel.text = details.country
            self.aqiLabel.text = "The AQI is: \(details.pollution.airQualityIndex)"
            self.temperatureLabel.text = "The temperature is: \(details.weather.temperature) Celcius"
            self.humidityLabel.text = "The humidity is: \(details.weather.humidity)%"
            self.windSpeedLabel.text = "The wind Speed is: \(details.weather.windSpeed) mph"
        }
    }

}
