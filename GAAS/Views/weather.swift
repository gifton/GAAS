import Foundation
import UIKit
import SwiftSky


class WeatherView : UIView {
    
    var weather : Double = 0.0
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(weatherLabel)
        weatherLabel.setAnchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, paddingTop: 20, paddingLeading: 20, paddingBottom: 0, paddingTrailing: 0)
        getWeather()
        backgroundColor = .clear
    }
    
    func getWeather() {
        
        SwiftSky.get([.current, .minutes, .hours, .days, .alerts],
                     at: Location(latitude: 47.8280918, longitude: 122.2630829)) { result in
            switch result {
            case .success(let forecast):
                let temp = (forecast.current?.temperature?.current?.value)!
                self.weatherLabel.text = String(temp)
                self.weather = temp
                let forecastCurrent = (forecast.days?.summary)!
                let future = (forecast.current?.sunrise)
                print (forecastCurrent)
                print (future)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    var weatherLabel : UILabel = {
        var lbl = UILabel()
        

        lbl.backgroundColor = UIColor.mainBlueHalf.withAlphaComponent(0.65)
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 45)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        return lbl
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
