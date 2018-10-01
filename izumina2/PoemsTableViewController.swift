//// For App Store
//  PoemsViewController.swift
//  Poetry
//
//  Created by MacBook on 07.02.17.
//  Copyright © 2017 FokinMC. All rights reserved.
//

import UIKit
import CoreData

class PoemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    //для favorites
    var favoritesArrayLoveHeader = [String]()
    var favoritesArrayJealousyHeader = [String]()
    var favoritesArrayMotivationHeader = [String]()
    var favoritesArraySpiritualityHeader = [String]()
    var favoritesArrayLiveHeader = [String]()
    var favoritesArrayNatureHeader = [String]()
    var favoritesArrayKidsHeader = [String]()
    //суммарный массив Заголовков
    var favoritesArrayAllHeader = [String]()
    var favoritesArrayUser = [String]()
    //-------для favorites end---------------------------------------------
    
    
    
    //свойство для получения данных из  coreData
    //    var fetchResultController: NSFetchedResultsController<Poetry>! //создание для фильтра
    
    var imageName = ""
    var chapterName = ""  //отдельные свойства нужны были для старого массива
    var descriptionName = ""
    var verse: Verse?
    
    //переменная для текста
    var textArray = [String]()
    var headerArray = [String]()
    //    let favoritesCount = [String]().count
    //    favoritesArray - начальный массив булевых для избранного должен соответствовать по количеству стихам //100от фанаря
    //    var favoritesArray = [Bool](repeatElement(false, count: 100)) перенес внуть функции
    
    
    var isWatchesArray = [Bool](repeatElement(false, count: 152))   //массив для того чтоб не повторялось "просмотренно" (152 от фонаря)
    
    var favorites = false
    
    // спрячем NavagationС на экране стихов по свайпу
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: verse!.image)
        //777        chapterLabel.text = verse!.chapter
        //777        descriptionLabel.text = verse!.description
        
        //меняем цвет таблицы
        tableView.backgroundColor = #colorLiteral(red: 0.9830823541, green: 0.8759781718, blue: 0.9753966928, alpha: 1)
        tableView.separatorColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        //убрать лишние разделители
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        //вставляем заголовок в navigation Bar
        title = verse!.chapter
        
        readFromFile() //чтение из файла
        
        //------------------------------------------------------------------------------------------
        //--------------------------похоже код внутри не нужен--------------------------------------
        /*
         // для извлечения данных из coreData ---------
         let fitchRequest: NSFetchRequest<Poetry> = Poetry.fetchRequest()
         // дальше сортировка
         let sortDescriptor = NSSortDescriptor(key: "izb", ascending: true)
         fitchRequest.sortDescriptors = [sortDescriptor] //применение фильтра
         
         //продолжаем создавать контекст
         if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext {
         //инициализируем fetchResultController
         fetchResultController = NSFetchedResultsController(fetchRequest: fitchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
         fetchResultController.delegate = self  // эта строка мной добавлена с для обновления контента на экране
         
         do {
         try fetchResultController.performFetch()
         
         } catch let error as NSError {
         print("не удалось получить объекты из coreData \(error.localizedDescription)")
         }
         }*/
    }
    //------------------------------------------------------------------------------------------
    //------------------------------------------------------------------------------------------
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count //количество стихов в разделе по свич от массива стихов
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PoemsTableViewCell
        //        print(isWatchedKey)
        let selectedChapter = verse!.chapter
        //        cell.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        switch selectedChapter {
        case "О любви":
            if let path = Bundle.main.path(forResource: "loveHeader", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    headerArray = text.components(separatedBy: "\n")
                }
            }
            cell.poemLabel.text = headerArray[indexPath.row]
            //            cell.poemLabel.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        //            cell.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        case "О грустном":
            if let path = Bundle.main.path(forResource: "jealousyHeader", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    headerArray = text.components(separatedBy: "\n")
                }
            }
            cell.poemLabel.text = headerArray[indexPath.row]
        case "О мотивации":
            if let path = Bundle.main.path(forResource: "motivationHeader", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    headerArray = text.components(separatedBy: "\n")
                }
            }
            cell.poemLabel.text = headerArray[indexPath.row]
        case "Непознанное":
            if let path = Bundle.main.path(forResource: "spiritualityHeader", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    headerArray = text.components(separatedBy: "\n")
                }
            }
            cell.poemLabel.text = headerArray[indexPath.row]
        case "О жизни":
            if let path = Bundle.main.path(forResource: "liveHeader", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    headerArray = text.components(separatedBy: "\n")
                }
            }
            cell.poemLabel.text = headerArray[indexPath.row]
        case "О мире":
            if let path = Bundle.main.path(forResource: "natureHeader", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    headerArray = text.components(separatedBy: "\n")
                }
            }
            cell.poemLabel.text = headerArray[indexPath.row]
        case "О близких":
            if let path = Bundle.main.path(forResource: "kidsHeader", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    headerArray = text.components(separatedBy: "\n")
                }
            }
            cell.poemLabel.text = headerArray[indexPath.row]
        case "Об авторе":
            if let path = Bundle.main.path(forResource: "MashaHeader", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    headerArray = text.components(separatedBy: "\n")
                }
            }
            cell.poemLabel.text = headerArray[indexPath.row]
        default:
            break
        }
        //  эта штука очищает цвет и делает его прозрачным
        //cell.backgroundColor = UIColor.clear
        
        
        //--------------------------------------------------
        
        // -------------------------------------------------------эксперименты со смотрел или нет
        let userDefaults = UserDefaults.standard
        
        let isWatchesKeyBool = userDefaults.bool(forKey: self.headerArray[indexPath.row] + "isWatched")
        userDefaults.set(isWatchesKeyBool, forKey: self.headerArray[indexPath.row] + "isWatched")
        
        //        var isWatchesArray = [Bool](repeatElement(false, count: 152))   //массив для того чтоб не повторялось "просмотренно" (152 от фонаря)
        isWatchesArray[indexPath.row] = isWatchesKeyBool
        
        // ---------------------конец----------------------------------эксперименты со смотрел или нет
        
        
        let nameKeyBool = userDefaults.bool(forKey: self.headerArray[indexPath.row])

        
        if isWatchesKeyBool {
            cell.poemLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }   else {
            cell.poemLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
        }
        
        if nameKeyBool == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func readFromFile() {
        let selectedChapter = verse!.chapter
        //----------------получаем адрес файла в зависимости от ячейки для текста
        switch selectedChapter {
        case "О любви":
            if let path = Bundle.main.path(forResource: "love", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    textArray = text.components(separatedBy: "==")
                }
            }
        case "О грустном":
            if let path = Bundle.main.path(forResource: "jealousy", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    textArray = text.components(separatedBy: "==")
                }
            }
        case "О мотивации":
            if let path = Bundle.main.path(forResource: "motivation", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    textArray = text.components(separatedBy: "==")
                }
            }
        case "Непознанное":
            if let path = Bundle.main.path(forResource: "spirituality", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    textArray = text.components(separatedBy: "==")
                }
            }
        case "О жизни":
            if let path = Bundle.main.path(forResource: "live", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    textArray = text.components(separatedBy: "==")
                }
            }
        case "О мире":
            if let path = Bundle.main.path(forResource: "nature", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    textArray = text.components(separatedBy: "==")
                }
            }
        case "О близких":
            if let path = Bundle.main.path(forResource: "kids", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    textArray = text.components(separatedBy: "==")
                }
            }
        case "Об авторе":
            if let path = Bundle.main.path(forResource: "Masha", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    textArray = text.components(separatedBy: "==")
                }
            }
        default:
            break
        }
        // -------------------получаем адрес файла в зависимости от ячейки для заголовка
        switch selectedChapter {
        case "О любви":
            if let path = Bundle.main.path(forResource: "loveHeader", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    headerArray = text.components(separatedBy: "\n")
                }
            }
        case "О грустном":
            if let path = Bundle.main.path(forResource: "jealousyHeader", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    headerArray = text.components(separatedBy: "\n")
                }
            }
        case "О мотивации":
            if let path = Bundle.main.path(forResource: "motivationHeader", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    headerArray = text.components(separatedBy: "\n")
                }
            }
        case "Непознанное":
            if let path = Bundle.main.path(forResource: "spiritualityHeader", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    headerArray = text.components(separatedBy: "\n")
                }
            }
        case "О жизни":
            if let path = Bundle.main.path(forResource: "liveHeader", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    headerArray = text.components(separatedBy: "\n")
                }
            }
        case "О природе":
            if let path = Bundle.main.path(forResource: "natureHeader", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    headerArray = text.components(separatedBy: "\n")
                }
            }
        case "О близких":
            if let path = Bundle.main.path(forResource: "kidsHeader", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    headerArray = text.components(separatedBy: "\n")
                }
            }
        case "Об авторе":
            if let path = Bundle.main.path(forResource: "MashaHeader", ofType: "txt") {
                if let text = try? String(contentsOfFile: path) {
                    headerArray = text.components(separatedBy: "\n")
                }
            }
        default:
            break
        }
    }
    
    
    
    // убрали выделение ячейки после tap
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //свайп влево---------начало--------------------------------------------------------
    
    var favoritesArray = [Bool](repeatElement(false, count: 152))   //массив для того чтоб не повторялась галочка(152 от фонаря)
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let share = UITableViewRowAction(style: .default, title: "Поделиться") { (action, indexPath) in
            //текст шаринга
            let defaultText = self.textArray[indexPath.row] + "\nДругие стихи автора в приложениях: \n\nДля iPhone http://itunes.apple.com/app/id1211561140 \n\nДля Android https://play.google.com/store/apps/details?id=com.bubna.fl_izumina"
            //попытка прикрепить изображение, предварительно пересоздав его
            //jpg            if let image = UIImage(named: self.verse[indexPath.row].image)
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        
        let userDefaults = UserDefaults.standard
        let nameKeyBool = userDefaults.bool(forKey: self.headerArray[indexPath.row])
        let favoritesTitle = nameKeyBool ? "Из избранного" : "В избранное"
        
        let favorites = UITableViewRowAction(style: .default, title: favoritesTitle) { (action, indexPath) in
            //тут должен быть метод добавления в избранное
            let cell = tableView.cellForRow(at: indexPath)
            //          self.favoritesArray[indexPath.row] = true
            //          cell?.accessoryType = .checkmark //удалили 2 строки для снятия checkMark
            
            
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
            
            //для добавления заголовков и тектов
            var timeArray = [String]()
            var timeArrayText = [String]()
            
            //ставит галочку
            let nameKeyBool = userDefaults.bool(forKey: self.headerArray[indexPath.row])
            
            let userArray = userDefaults.stringArray(forKey: "userArray")
            let userArrayText = userDefaults.stringArray(forKey: "userArrayText")
            
            if nameKeyBool == true {
                cell?.accessoryType = .checkmark
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
                cell?.accessoryType = .none
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
            }
            
            tableView.reloadRows(at: [indexPath], with: .right)
        }
        
        share.backgroundColor = #colorLiteral(red: 0.8454377651, green: 0.7251623273, blue: 1, alpha: 1)
        favorites.backgroundColor = #colorLiteral(red: 1, green: 0.61024791, blue: 0.7649310231, alpha: 1)
        
        return [share, favorites]
    }    //свайп влево----------окончание--------------*/
    
    
    //подготовка перехода
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toPoemSegue" {
            //определили ячейку
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! OnePoemViewController
                dvc.text = textArray[indexPath.row]
                dvc.header = headerArray[indexPath.row]
                
                //метод храниения данных "смотрел - не смотрел стих"
                let isWatchedKey = self.headerArray[indexPath.row] + "isWatched" //передали имя конкретного заголовка в nameKey
                let userDefaults = UserDefaults.standard
                self.isWatchesArray[indexPath.row] = true
                
                userDefaults.set(true, forKey: isWatchedKey)
                userDefaults.synchronize()
                tableView.reloadData()
            }
        }
    }
}













