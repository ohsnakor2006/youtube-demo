//
//  Model.swift
//  youTubeProject
//
//  Created by yuguo on 25/6/20.
//  Copyright © 2020 RY. All rights reserved.
//

import Foundation


class Model {
    
    func getvideo(){
        // create a URL object
        
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Get a URLSession object
        
        let session = URLSession.shared
        
        //get a data task from the URLsession object
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //check if there any errors
            
            if error != nil || data == nil {
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                           decoder.dateDecodingStrategy = .iso8601
                           
                let response = try decoder.decode(Response.self, from: data!)
        
                dump(response)
                
            }
            
            catch {
                
                
                
            }
            
            //parsing the data into video objects
            
           
        }
        
        //kick off the task
        
        dataTask.resume()
        
        
    }
    
}
