//
//  MovieManager.swift
//  Videology
//
//  Created by Tobi Adejumo on 1/30/20.
//  Copyright © 2020 Tobi Adejumo. All rights reserved.
//

import UIKit


protocol MovieManagerDelegate {
    func didUpdateWeather(_ weatherManager: MovieManager, weather: MovieModel)
    func didFailWithError(error: Error)
}

struct MovieManager{
    let weatherURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
    
    var delegate: MovieManagerDelegate?
    
    func fetchWeather(cityName:String){
        let urlString="\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(with: urlString)
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
                    if let weather = self.parseJson(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJson(_ movieData: Data) -> MovieModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(MovieData.self, from: movieData)
            let movieImage = decodedData.results[0].poster_path
            let movieTitle = decodedData.results[0].title
            let movieDescription = decodedData.results[0].overview
            
            let movies = MovieModel(movieImage: movieImage, movieTitle: movieTitle, movieDescription: movieDescription)
            return movies
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }

}
