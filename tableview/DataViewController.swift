//
//  DataViewController.swift
//  tableview
//
//  Created by Diego Galván on 13/05/22.
//

import UIKit

class DataViewController: UIViewController {
    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var telefono: UILabel!
    @IBOutlet weak var horario: UILabel!
    @IBOutlet weak var edad: UILabel!
    
    var nanny: Empleada?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlImagen : URL = URL(string: nanny!.foto!)!;
        let data : NSData = NSData(contentsOf : urlImagen)!;
        
        imagen.image = UIImage(data: data as Data);
        nombre.text = nanny?.nombre;
        edad.text = nanny?.edad;
        telefono.text = nanny?.telefono;
        horario.text = nanny?.horario;

        // Do any additional setup after loading the view.
    }
    
    @IBAction func contratar() {
        showAlert();
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Contrato Exitoso", message: "¡Tu niñera ha sido informada!", preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "Listo", style: .cancel, handler: { action in
        }))
        present(alert, animated: true, completion: nil);
        
        
    }
    
    
}
