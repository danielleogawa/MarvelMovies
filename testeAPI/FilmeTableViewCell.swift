//
//  FilmeTableViewCell.swift
//  testeAPI
//
//  Created by Danielle Nozaki Ogawa on 2022/06/19.
//

import UIKit

class FilmeTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configuraCell(filme: Filme){
        tituloLabel.text = filme.title
    }

}
