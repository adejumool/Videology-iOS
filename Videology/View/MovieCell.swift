//
//  MovieCell.swift
//  Videology
//
//  Created by Tobi Adejumo on 1/30/20.
//  Copyright © 2020 Tobi Adejumo. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [movieImage,movieTitle,movieDescription].forEach{movieImage.addSubview($0)}
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let movieImage: UIImageView = {
        let view  = UIImageView()
        
        view.backgroundColor = .red
        view.heightAnchor.constraint(equalToConstant: 180).isActive = true
        view.widthAnchor.constraint(equalToConstant: 101).isActive = true
        return view
    }()
    let movieDescription: UILabel = {
        let view  = UILabel()
        
        view.backgroundColor = .red
         view.heightAnchor.constraint(equalToConstant: 180).isActive = true
        return view
    }()
    let movieTitle: UILabel = {
        let view  = UILabel()
        
        view.backgroundColor = .red
         view.heightAnchor.constraint(equalToConstant: 180).isActive = true
        return view
    }()
    
    func setUpMovieContainer() {
        [movieImage,movieTitle,movieDescription].forEach{movieImage.addSubview($0)}
        movieImage.anchor(top: nil , bottom: nil, leading: leadingAnchor, trailing: trailingAnchor, centerY: centerYAnchor, centerX: nil)
        movieTitle.anchor(top: topAnchor, bottom: movieDescription.topAnchor, leading: leadingAnchor, trailing: trailingAnchor, centerY: nil, centerX: nil)
        movieDescription.anchor(top: movieTitle.topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, centerY: nil, centerX: nil)
    }
    
}
