//
//  imageViewController.swift
//  tableView
//
//  Created by Yagmur Konuksoy on 22.01.2022.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    var selectedName = String() // dizinin içinin string olacağını gösterir
    var selectedImage = UIImage()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageLabel.text = selectedName
        imageView.image = selectedImage
        
    }
    

    

}
