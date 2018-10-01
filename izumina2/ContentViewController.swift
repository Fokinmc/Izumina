//// For App Store
//  ContentViewController.swift
//  Poetry
//
//  Created by Mac on 27.02.17.
//  Copyright © 2017 FokinMC. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var hederLabel: UILabel!
    @IBOutlet weak var textOfPageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageButton: UIButton!
    @IBOutlet weak var socialLabel: UILabel!
    
    var header = ""
    var textOfPage = ""
    var imageFile = ""
    var social = ""
    var index = 0
    
    @IBAction func pageButtonPressed(_ sender: UIButton) {
        switch index {
        case 0:
            let pageVC = parent as! PageViewController
            pageVC.nextVC(atIndex: index)
        case 1:
            let pageVC = parent as! PageViewController
            pageVC.nextVC(atIndex: index)
        case 2:
            let pageVC = parent as! PageViewController
            pageVC.nextVC(atIndex: index)
        case 3:
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "isWatchedInstruction")
            userDefaults.synchronize()
            
            dismiss(animated: true, completion: nil)
        default: break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageButton.layer.cornerRadius = 10
        pageButton.clipsToBounds = true
        pageButton.layer.borderWidth = 2
        pageButton.layer.borderColor = (#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)).cgColor
        pageButton.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        
        switch index {
        case 0: pageButton.setTitle("Дальше", for: .normal)
        case 1: pageButton.setTitle("Дальше", for: .normal)
        case 2: pageButton.setTitle("Дальше", for: .normal)
        case 3: pageButton.setTitle("Начать", for: .normal)
            
        default:
            break
        }
        
        hederLabel.text = header
        textOfPageLabel.text = textOfPage
        socialLabel.text = social
        imageView.image = UIImage(named: imageFile)
        pageControl.numberOfPages = 4
        pageControl.currentPage = index
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
