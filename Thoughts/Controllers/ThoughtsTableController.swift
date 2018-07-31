//
//  ToDoTableController.swift
//  Thoughts
//
//  Created by Dev on 7/4/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

extension ThoughtsView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewID, for: indexPath) as! ThoughtsTableViewCell
        cell.title.text = self.sampleData.title
        cell.topic.text = self.sampleData.catagory.rawValue
        cell.icon.image = (self.sampleData.avatar).withAlignmentRectInsets(UIEdgeInsets(top: -5, left: -5, bottom: -5, right: -5))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
