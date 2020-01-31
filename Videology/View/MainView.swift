//
//  MainView.swift
//  Videology
//
//  Created by Tobi Adejumo on 1/30/20.
//  Copyright © 2020 Tobi Adejumo. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    var movieManager = MovieManager()
    var movies: [MovieModel] = []
    
    
    let tableView: UITableView = {
        let view  = UITableView()
        return view
    }()

    func configureTableView(){
        movieManager.delegate = self
        movieManager.getMovies()
    }

}

// MARK: - WeatherManagerDelegate

extension MainView: MovieManagerDelegate{
    func fetchMovie(_ movieManager: MovieManager, movies: [MovieModel]) {
        DispatchQueue.main.async {
            self.movies = movies
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.rowHeight = 200
            self.tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

extension MainView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print(movies)
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        let movie = movies[indexPath.row]
        cell.set(movie: movie)

        return cell
    }
}
extension ViewController{
    func setUpPage(){
        [pageView.tableView].forEach{view.addSubview($0)}
        pageView.tableView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, centerY: nil, centerX: nil)
    }
}
