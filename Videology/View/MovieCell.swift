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
        setUpMovieContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let movieImage: UIImageView = {
        let view  = UIImageView()
        
        view.backgroundColor = .blue
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.widthAnchor.constraint(equalToConstant: 112.5).isActive = true
        return view
    }()
    
    let movieTitle: UILabel = {
        let view  = UILabel()
    
        view.backgroundColor = .green
        view.textAlignment = .center
        
        //view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return view
    }()
    
    let movieDescription: UILabel = {
        let view  = UILabel()
        
        view.backgroundColor = .red
        view.adjustsFontSizeToFitWidth = true
        view.numberOfLines = 0
        //view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return view
    }()

    
    func setUpMovieContainer() {
        [movieImage,movieTitle,movieDescription].forEach{addSubview($0)}
        movieImage.anchor(top: nil , bottom: nil, leading: leadingAnchor, trailing: movieTitle.leadingAnchor, centerY: centerYAnchor, centerX: nil)
        movieTitle.anchor(top: topAnchor, bottom: movieDescription.topAnchor, leading: movieImage.trailingAnchor, trailing: trailingAnchor, centerY: nil, centerX: nil)
        movieDescription.anchor(top: movieTitle.bottomAnchor, bottom: bottomAnchor, leading: movieImage.trailingAnchor, trailing: trailingAnchor, centerY: nil, centerX: nil)
    }
    
    func set(movie: MovieModel){
        movieImage.image = UIImage(data: try! Data(contentsOf: URL(string:"https://image.tmdb.org/t/p/w342"+movie.movieImage)!))
        movieTitle.text = movie.movieTitle
        movieDescription.text = movie.movieDescription
        
    }
    
}



