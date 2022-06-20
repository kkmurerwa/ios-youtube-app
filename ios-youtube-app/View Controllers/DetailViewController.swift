//
//  DetailViewController.swift
//  ios-youtube-app
//
//  Created by Kenneth Murerwa on 20/06/2022.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Clear the fields for previous instance
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        // Check if there is video
        guard video != nil else {
            return
        }
        
        // Create the embed url
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        // Load the video into the webview
        let url = URL(string: embedUrlString)
        
        let embedRequest = URLRequest(url: url!)
        
        webView.load(embedRequest)
        
        // Set the video title
        titleLabel.text = video!.title
        
        // Set the date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.DATE_FORMAT
        
        dateLabel.text = dateFormatter.string(from: video!.published)
        
        // Set the description
        textView.text = video!.description
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
