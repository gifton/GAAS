import Foundation
import UIKit
import SwiftSky


class WeatherView : UIView {
    
    var weather : Double = 0.0
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildWeatherViews()
        getWeather()
        backgroundColor = .clear
    }
    
    /*
     sunsetView
     currentSunsetLabel
     currentSunsetIcon
     sunriseView
     currentSunriseLabel
     currentSunriseIcon
     
     precipView
     currentPrecipitationLabel
     currentPrecipitaionIcon
    */
    
    //current temp
    let currentTempView : UIView = {
        let view = UIView()
        
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2).isActive = true
        view.blurBackground(type: .light)
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    
    var currentTempLabel : UILabel = {
        var lbl = UILabel()
        
        lbl.addBorders(edges: [.top])
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 45)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        return lbl
    }()
    
    var currentTempIcon : UIImageView = {
        let iv = UIImageView()
        
        let sizeConst : CGFloat = 100
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.setHeightWidth(width: sizeConst, height: sizeConst)
        return iv
    }()
    
    //sunset
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
        
        iv.image = #imageLiteral(resourceName: "sunset")
        let sizeConst : CGFloat = 50
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.setHeightWidth(width: sizeConst, height: sizeConst)
        return iv
    }()
    
    //detailView (sunset, sunrise  precipitation
    
    let detailView : UIView = {
        let view = UIView()
        view.addBorders(edges: [.all])
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    
    var precipitationIcon : UIImageView = {
        let iv = UIImageView()
        
        let sizeConst : CGFloat = 25
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.setHeightWidth(width: sizeConst, height: sizeConst)
        return iv
    }()
    
    var precipitationLabel : UILabel = {
        var lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 15)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        return lbl
    }()
    
    //description
    let descriptionView : UIView = {
        let view = UIView()
        
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.backgroundColor = UIColor.mainGrayHalf
        view.setCellShadow()
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    
    var currentWeatherDescription : UILabel = {
        var lbl = UILabel()
        
        lbl.numberOfLines = 3
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.black
        return lbl
    }()
    
    //build cell
    fileprivate func buildWeatherViews() {
        
        //add views
        addSubview(descriptionView)
        addSubview(currentTempView)
        addSubview(detailView)
        
        //anchor views
        descriptionView.setAnchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeading: 0, paddingBottom: 0, paddingTrailing: -5)
        
        currentTempView.setAnchor(top: topAnchor, leading: leadingAnchor, bottom: descriptionView.topAnchor, trailing: nil, paddingTop: 5, paddingLeading: 10, paddingBottom: 10, paddingTrailing: 0)
        
        detailView.setAnchor(top: topAnchor, leading: currentTempView.trailingAnchor, bottom: descriptionView.topAnchor, trailing: trailingAnchor, paddingTop: 5, paddingLeading: 5, paddingBottom: 10, paddingTrailing: 5)
        buildContent()
    }
    
    //add labels and images
    fileprivate func buildContent() {
        //description view
        descriptionView.addSubview(currentWeatherDescription)
        currentWeatherDescription.setAnchor(top: descriptionView.topAnchor, leading: descriptionView.leadingAnchor, bottom: descriptionView.bottomAnchor, trailing: descriptionView.trailingAnchor, paddingTop: 0, paddingLeading: 0, paddingBottom: 5, paddingTrailing: 5)
        
        //current temp
        currentTempView.addSubview(currentTempLabel)
        currentTempView.addSubview(currentTempIcon)
        currentTempLabel.setAnchor(top: nil, leading: currentTempView.leadingAnchor, bottom: currentTempView.bottomAnchor, trailing: currentTempView.trailingAnchor, paddingTop: 0, paddingLeading: 5, paddingBottom: 5, paddingTrailing: 5)
        currentTempIcon.setAnchor(top: currentTempView.topAnchor, leading: currentTempView.leadingAnchor, bottom: nil, trailing: nil, paddingTop: 40, paddingLeading: 45, paddingBottom: 0, paddingTrailing: 0)
        
        //precipitation
        detailView.addSubview(precipitationIcon)
        detailView.addSubview(precipitationLabel)
        detailView.addSubview(currentSunsetIcon)
        detailView.addSubview(currentSunsetLabel)
        NSLayoutConstraint.activate([
            precipitationIcon.leadingAnchor.constraint(equalTo: detailView.leadingAnchor),
            precipitationIcon.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant: -5),
            precipitationLabel.leadingAnchor.constraint(equalTo: precipitationIcon.trailingAnchor, constant: 5),
            precipitationLabel.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant: -5),
            precipitationLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor),
            currentSunsetLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 2),
            currentSunsetLabel.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 5),
            currentSunsetIcon.topAnchor.constraint(equalTo: currentSunsetLabel.bottomAnchor, constant: 5),
            currentSunsetIcon.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 2)
        ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
