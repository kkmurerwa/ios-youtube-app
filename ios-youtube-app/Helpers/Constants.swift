//
//  Constants.swift
//  ios-youtube-app
//
//  Created by Kenneth Murerwa on 19/06/2022.
//

import Foundation

struct Constants {
    
    // URL constants
    static var API_KEY = "AIzaSyAIYoJ4yUdm6KvjtotfDQAV1zj53tjAMAA"
    static var PLAYLIST_ID = "PLMRqhzcHGw1YViCUWS-MgKZ23PkSmnild"
//    static var PLAYLIST_ID = "PLfWZgwQtrMuc98zjnJCUoob0cXyP_8OWn"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
    
    // Other constants
    static var VIDEOCELL_ID = "VideoCell"
    
    static var DATE_FORMAT = "EEEE, MMM d, yyyy"
    
}
