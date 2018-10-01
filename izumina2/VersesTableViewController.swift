//// For App Store
//  VersesTableViewController.swift
//  Poetry
//
//  Created by MacBook on 02.02.17.
//  Copyright © 2017 FokinMC. All rights reserved.
//

import UIKit

class VersesTableViewController: UITableViewController {
    
    var verses: [Verse] = [
        Verse(chapter: "О любви", description: "Я — женщина твоя, а ты — мужчина мой.", image: "love.jpg"),
        Verse(chapter: "О грустном", description: "Так грустно себя ощущать не любимой", image: "jealousy.jpg"),
        Verse(chapter: "О мотивации", description: "Всегда есть выход", image: "motivation.jpg"),
        Verse(chapter: "Непознанное", description: "Я подключаюсь к Богу напрямик", image: "spirituality.jpg"),
        Verse(chapter: "О жизни", description: "Нам кризис дается чтоб крылья себе отрастить.", image: "live.jpg"),
        Verse(chapter: "О мире", description: "Там живет Настроение счастья ", image: "nature.jpg"),
        Verse(chapter: "О близких", description: "Волшебные мгновенья, ты, память, сбереги", image: "kids.jpg"),
        //        Verse(chapter: "Об авторе", description: "Masha Izumna", image: "Masha.jpg")
    ]
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //метод проверяющий смотрели ли инструкцию
        let userDefaults = UserDefaults.standard
        let isWatchedInstruction = userDefaults.bool(forKey: "isWatchedInstruction")
        guard !isWatchedInstruction else { return }

        if let PageViewController = storyboard?.instantiateViewController(withIdentifier: "pageViewController") as? PageViewController {
            present(PageViewController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //-------
        return verses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! VersesTableViewCell
        
        cell.thumbnailImageView.image = UIImage(named: verses[indexPath.row].image)
        cell.thumbnailImageView.layer.cornerRadius = 32.5
        cell.thumbnailImageView.clipsToBounds = true
        cell.сhapterLabel.text = verses[indexPath.row].chapter
        cell.descriptionLabel.text = verses[indexPath.row].description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let share = UITableViewRowAction(style: .default, title: "Поделиться") { (action, indexPath) in
            let defaultText = "Рекомендую почитать стихи из раздела "  + self.verses[indexPath.row].chapter + "\nАвтора Маша Изюмина в приложениях: \n\nДля iPhone http://itunes.apple.com/app/id1211561140 \n\nДля Android https://play.google.com/store/apps/details?id=com.bubna.fl_izumina"
            if let image = UIImage(named: self.verses[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultText, image], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        }
        
        share.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return [share]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! PoemsViewController
                dvc.verse = self.verses[indexPath.row]
            }
        }
    }
}
