//
//  Testing.swift
//  URl
//
//  Created by Nathaniel Whittington on 3/23/22.
//

import Foundation

struct Album : Decodable {
    let id : Int?
    let title: String?
    let url : String?
    let thumbnailUrl : String?
}


class APIHandler {
    
    static let shared = APIHandler()
    private init () {}
    typealias CompletionHandler = ((Data?,URLResponse?,Error?)->Void)?
    
    
    func get(urlString:String, completion:CompletionHandler){
        
        guard let Url = URL(string: urlString) else {return}
        let urlSession = URLSession.shared
           
            urlSession.dataTask(with: Url) {[weak self] data, response, error in
                guard let _ = self else {return}
               completion?(data,response,error)
            }.resume()
    }
    
}
    

    
    class ViewModel {
        var array : [Album]?
        typealias GetMovie = (([Album])->Void)
        
        func getData(completion:@escaping GetMovie){
        
            APIHandler.shared.get(urlString: "https://jsonplaceholder.typicode.com/photos") { [weak self] data, response, error in
                guard let data = data else {return}
                guard let _ = self else {return}
                if error == nil{
                    
                    do{
                        let arr = try JSONDecoder().decode([Album].self, from: data)
                        print(arr)
                        self?.set(arr: arr)
                        completion(arr)
                    }catch let error{
                        print(error)
                    }
                    
                }
            }
            
        }
        
       func set(arr:[Album]){
            self.array = arr
        }
    }


