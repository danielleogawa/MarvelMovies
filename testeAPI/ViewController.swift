//
//  ViewController.swift
//  testeAPI
//
//  Created by Danielle Nozaki Ogawa on 2022/06/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var listaTableView: UITableView!
    
    let viewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        listaTableView.dataSource = self
        listaTableView.delegate = self
        viewModel.getFilmesApi {
            self.listaTableView.reloadData()
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detalhesViewController = segue.destination as? DetalhesViewController {
            let posicao = sender as? Int
            detalhesViewController.viewModel = viewModel.getDetalhesFilme(posicao: posicao)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getQuantidadeDeFilmes()

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FilmeTableViewCell {
            let filme = viewModel.getFilme(posicao: indexPath.row)
            cell.configuraCell(filme: filme)
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detalhes", sender: indexPath.row)
    }
}




