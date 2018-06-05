import Foundation
import UIKit
import SwiftSky


extension ExploreViewController {    
    
//    func makeGetCall() {
//        // Set up the URL request
//        
//        let mainUrl : String = "https://api.darksky.net/forecast/" + ExploreViewController.API_KEY + "/42.3601,-71.0589"
//        guard let url = URL(string: mainUrl) else {
//            print("Error: cannot create URL")
//            return
//        }
//        let urlRequest = URLRequest(url: url)
//        
//        // set up the session
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config)
//        
//        // make the request
//        let task = session.dataTask(with: urlRequest) {
//            (data, response, error) in
//            // check for any errors
//            print ("//------------------------------------")
//            guard error == nil else {
//                print("error calling GET on /explore/weather")
//                print(error!)
//                return
//            }
//            // make sure we got data
//            guard let responseData = data else {
//                print("Error: did not receive data")
//                return
//            }
//            // parse the result as JSON, since that's what the API provides
//            do {
//                guard let weather = try JSONSerialization.jsonObject(with: responseData, options: [])
//                    as? [String: Any] else {
//                        print("error trying to convert data to JSON")
//                        return
//                }
//                print (weather)
//                guard let weatherMain = weather["temp_f"] as? String else {
//                    print("Could not get todo title from JSON")
//                    return
//                }
//                print("The title is: " + weatherMain)
//            } catch  {
//                print("error trying to convert data to JSON")
//                return
//            }
//        }
//        task.resume()
//    }
}
