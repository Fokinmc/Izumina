//// For App Store
//  PageViewController.swift
//  Poetry
//
//  Created by Mac on 27.02.17.
//  Copyright © 2017 FokinMC. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    
    var headersArray = ["Здесь живут стихи", "А в них живут люди", "Отмечайте и делитесь", "Об авторе и его правах"]
    var textOfPageArray = [
        "Стихи о любви и разлуке, о личностном росте и эзотерических практиках, о детях и родителях, и о том прекрасном, что каждый может увидеть в окружающем мире, если даст себе минутку чтобы присмотреться и прислушаться.",
        
        "Лирические герои приоткрывают перед читателями мысли и чувства: ярко, образно, иногда явно заявляя о своих мечтах и желаниях, а иногда лишь смутно намекая на сокрытые внутри них тайны. И в этих стихах звучит музыка любви и красоты. Здесь есть взлёты и падения, боль и счастье, многогранная жизнь - прекрасная и удивительная. И каждый найдет здесь что-то своё, что обязательно отзовётся в душе вдумчивого читателя.",
        
        "Смахните строку с заголовком влево и вы сможете отметить понравившееся произведение и поделиться им с друзьями, разместив у себя на стене в социальной сети или отправив в мессенджере",
        
        "Все стихи в этом приложении написаны человеком по имени Маша. Маша Изюмина – поэтесса, художница, бывшая бизнес-леди в настоящее время посвятившая себя творчеству. Родилась и выросла в Омске. Все представленные далее тексты и изображения охраняются законом об авторском праве. Izumina - является зарегистрированным товарным знаком. Разрешено некоммерческое использование с обязательным указанием автора: Маша Изюмина."]
    var socialArray = ["", "", "", "Сайт автора: izumina.ru"]
    var imagesArray = ["", "", "swipe", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let firstVC = displayViewController(atIndex: 0) {
            
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func displayViewController(atIndex index: Int) -> ContentViewController? {
        guard index >= 0 else { return nil }
        guard index < headersArray.count else { return nil }
        guard let ContentVC = storyboard?.instantiateViewController(withIdentifier: "contentViewController") as? ContentViewController else { return nil }
        
        ContentVC.imageFile = imagesArray[index]
        ContentVC.header = headersArray[index]
        ContentVC.textOfPage = textOfPageArray[index]
        ContentVC.social = socialArray[index]
        ContentVC.index = index
        
        return ContentVC
    }
    
    func nextVC(atIndex index: Int) {
        if let ContentVC = displayViewController(atIndex: index + 1) {
            setViewControllers([ContentVC], direction: .forward, animated: true, completion: nil)
        }
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        index -= 1
        return displayViewController(atIndex: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        index += 1
        return displayViewController(atIndex: index)
    }

    
}















