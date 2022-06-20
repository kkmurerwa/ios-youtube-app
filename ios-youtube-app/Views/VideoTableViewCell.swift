//
//  VideoTableViewCell.swift
//  ios-youtube-app
//
//  Created by Kenneth Murerwa on 20/06/2022.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(_ v: Video) {
        self.video = v
        
        // Ensure that we have a video
        guard self.video != nil else {
            return
        }
        
        // Set title
        self.titleLabel.text = video!.title
        
        // Create date formatter for date. For more formats, go to NSDateformatter.com
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        
        // Set date from the date formatter
        self.dateLabel.text = dateFormatter.string(from: video!.published)
        
        // Check if the video thumbnail is empty
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // Check image cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            // Set the thumbnailImageView from cache
            self.thumbnailImageView.image = UIImage(data: cachedData)
            
            return
        }
        
        // Download the thumbnail data
        let thumbnailUrl = URL(string: self.video!.thumbnail)
        
        // Get the shared url session objetc
        let session = URLSession.shared
        
        // Create Data task
        let dataTask = session.dataTask(with: thumbnailUrl!) { (data, response, error) in
            
            if error == nil && data != nil {
                // Check that downloaded URL matches the video thumbnail url
                if thumbnailUrl!.absoluteString != self.video?.thumbnail {
                    // Video cell has been recycled for another video and no longer matches downloaded url
                    return
                }
                
                // Create the image object
                let image = UIImage(data: data!)
                
                CacheManager.setVideoCache(thumbnailUrl!.absoluteString, data)
                
                // Set the image object to imageview in main thread
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
            
        }
        
        // Initialize data task
        dataTask.resume()
    }
    
}
