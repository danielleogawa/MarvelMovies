//
//  DetalhesViewController.swift
//  testeAPI
//
//  Created by Danielle Nozaki Ogawa on 2022/06/20.
//

import UIKit

class DetalhesViewController: UIViewController {
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var lancamentoLabel: UILabel!
    @IBOutlet weak var direcaoLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    
    var viewModel: DetalhesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.getImage()
        
        viewModel?.delegate = self
        tituloLabel.text = viewModel?.getTitulo()
        lancamentoLabel.text = viewModel?.getLancamento()
        direcaoLabel.text = viewModel?.getDirecao()
        descricaoLabel.text = viewModel?.getDescricao()
    }
    
    
}
extension DetalhesViewController: DetalhesViewModelDelegate {
    func configuraImagem(imagem: UIImage) {
        coverImage.image = imagem
    }
    
    
}
