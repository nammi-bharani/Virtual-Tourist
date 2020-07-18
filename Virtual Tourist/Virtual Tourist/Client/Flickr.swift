//
//  Flickr.swift
//  Virtual Tourist
//
//  Created by Bharani Nammi on 7/16/20.
//  Copyright © 2020 Bharani Nammi. All rights reserved.
//

import Foundation
import CoreLocation


class Flickr{

    struct api {
        static var key = "408eca7a193ab4a786babe9c02fdfd72"
    }
    struct latAndLonAndUrl {
        static var latitude = 0.0
        static var longitude = 0.0
        
        static var fullUrl = ""
    }
    
    enum Endpoints {
        
        static let base = "https://api.flickr.com/services/rest/"
        static let flickrSearch = "?method=flickr.photos.search"
        static let format = "&format=json&nojsoncallback=1"
        static let searchRangeKM = "&radius=10"
        static let perpage = "&page=1&per_page=25"
        
        static let api_key = "&api_key="+Flickr.api.key
        
        
        case getPart1
        
        case getPart2
        
        var stringValue: String {
            switch self {
            
    //"(flickrEndpoint)?method=(flickrSearch)&format=(format)&api_key=(flickrAPIKey)&lat=(lat)&lon=(lng)&radius=(searchRangeKM)&page=(page)&per_page=(perpage)"
                
        // &lat=(lat)&lon=(lng)
        //&radius=(searchRangeKM)&page=(page)&per_page=(perpage)
                
                
            case .getPart1:
                return Flickr.Endpoints.base+Flickr.Endpoints.flickrSearch+Flickr.Endpoints.format+Flickr.Endpoints.api_key
                
                
            case .getPart2:
                return Flickr.Endpoints.searchRangeKM+Flickr.Endpoints.perpage
           
            }
        }
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    class func getTheUrl(){
        print(Flickr.latAndLonAndUrl.fullUrl)
    }

    class func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                //print(responseObject)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                 
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
            }
        }
        task.resume()
        
        return task
    }
    
    class func getPhotos(completion: @escaping ([Photo], Error?) -> Void) {
        taskForGETRequest(url: URL(string: Flickr.latAndLonAndUrl.fullUrl)!, responseType: FlickrResponse.self) { response, error in
            if let response = response {
                completion(response.photos.photo, nil)
            } else {
                completion([], error)
            }
        }
    }
}
