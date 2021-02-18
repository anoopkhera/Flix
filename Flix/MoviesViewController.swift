//
//  MoviesViewController.swift
//  Flix
//
//  Created by Anoop Khera on 2/10/21.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // add UITableViewDataSource and UITableViewDelegate - allows view controller to work with the table view
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [[String:Any]]() // property variable

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //print("Yo dawg")
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
              
              self.movies = dataDictionary["results"] as! [[String:Any]]
            
              // download of movies is complete. next step is to reload data
              self.tableView.reloadData() //calls both tableView functions below
            
              //print(dataDictionary)
              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data

           }
        }
        task.resume()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // this function is asking for a number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count //total number of rows = number of movies
    }
    
    // get the cell for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        // at any point there may be thousands of cells but dequeue checks if there are cells off screen and gives the recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movies[indexPath.row] //accesses the movies
        let title = movie["title"] as! String //cast movie["title"] to variable title as a String
        let synopsis = movie["overview"] as! String
        
        
        // ? == swift optionals
        //cell.textLabel?.text = title
        cell.titleLabel.text = title
        cell.synopsisLabel.text = synopsis
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)
        
        cell.posterView.af_setImage(withURL: posterURL!)
        
        return cell
    }
    
    // In a storyboard based app, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination
        // Pass the selected object to the new view controller
        
        // print("Loading up the details screen")
        
        // task 1 = find the selected movie
        // sender is the cell that was tapped on **
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
        
        // task 2 = pass the selected movie to the details view controller
        let detailsViewController = segue.destination as! MovieDetailsViewController
        detailsViewController.movie = movie // passes the movie object to MovieDetailsViewController
        
        tableView.deselectRow(at: indexPath, animated: true) // deselects row after click
        
        
    }
    

}
