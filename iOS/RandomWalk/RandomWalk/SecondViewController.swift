//
//  SecondViewController.swift
//  RandomWalk
//
//  Created by E on 2/28/16.
//  Copyright © 2016 RandomWalk. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func callLyft(sender: AnyObject) {
        // If Lyft is not installed, send the user to the Apple App Store
        let myApp = UIApplication.sharedApplication()
        let lyftAppURL = NSURL(string: "lyft://")!
        if myApp.canOpenURL(lyftAppURL) {
            // Lyft is installed; launch it
            myApp.openURL(lyftAppURL)
        } else {
            // Lyft not installed; open App Store
            let lyftAppStoreURL = NSURL(string: "https://itunes.apple.com/us/app/lyft-taxi-bus-app-alternative/id529379082")!
            myApp.openURL(lyftAppStoreURL)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

