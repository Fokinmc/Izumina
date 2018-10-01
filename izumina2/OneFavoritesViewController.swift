//
//  OneFavoritesViewController.swift
//  Poetry
//
//  Created by Mac on 20.02.17.
//  Copyright © 2017 FokinMC. All rights reserved.
//

import UIKit

class OneFavoritesViewController: UIViewController {
    
    @IBOutlet weak var favoritesChapterLabel: UILabel!
    @IBOutlet weak var favoritesTextLabel: UITextView!
    
    @IBOutlet weak var allertButtonLabel: UIButton!
    
    @IBAction func allertButtonAction(_ sender: UIButton) {
        if sender == allertButtonLabel {
            showAllert()
    }
    }
    
    var favoritesText: String!
    var favoritesChapter: String!
    
    //---------начало инструмента позволяющего просмотр текста не с середины а сверху
    override func viewWillAppear(_ animated: Bool) {
        favoritesTextLabel.isScrollEnabled = false
    }
    //
    override func viewDidAppear(_ animated: Bool) {
        favoritesTextLabel.isScrollEnabled = true
    }
    //---------конец инструмента позволяющего просмотр текста не с середины а сверху
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoritesTextLabel.text = favoritesText
        favoritesChapterLabel.text = favoritesChapter
    }
    
    
    func showAllert() {
        
        
        
        
        let ac = UIAlertController(title: "Вы можете:", message: "Сделать репост текста, или управлять Избранным", preferredStyle: .actionSheet)
        
        let userDefaults = UserDefaults.standard
        let nameKey = self.favoritesChapter
        let nameText = self.favoritesText
        
        let nameKeyBool = userDefaults.bool(forKey: nameKey!)
        let userArray = userDefaults.stringArray(forKey: "userArray")
        let userArrayText = userDefaults.stringArray(forKey: "userArrayText")
        
        
        
        var textAlert = ""
        if nameKeyBool == false {
            textAlert = "В избранное"
        } else {
            textAlert = "Из избраного"
        }
        
        
        
        let favorites = UIAlertAction(title: textAlert, style: .default) { (action) in
            userDefaults.set(!nameKeyBool, forKey: nameKey!)
            var timeArray = [String]()
            var timeArrayText = [String]()
            
            if nameKeyBool == false {
                timeArray.append(nameKey!)
                timeArrayText.append(nameText!)
                if userArray != nil {
                    timeArray = timeArray + userArray!
                    timeArrayText = timeArrayText + userArrayText!
                }
                userDefaults.set(timeArray, forKey: "userArray")
                userDefaults.set(timeArrayText, forKey: "userArrayText")
                userDefaults.synchronize()
            } else {
                timeArray = userArray!
                timeArrayText = userArrayText!

                for (index, value) in (userArray?.enumerated())! {
                    if nameKey == value {
                        let indexForDelete = index
                        timeArray.remove(at: indexForDelete)
                        userDefaults.set(timeArray, forKey: "userArray")
                        userDefaults.synchronize()
                        print("индекс для удаления = \(indexForDelete)")
                    }
                }

                for (index, value) in (userArrayText?.enumerated())! {
                    if nameText == value {
                        let indexForDelete = index
                        timeArrayText.remove(at: indexForDelete)
                        userDefaults.set(timeArrayText, forKey: "userArrayText")
                        userDefaults.synchronize()
                        print("индекс для удаления = \(indexForDelete)")
                    }
                }
                
            }
        }

        
        
        let  shared = UIAlertAction(title: "Поделиться", style: .default) { (action) in
            let defaultText = self.favoritesText + "\nДругие стихи автора в приложениях: \n\nДля iPhone http://itunes.apple.com/app/id1211561140 \n\nДля Android https://play.google.com/store/apps/details?id=com.bubna.fl_izumina"
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil) 
            
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        ac.addAction(favorites)
        ac.addAction(shared)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
    
}
