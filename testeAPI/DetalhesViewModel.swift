//
//  DetalhesViewModel.swift
//  testeAPI
//
//  Created by Danielle Nozaki Ogawa on 2022/06/20.
//

import Foundation
import UIKit
protocol DetalhesViewModelDelegate {
    func configuraImagem(imagem: UIImage)
}

class DetalhesViewModel {
    
    var delegate: DetalhesViewModelDelegate?
    private let filme: Filme
    
    init(filme: Filme){
        self.filme = filme
    }
    
    func getImage(){
        guard let imagem = filme.cover_url else { return }
        guard let url = URL(string: imagem) else { return }
        
        let getDataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return  }
            DispatchQueue.main.async {
                print(data)
                let cover = UIImage(data: data)
                guard let cover = cover else { return }
                self.delegate?.configuraImagem(imagem: cover)
            }
        }
        getDataTask.resume()
    }
    
    func getPoster() -> String {
        guard let poster = filme.cover_url else { return "" }
        return poster
    }
    
    func getTitulo() -> String {
        return filme.title
    }
    
    func getLancamento() -> String {
        guard let lacamento = filme.release_date else { return "" }
        return lacamento
    }
    
    func getDirecao() -> String {
        guard let direcao = filme.directed_by else { return "" }
        return direcao
    }
    
    func getDescricao() -> String {
        guard let descricao = filme.overview else { return "" }
        return descricao
    }
    
}
