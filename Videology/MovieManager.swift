//
//  MovieManager.swift
//  Videology
//
//  Created by Tobi Adejumo on 1/30/20.
//  Copyright © 2020 Tobi Adejumo. All rights reserved.
//

import UIKit


protocol MovieManagerDelegate {
    func fetchMovie(_ movieManager: MovieManager, movies: [MovieModel])
    func didFailWithError(error: Error)
}

struct MovieManager{
    let movieURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
    
    var delegate: MovieManagerDelegate?
    
    func getMovies(){
        performRequest(with: movieURL)
    }
    
    func performRequest(with urlString: String) {
        // 1. Create a URL
        if let url = URL(string: urlString) {
            // 2. Create URLSession
            let session = URLSession(configuration: .default)
            // 3. give the Session a task
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data{
                    if let movies = self.parseJson(safeData){
                        self.delegate?.fetchMovie(self, movies: movies)
                    }
                }
            }
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJson(_ movieData: Data) -> [MovieModel]? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(MovieData.self, from: movieData)
            let numberOfMovies = decodedData.results.count
            var movies: [MovieModel] = []
            for num in 0..<numberOfMovies{
                let movieImage = decodedData.results[num].poster_path
                let movieTitle = decodedData.results[num].title
                let movieDescription = decodedData.results[num].overview
                let movieAndInfo = MovieModel(movieImage: UIImage(data: try! Data(contentsOf: URL(string:"https://image.tmdb.org/t/p/w342"+movieImage)!))!, movieTitle: movieTitle, movieDescription: movieDescription)
                movies.append(movieAndInfo)
            }
            return movies
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }

}
