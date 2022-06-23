//
//  CollectionViewCell.swift
//  SimpleWeather
//
//  Created by 권오준 on 2022/06/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func updateUI(day: String, weather: String ,temp: Int) {
        dayLabel.text = day
        weatherImageView.image = UIImage(systemName: weather)?
            .withRenderingMode(.alwaysOriginal)
        temperatureLabel.text = "\(temp)º"
    }
}
