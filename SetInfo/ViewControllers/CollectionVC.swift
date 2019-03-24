//
//  CollectionVC.swift
//  SetInfo
//
//  Created by LaxmiPrasad Sahu on 22/03/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var profileList: [[String: Any]]?
    var index: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
//        definesPresentationContext = true
        self.title = "Swipe Color"
        profileList = [["tital":"I'm Green", "color": #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)], ["tital":"I'm Orange", "color":#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)], ["tital":"I'm Violet", "color":#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)], ["tital":"I'm Red", "color":#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)]]
    }
    @objc func swipeThisCell(_ recognizer:UISwipeGestureRecognizer){
        let cell = recognizer.view as! SwipCell
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            cell.transform = CGAffineTransform(translationX: 0, y: -300)
        }, completion: { _ in
            let i = self.collectionView.indexPath(for: cell)!.item
            self.profileList?.remove(at: i)
            cell.transform = CGAffineTransform(translationX: 0, y: 0)
            self.collectionView.reloadData()
        })
        
    }
    
    @objc func editThisCell(_ recognizer:UISwipeGestureRecognizer){
        let cell = recognizer.view as! SwipCell
        index = self.collectionView.indexPath(for: cell)!.item
        let alart = AlartControllerConfig()
        alart.delegate = self
        alart.configAlartController(viewController: self, title: "Title", message: "", placeholder: "Enter Title", selectedView: self.view)
    }
}
extension CollectionVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let swipe = UISwipeGestureRecognizer.init(target: self, action: #selector(swipeThisCell))
        swipe.direction = .up
        
        let logPress = UILongPressGestureRecognizer.init(target: self, action: #selector(editThisCell))
        logPress.minimumPressDuration = 1.0
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? SwipCell else {
          return UICollectionViewCell()
        }
        let item = profileList?[indexPath.row]
        cell.lbl_tital.text = item?["tital"] as? String
        cell.contentView.backgroundColor = item?["color"] as? UIColor
        cell.addGestureRecognizer(swipe)
        cell.addGestureRecognizer(logPress)
         return cell
    }
}
extension CollectionVC: AlartControllerConfigProtocol {
    func updateTextFieldValue(text: String) {
        guard let index = index else {
         return
        }
        self.profileList?[index]["tital"] = text
        self.collectionView.reloadData()
    }
    
}
