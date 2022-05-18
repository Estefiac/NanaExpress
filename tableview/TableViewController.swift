//
//  TableViewController.swift
//  tableview
//
//  Created by alumnos on 04/04/22.
//

import UIKit

class TableViewController: UITableViewController, XMLParserDelegate {
    
    @IBOutlet var tableview: UITableView!
    
    var listaEmpleadas : [Empleada] = [];
    
    var parser : XMLParser = XMLParser();
    var empleada : Empleada?;
    var txtNodo : NSMutableString?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL : URL = URL(string: "https://dispositivos.s3.amazonaws.com/datos.xml")!;
        
        parser = XMLParser(contentsOf: myURL)!;
        
        parser.delegate = self;
        parser.parse();
        
        tableview.delegate = self;
        
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        txtNodo = NSMutableString();
        
        if elementName == "empleada" {
            empleada = Empleada();
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        txtNodo?.append(string);
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        switch elementName {
        case "nombre":
            empleada?.nombre = txtNodo! as String;
            break;
        case "edad":
            empleada?.edad = txtNodo! as String;
            break;
        case "imagen":
            empleada?.foto = txtNodo! as String;
            break;
        case "horario":
            empleada?.horario = txtNodo! as String;
            break;
        case "telefono":
            empleada?.telefono = txtNodo! as String;
            break;
        case "empleada":
            listaEmpleadas.append(empleada!);
            break;
        default:
            break;
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaEmpleadas.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let empleada: Empleada = listaEmpleadas[indexPath.row];
            let cell = tableView.dequeueReusableCell(withIdentifier: "Despcelda03", for: indexPath) as! TableViewCell;
            let urlImagen : URL = URL(string: empleada.foto!)!;
            let data : NSData = NSData(contentsOf : urlImagen)!;
            cell.imagen.image = UIImage(data: data as Data);
            cell.edad.text = empleada.edad;
            cell.nombre.text = empleada.nombre;
            cell.horario.text = empleada.horario;
            
            return cell;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DataViewController {
            destination.nanny = listaEmpleadas[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
}
