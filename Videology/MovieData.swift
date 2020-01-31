//
//  Movie.swift
//  Videology
//
//  Created by Tobi Adejumo on 1/30/20.
//  Copyright © 2020 Tobi Adejumo. All rights reserved.
//

import UIKit


struct MovieData:Decodable {
    var results:[Movies]
}

struct Movies:Decodable{
    var poster_path: String
    var title: String
    var overview: String
}
