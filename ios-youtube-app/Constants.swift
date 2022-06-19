//
//  Constants.swift
//  ios-youtube-app
//
//  Created by Kenneth Murerwa on 19/06/2022.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyAIYoJ4yUdm6KvjtotfDQAV1zj53tjAMAA"
    static var PLAYLIST_ID = "PLMRqhzcHGw1YViCUWS-MgKZ23PkSmnild"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
}
