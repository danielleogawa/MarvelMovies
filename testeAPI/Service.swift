//
//  Service.swift
//  testeAPI
//
//  Created by Danielle Nozaki Ogawa on 2022/06/21.
//

import Foundation


class Service {
    
     var filmesFromData: [Filme] = []
     var quantidadeDeFilmes: Int = 0
    
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    func loadFilmes(completion: @escaping ([Filme])-> Void){
        let url = URL(string: "https://mcuapi.herokuapp.com/api/v1/movies?page=1&limit=1000&columns=title%2Crelease_date%2Cphase%2Cpost_credit_scenes%2Ccover_url%2Csaga%2Cdirected_by%2Coverview&order=chronology%2CDESC")!
        let task = session.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            
            do {
                let filmes = try self.decoder.decode(Data.self, from: data)
                DispatchQueue.main.async {
                    print("api: \(filmes.data.count)")
                    self.quantidadeDeFilmes = filmes.data.count
                    self.filmesFromData = filmes.data
                    completion(self.filmesFromData)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
