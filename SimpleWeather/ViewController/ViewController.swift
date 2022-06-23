//
//  ViewController.swift
//  SimpleWeather
//
//  Created by 권오준 on 2022/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(
            UINib(nibName: "CollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "cell")
        reload()
    }
}

extension ViewController: UICollectionViewDelegate,
                          UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int)
    -> Int {
        return cities.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let day = days[indexPath.row]
        let weather = weathers.randomElement()!
        let temperature = Int.random(in: 10...30)
        
        cell.updateUI(day: day, weather: weather, temp: temperature)
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath)
    -> CGSize {
        let width = (collectionView.frame.width - 40) / 5
        let height: CGFloat = 100
        
        return CGSize(width: width, height: height)
    }
}

extension ViewController {
    func reload() {
        cityLabel.text = cities.randomElement()
        weatherImageView.image = UIImage(systemName: weathers.randomElement()!)?
            .withRenderingMode(.alwaysOriginal)
        temperatureLabel.text = "\(Int.random(in: 10...30))º"
        collectionView.reloadData()
    }
    
    @IBAction func didTapChangeButton(_ sender: Any) {
        reload()
    }
}
