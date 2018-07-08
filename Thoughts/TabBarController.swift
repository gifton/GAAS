//
//  TabBarController.swift
//  Thoughts
//
//  Created by Dev on 7/2/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        let todoControl = ToDoController()
        todoControl.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let thoughtControl = ThoughtsController()
        thoughtControl.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.mostViewed, tag: 1)
        
        let catagoryControl = CatagoriesController()
        catagoryControl.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        let tabBarList = [todoControl, thoughtControl, catagoryControl]
        
        viewControllers = tabBarList
        // Do any additional setup after loading the view.
        
        self.tabBar.layer.opacity = 0.7
        self.tabBar.barStyle = UIBarStyle.blackOpaque
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
