//
//  ViewController.swift
//  ios-youtube-app
//
//  Created by Kenneth Murerwa on 19/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("View did load calledx")
        
        model.getVideos()
    }


}

