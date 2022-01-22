//
//  ViewController.swift
//  tableView
//
//  Created by Yagmur Konuksoy on 22.01.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
  

    @IBOutlet weak var TableView: UITableView!
    var landmarkName = [String]() // dizinin içinin string olacağını gösterir
    var landmarkImages = [UIImage]()
    var chosenLandmark = String()
    var chosenLandmarkImage = UIImage()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // ViewController ile delegate ve satasource'u eşitleyen yapı. Bu olmadan aşağıdaki fonksiyonları kullanamayız.
        TableView.delegate = self
        TableView.dataSource = self
        

        landmarkName.append("çilek")
        landmarkName.append("kivi")
        landmarkName.append("muz")
        
        landmarkImages.append(UIImage(named: "cilek")!)
        landmarkImages.append(UIImage(named: "kivi")!)
        landmarkImages.append(UIImage(named: "muz")!)
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkName.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)

            
        }
    }
    
    
    // kaç tane sıramız olacağını gösteren yapı
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkName.count
    }
    // sıraların içinde ne olduğunu gösteren yapı
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = UITableViewCell()
        cell.textLabel?.text = String(landmarkName[indexPath.row])
        //cell.imageView?.image = landmarkImages[indexPath.row]
        return cell
        
    }
    // seçilen cell in indexini segue etmek için değişken oluşturmak
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmark = landmarkName[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    //segue işlemi için imagevc ye bağlayacak değişken taşıyıcı atamak
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedName = chosenLandmark // böylelikle imageVC içindeki herşeyi kullanabiliyoruz
            destinationVC.selectedImage = chosenLandmarkImage
        }
            
    }
    
    
    // SEGUE oluşturmak;
    // + dan view controller eklenecek, ilk VC den CTRL ile ikinci VC ye sürüklenecek,sağ tıklancak, show denilecek
    // geri dönülmesi isteniyor ise ilk VC den editor->embed->navigation eklenecek
    
    //SEGUE + yeni VW tanıtımı
    // çalışma dosyasına sağ tıkla, new file, coco touch, UI VC kurduğundan emin olarak yeni VC kur.
    //sağda identifer kısmından yeni oluşan VC class'ını seç
    // segue çizgisine tıkla ve yine identifier tanımla - isim ver.
    


}

