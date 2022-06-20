//
//  ViewController.swift
//  ios-youtube-app
//
//  Created by Kenneth Murerwa on 19/06/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set table view data source and delegate as the viewcontroller(self)
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set model delegate as viewcontroller(self)
        model.delegate = self
        
        model.getVideos()
    }
    // MARK: - Model Delegate methods
    
    func videosFetched(_ videos: [Video]) {
        // Set the returned videos to our videos property
        self.videos = videos
        
        // Refresh the tableview
        tableView.reloadData()
    }
    
    
    // MARK: - TableView methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        
        // Configure the cell with the data
        
        // Get title for current video
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        // Return the cell for displaying
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

