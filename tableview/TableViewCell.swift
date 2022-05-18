//
//  TableViewCell.swift
//  tableview
//
//  Created by Diego Galván on 25/04/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var edad: UILabel!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var horario: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
