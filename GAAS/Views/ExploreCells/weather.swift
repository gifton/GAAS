import Foundation
import UIKit
import SwiftSky


class WeatherView : UIView {
    
    var weather : Double = 0.0
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildWeatherView()
        backgroundColor = .clear
    }
    
    fileprivate func buildWeatherView() {
        
        addSubview(descriptionView)
        descriptionView.setAnchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeading: -8, paddingBottom: -15, paddingTrailing: -15)
        descriptionView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        descriptionView.addSubview(currentWeatherDescription)
        currentWeatherDescription.setAnchor(top: descriptionView.topAnchor, leading: descriptionView.leadingAnchor, bottom: descriptionView.bottomAnchor, trailing: descriptionView.trailingAnchor, paddingTop: 0, paddingLeading: 0, paddingBottom: 5, paddingTrailing: 5)
    }
    /*
     tempView
     currentTempLabel
     currentTempIcon
     
     sunsetView
     currentSunsetLabel
     currentSunsetIcon
     sunriseView
     currentSunriseLabel
     currentSunriseIcon
     
     precipView
     currentPrecipitationLabel
     currentPrecipitaionIcon
     
     descriptionView
     currentWeatherDescription
    */
    var currentTempLabel : UILabel = {
        var lbl = UILabel()

        lbl.backgroundColor = UIColor.mainBlueHalf.withAlphaComponent(0.65)
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 45)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        return lbl
    }()
    
    var currentTempIcon : UIImageView = {
        let iv = UIImageView()
        
        let sizeConst : CGFloat = 100
        iv.downloadedFrom(imgString: "https://icons.wxug.com/i/c/a/clear.gif")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.setHeightWidth(width: sizeConst, height: sizeConst)
        return iv
    }()
    
    var currentSunsetLabel : UILabel = {
        var lbl = UILabel()
        
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        return lbl
    }()
    
    var currentSunsetIcon : UIImageView = {
        let iv = UIImageView()
        
        let sizeConst : CGFloat = 25
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.setHeightWidth(width: sizeConst, height: sizeConst)
        return iv
    }()
    
    var currentSunriseLabel : UILabel = {
        var lbl = UILabel()
        
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        return lbl
    }()
    
    var currentSunriseIcon : UIImageView = {
        let iv = UIImageView()
        
        let sizeConst : CGFloat = 25
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.setHeightWidth(width: sizeConst, height: sizeConst)
        return iv
    }()
    
    let descriptionView : UIView = {
        let view = UIView()
        
        view.layer.cornerRadius = 20
        view.setCellShadow()
        view.blurBackground()
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    
    var currentWeatherDescription : UILabel = {
        var lbl = UILabel()
        
        lbl.numberOfLines = 3
        lbl.text = "Light rain on Sunday and next Wednesday, with high temperatures rising to 77°F on Friday."
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.black
        return lbl
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
