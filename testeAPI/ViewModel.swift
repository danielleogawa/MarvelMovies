//
//  ViewModel.swift
//  testeAPI
//
//  Created by Danielle Nozaki Ogawa on 2022/06/19.
//

import Foundation


class ViewModel {

    var service = Service()
    var filmesFromData: [Filme] = []
    
    
    func getQuantidadeDeFilmes() -> Int{
        return filmesFromData.count
    }
    
    func getFilme(posicao: Int) -> Filme {
        return filmesFromData[posicao]
    }
    
    func getDetalhesFilme(posicao: Int?) -> DetalhesViewModel? {
        guard let posicao = posicao else {
            return nil
        }
        
        let filme = filmesFromData[posicao]
        let viewModel = DetalhesViewModel(filme: filme)
        
        return viewModel
    }
    
    func getFilmesApi(completion: @escaping()->Void){
        service.loadFilmes { filmes in
            self.filmesFromData = filmes
            completion()
        }
    }
}
