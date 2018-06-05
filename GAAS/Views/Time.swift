
import UIKit
import Foundation

class TimeView : UIView {
    
     var timer = Timer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildCell()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
    }
    
    
    var timeLabel : UILabel = {
        var lbl = UILabel()
        
        lbl.layer.cornerRadius = 20
        lbl.layer.masksToBounds = true
        lbl.backgroundColor = UIColor.mainBlueHalf.withAlphaComponent(0.85)
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 45)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        return lbl
    }()
    
    var secondsLabel : UILabel = {
        var lbl = UILabel()
        
        lbl.layer.cornerRadius = 20
        lbl.layer.masksToBounds = true
        lbl.backgroundColor = UIColor.mainGreenHalf.withAlphaComponent(0.85)
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 32)
        lbl.textColor = .white
        return lbl
    }()
    
    var dateLabel : UILabel = {
        var lbl = UILabel()
        
        lbl.layer.cornerRadius = 20
        lbl.layer.masksToBounds = true
        lbl.backgroundColor = UIColor.mainGrayHalf.withAlphaComponent(0.87)
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 42)
        lbl.textColor = .darkGray
        return lbl
    }()
    
    var timeView : UIView = {
        let view = UIView()
        return view
    }()
    
    var secondsView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        return view
    }()
    
    var dateView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        return view
    }()
    
    
    //build views
    func buildCell() {
        addSubview(timeView)
        addSubview(secondsView)
        addSubview(dateView)
        
        timeView.frame = CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.width) / 2, height: 200)
        NSLayoutConstraint.activate([
            secondsView.leadingAnchor.constraint(equalTo: timeView.trailingAnchor, constant: -5),
            secondsView.topAnchor.constraint(equalTo: timeView.topAnchor, constant: 0),
            secondsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            secondsView.heightAnchor.constraint(equalToConstant: 200),
        ])
        dateView.setAnchor(top: timeView.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeading: 0, paddingBottom: 0, paddingTrailing: 0)
        addContentToCell()
    }
    
    //add content
    func addContentToCell() {
        timeView.addSubview(timeLabel)
        timeLabel.setAnchor(top: timeView.topAnchor, leading: timeView.leadingAnchor, bottom: timeView.bottomAnchor, trailing: timeView.trailingAnchor, paddingTop: 0, paddingLeading: 10, paddingBottom: 5, paddingTrailing: 0)
        
        secondsView.addSubview(secondsLabel)
        secondsLabel.setAnchor(top: secondsView.topAnchor, leading: secondsView.leadingAnchor, bottom: secondsView.bottomAnchor, trailing: secondsView.trailingAnchor, paddingTop: 0, paddingLeading: 10, paddingBottom: 5, paddingTrailing: 0)
        
        dateView.addSubview(dateLabel)
        dateLabel.setAnchor(top: dateView.topAnchor, leading: dateView.leadingAnchor, bottom: dateView.bottomAnchor, trailing: dateView.trailingAnchor, paddingTop: 0, paddingLeading: 10, paddingBottom: 5, paddingTrailing: 5)
    }
    
    
    //define content
    @objc func tick() {
//        var output = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
//        print (output)
        let date = Date()
        let cal = Calendar.current
        let hour = cal.component(.hour, from: date)
        let minute = cal.component(.minute, from: date)
        let second = cal.component(.second, from: date)
        let day = cal.component(.day, from: date)
        let month = cal.component(.month, from: date)
        let year = cal.component(.year, from: date)
        
        if minute < 10 {
            timeLabel.text = "\(hour) : 0\(minute)"
        } else {
            timeLabel.text = "\(hour) : \(minute)"
        }
        secondsLabel.text = String(second)
        dateLabel.text = createDate(month: month, day: day, year: year)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
