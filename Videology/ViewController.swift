//
//  ViewController.swift
//  Videology
//
//  Created by Tobi Adejumo on 1/27/20.
//  Copyright © 2020 Tobi Adejumo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let pageView = MainView()
    let movieCell = MovieCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        setUpPage()
        pageView.configureTableView()
        
    }
}

