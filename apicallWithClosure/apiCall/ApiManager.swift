//
//  ApiManager.swift
//  apicallWithClosure
//
//  Created by Mac on 11/01/22.
//

import Foundation

class ApiManager {
    
    typealias  Datapassing = ([userInfo]) -> ()
    
    func getData(completionHandler: @escaping Datapassing) {
        let url = "https://jsonplaceholder.typicode.com/users"
        guard let urlString = URL(string: url) else { return }
        
        let session = URLSession(configuration:.default)
        var request = URLRequest(url: urlString)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let checkError = error  {
                print(checkError.localizedDescription)
            }
            
            let response = response as! HTTPURLResponse
            print(response.statusCode)
            
            guard let  jsonData = data else { return }
            
            let userDetails = self.parseDara(serverData: jsonData)
            
            completionHandler(userDetails)
        }
        task.resume()
    }
    func parseDara(serverData: Data) -> [userInfo] {
         
        var userDetails = [userInfo]()
        do {
        let userData = try JSONDecoder().decode([userInfo].self, from: serverData)
            
            userDetails.append(contentsOf: userData)
        }
        catch {
            print(error.localizedDescription)
        }
        return userDetails
    }
}
