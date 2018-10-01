//
//  FavoritesTableViewController.swift
//  Poetry
//
//  Created by Mac on 19.02.17.
//  Copyright © 2017 FokinMC. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {
    
//
//    var favoritesArrayLoveHeader = [String]()
//    var favoritesArrayJealousyHeader = [String]()
//    var favoritesArrayMotivationHeader = [String]()
//    var favoritesArraySpiritualityHeader = [String]()
//    var favoritesArrayLiveHeader = [String]()
//    var favoritesArrayNatureHeader = [String]()
//    var favoritesArrayKidsHeader = [String]()
//    //суммарный массив Заголовков
//    var favoritesArrayAllHeader = [String]()
//
//
//
//    var favoritesArrayLove = [String]()
//    var favoritesArrayJealousy = [String]()
//    var favoritesArrayMotivation = [String]()
//    var favoritesArraySpirituality = [String]()
//    var favoritesArrayLive = [String]()
//    var favoritesArrayNature = [String]()
//    var favoritesArrayKids = [String]()
//    //суммарный массив текстов
//    var favoritesArrayAll = [String]()
    
    
    //массив для исключения повторений заголовков из-за переиспользования ячейки 300 бы поменять на число строк в массиве
    //    var doNotRepeat = [Bool](repeatElement(false, count: 152)) // потом проверить количество
//    var favoritesArrayUser = [String]()
    
    //получили доступ к хранилищу и
    //    let userDefaults = UserDefaults.standard
    
    //    override func reloadInputViews() {
    //        reloadInputViews()
    //
    //    }
    
    //--------------------------------reload table
    var items: [Int] = []
    var newItems = [Int].self
    override func viewDidLoad() {
        super.viewDidLoad()
        items = newItems.init()
        
        refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    func refresh() {
        items = []
        items = newItems.init()
        tableView.reloadData()
        refreshControl!.endRefreshing()
    }
    //--------------------------------reload table end <<
    
    
    
    
    //массив заголовков
    /*
     func readFromFile() { //let pathLove - это путь
     if let loveHeader = Bundle.main.path(forResource: "loveHeader", ofType: "txt") {
     if let textLoveHeader = try? String(contentsOfFile: loveHeader) {
     favoritesArrayLoveHeader = textLoveHeader.components(separatedBy: "\n")
     }
     }
     if let jealousyHeader = Bundle.main.path(forResource: "jealousyHeader", ofType: "txt") {
     if let textJealousyHeader = try? String(contentsOfFile: jealousyHeader) {
     favoritesArrayJealousyHeader = textJealousyHeader.components(separatedBy: "\n")
     }
     }
     if let motivationHeader = Bundle.main.path(forResource: "motivationHeader", ofType: "txt") {
     if let textMotivationHeader = try? String(contentsOfFile: motivationHeader) {
     favoritesArrayMotivationHeader = textMotivationHeader.components(separatedBy: "\n")
     }
     }
     if let spiritualityHeader = Bundle.main.path(forResource: "spiritualityHeader", ofType: "txt") {
     if let textSpiritualityHeader = try? String(contentsOfFile: spiritualityHeader) {
     favoritesArraySpiritualityHeader = textSpiritualityHeader.components(separatedBy: "\n")
     }
     }
     if let liveHeader = Bundle.main.path(forResource: "liveHeader", ofType: "txt") {
     if let textLiveHeader = try? String(contentsOfFile: liveHeader) {
     favoritesArrayLiveHeader = textLiveHeader.components(separatedBy: "\n")
     }
     }
     if let natureHeader = Bundle.main.path(forResource: "natureHeader", ofType: "txt") {
     if let textNatureHeader = try? String(contentsOfFile: natureHeader) {
     favoritesArrayNatureHeader = textNatureHeader.components(separatedBy: "\n")
     }
     }
     if let kidsHeader = Bundle.main.path(forResource: "kidsHeader", ofType: "txt") {
     if let textKidsHeader = try? String(contentsOfFile: kidsHeader) {
     favoritesArrayKidsHeader = textKidsHeader.components(separatedBy: "\n")
     }
     }
     
     
     //суммарный массив заголовков
     favoritesArrayAllHeader = favoritesArrayLoveHeader + favoritesArrayJealousyHeader + favoritesArrayMotivationHeader + favoritesArraySpiritualityHeader + favoritesArrayLiveHeader + favoritesArrayNatureHeader + favoritesArrayKidsHeader
     //        print(favoritesArrayLoveHeader)
     
     
     
     
     //массив текстов (подготовка для передачи на OneFavoritesView)
     //    func readFromFile() { //let pathLove - это путь
     if let love = Bundle.main.path(forResource: "love", ofType: "txt") {
     if let textLove = try? String(contentsOfFile: love) {
     favoritesArrayLove = textLove.components(separatedBy: "==")
     }
     }
     if let jealousy = Bundle.main.path(forResource: "jealousy", ofType: "txt") {
     if let textJealousy = try? String(contentsOfFile: jealousy) {
     favoritesArrayJealousy = textJealousy.components(separatedBy: "==")
     }
     }
     if let motivation = Bundle.main.path(forResource: "motivation", ofType: "txt") {
     if let textMotivation = try? String(contentsOfFile: motivation) {
     favoritesArrayMotivation = textMotivation.components(separatedBy: "==")
     }
     }
     if let spirituality = Bundle.main.path(forResource: "spirituality", ofType: "txt") {
     if let textSpirituality = try? String(contentsOfFile: spirituality) {
     favoritesArraySpirituality = textSpirituality.components(separatedBy: "==")
     }
     }
     if let live = Bundle.main.path(forResource: "live", ofType: "txt") {
     if let textLive = try? String(contentsOfFile: live) {
     favoritesArrayLive = textLive.components(separatedBy: "==")
     }
     }
     if let nature = Bundle.main.path(forResource: "nature", ofType: "txt") {
     if let textNature = try? String(contentsOfFile: nature) {
     favoritesArrayNature = textNature.components(separatedBy: "==")
     }
     }
     if let kids = Bundle.main.path(forResource: "kids", ofType: "txt") {
     if let textKids = try? String(contentsOfFile: kids) {
     favoritesArrayKids = textKids.components(separatedBy: "==")
     }
     }
     
     
     //суммарный массив текстов
     favoritesArrayAll = favoritesArrayLove + favoritesArrayJealousy + favoritesArrayMotivation + favoritesArraySpirituality + favoritesArrayLive + favoritesArrayNature + favoritesArrayKids
     
     
     
     }
     */
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let userDefaults = UserDefaults.standard
        let userArray = userDefaults.stringArray(forKey: "userArray")
        reloadInputViews()
        if userArray != nil {
            return userArray!.count
        } else {
            return 1
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FavoritesTableViewCell
        
        let userDefaults = UserDefaults.standard
        let userArray = userDefaults.stringArray(forKey: "userArray")
        
        if userArray != nil {
            cell.favoritesLabel.text = userArray![indexPath.row]
        } else {
            cell.favoritesLabel.text = "Почитайте об этом разделе:"
        }
        
        return cell
    }
    
    // начало функции
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //кусок для получения доступа к данным
        let userDefaults = UserDefaults.standard
        let userArrayText = userDefaults.stringArray(forKey: "userArrayText")
        //-----------------------------------------------------------------------------
        
        
        let share = UITableViewRowAction(style: .default, title: "Поделиться") { (action, indexPath) in
            //текст шаринга
            let defaultText = userArrayText![indexPath.row] + "\nДругие стихи автора в приложениях: \n\nДля iPhone http://itunes.apple.com/app/id1211561140 \n\nДля Android https://play.google.com/store/apps/details?id=com.bubna.fl_izumina"
            //попытка прикрепить изображение, предварительно пересоздав его
            //jpg            if let image = UIImage(named: self.verse[indexPath.row].image)
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        
//        let userDefaults = UserDefaults.standard

        let favoritesTitle = "Из избранного"
        
        let favorites = UITableViewRowAction(style: .default, title: favoritesTitle) { (action, indexPath) in
            //тут должен быть метод добавления в избранное
            let cell = tableView.cellForRow(at: indexPath)
            //          self.favoritesArray[indexPath.row] = true
            //          cell?.accessoryType = .checkmark //удалили 2 строки для снятия checkMark
            
//----------------------------------------------------------------------------------------------------------
       /*
            self.favoritesArray[indexPath.row] = nameKeyBool // присваивает индексу массива текущее значение из userDefaults (позволяет убирать из избранного с первого раза)
            
            
            self.favoritesArray[indexPath.row] = !self.favoritesArray[indexPath.row]
            //позволяет менять значение туда-сюда
            self.favorites = self.favoritesArray[indexPath.row] //bool приcвоили favorites true or false из массива от indexPath
            
            //получили доступ к хранилищу на девайсе
            let userDefaults = UserDefaults.standard
            //дальше запись данных
            let nameKey = self.headerArray[indexPath.row] //передали имя конкретного заголовка в nameKey
            let nameText = self.textArray[indexPath.row]  //передали имя конкретного текста в nameText
            
            
            
            userDefaults.set(self.favorites, forKey: nameKey) // передали true or false в nameKey
            userDefaults.synchronize()
            

            
            //ставит галочку
            let nameKeyBool = userDefaults.bool(forKey: self.headerArray[indexPath.row])
//----------------------------------------------------------------------------------------------------------
*/
            //для добавления заголовков и тектов
            var timeArray = [String]()
            var timeArrayText = [String]()
            
//            var favoritesArray = [Bool](repeatElement(false, count: 152))   //массив для того чтоб не повторялась галочка(152 от фонаря)

            let userArray = userDefaults.stringArray(forKey: "userArray")
            let userArrayText = userDefaults.stringArray(forKey: "userArrayText")
            let nameKey = userArray![indexPath.row] //передали имя конкретного заголовка в nameKey
            let nameText = userArrayText![indexPath.row]  //передали имя конкретного текста в nameText
//            let nameKeyBool = false
            let nameKeyBool = userDefaults.bool(forKey: userArray![indexPath.row])
            print(nameKeyBool)
            
            
            if nameKeyBool == false {
//                cell?.accessoryType = .checkmark
                //-----------
                timeArray.append(nameKey)
                timeArrayText.append(nameText)
                if userArray != nil {
                    timeArray = timeArray + userArray!
                    timeArrayText = timeArrayText + userArrayText!
                }
                userDefaults.set(timeArray, forKey: "userArray")
                userDefaults.set(timeArrayText, forKey: "userArrayText")
                userDefaults.synchronize()
                
            } else {
//                cell?.accessoryType = .none
                //-----------
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
                //тут вылет
                userDefaults.set(!nameKeyBool, forKey: userArray![indexPath.row])
            }
            tableView.reloadData()
        }

        
        
        
        
        share.backgroundColor = #colorLiteral(red: 0.8454377651, green: 0.7251623273, blue: 1, alpha: 1)
        favorites.backgroundColor = #colorLiteral(red: 1, green: 0.61024791, blue: 0.7649310231, alpha: 1)

        return [share, favorites]

        
    } //Конец функции
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //        self.doNotRepeat[indexPath.row] = true // для исколючения повторений ячейки
        
    }
    


    
    //подготовка передачи данныех на OneFavoritesView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFavoritesSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {//определили индекс нажатой ячейки
                let dvc = segue.destination as! OneFavoritesViewController
                
                let userDefaults = UserDefaults.standard
                let userArray = userDefaults.stringArray(forKey: "userArray")
                let userArrayText = userDefaults.stringArray(forKey: "userArrayText")
                
                if userArray != nil {
                    
                    dvc.favoritesChapter = userArray?[indexPath.row] //тут передача конечного заголовка на следующий экран
                    dvc.favoritesText = userArrayText?[indexPath.row] //тут передача конечного текста на следующий экран ERROR
                    
                } else {
                    dvc.favoritesChapter = "Об избранном" //тут передача конечного текста на следующий экран
                    dvc.favoritesText = "Читая каждое произведение в основном разделе вы можете добавить или удалить его из раздела Избранное, нажав на кнопку с изображением трех вертикальных точек, или смахнув влево строку с заголовком в оглавлении.\n\nДля обновления Избранного потяните экран оглавления вниз." //тут передача конечного текста на следующий экран
                }
            }
        }
    }
}
