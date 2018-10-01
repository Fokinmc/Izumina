//// For App Store
//  OnePoemViewController.swift
//  Poetry
//
//  Created by MacBook on 10.02.17.
//  Copyright © 2017 FokinMC. All rights reserved.
//

import UIKit

class OnePoemViewController: UIViewController {
    @IBOutlet weak var poemView: UITextView!
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var allertButtonLabel: UIButton!
    @IBAction func allertButtonAction(_ sender: UIButton) {
        if sender == allertButtonLabel {
            showAllert()
        }
    }
    
    var text: String!
    var header: String!
    
    //---------начало инструмента позволяющего просмотр текста не с середины а сверху
    override func viewWillAppear(_ animated: Bool) {
        poemView.isScrollEnabled = false
    }
    //
    override func viewDidAppear(_ animated: Bool) {
        poemView.isScrollEnabled = true
    }
    //---------конец инструмента позволяющего просмотр текста не с середины а сверху
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        poemView.text = text
        poemView.isEditable = false
        
        headerLabel.text = header
        headerLabel.backgroundColor = #colorLiteral(red: 0.9830823541, green: 0.8759781718, blue: 0.9753966928, alpha: 1)
        headerLabel.layer.opacity = 0.8
        
        headerLabel.layer.shadowColor = UIColor.white.cgColor
        headerLabel.layer.shadowOffset = CGSize(width: 3, height: -3)
        headerLabel.layer.shadowRadius = 5
        headerLabel.layer.shadowOpacity = 1
        
        allertButtonLabel.backgroundColor = #colorLiteral(red: 0.9830823541, green: 0.8759781718, blue: 0.9753966928, alpha: 1)
    }
    
    func showAllert() {
        let ac = UIAlertController(title: "Вы можете:", message: "Сделать репост текста, или управлять Избранным", preferredStyle: .actionSheet)
        
        let userDefaults = UserDefaults.standard
        let nameKey = self.header
        let nameText = self.text
        print(nameText!)
        
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
            //блок управления избранным -----------------------------------------------------------

            userDefaults.set(!nameKeyBool, forKey: nameKey!)
            var timeArray = [String]()
            var timeArrayText = [String]()
            //дальше запись данных заголовков
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
                // for chapter
                for (index, value) in (userArray?.enumerated())! {
                    if nameKey == value {
                        let indexForDelete = index
                        timeArray.remove(at: indexForDelete)
                        userDefaults.set(timeArray, forKey: "userArray")
                        userDefaults.synchronize()
                        print("индекс для удаления = \(indexForDelete)")
                    }
                }
                // for text
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
        //блок управления избранным -----------------------------------------------------------

        
        let  shared = UIAlertAction(title: "Поделиться", style: .default) { (action) in
            let defaultText = self.text + "\nДругие стихи автора в приложениях: \n\nДля iPhone http://itunes.apple.com/app/id1211561140 \n\nДля Android https://play.google.com/store/apps/details?id=com.bubna.fl_izumina"
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
