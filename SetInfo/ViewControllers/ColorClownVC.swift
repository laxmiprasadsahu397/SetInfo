//
//  ColorClownVC.swift
//  SetInfo
//
//  Created by LaxmiPrasad Sahu on 22/03/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit

class ColorClownVC: UIViewController {

    @IBOutlet weak var view_selectedColor: UIView!
    @IBOutlet weak var view_Image: FillImageColor!
    @IBOutlet weak var collectionView: UICollectionView!
    var colorList:[UIColor]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Color Clown"
        colorList = [UIColor.blue, UIColor.black, UIColor.red, UIColor.brown, UIColor.yellow, UIColor.cyan, UIColor.gray, UIColor.green, UIColor.magenta, UIColor.orange, UIColor.purple, UIColor.colorWithHexString(hexStr: "#7B3F00"), UIColor.colorWithHexString(hexStr: "#00FF3F"), UIColor.colorWithHexString(hexStr: "#B57EDC"), UIColor.colorWithHexString(hexStr: "#4B0082"), UIColor.colorWithHexString(hexStr: "#C8A2C8"), UIColor.colorWithHexString(hexStr: "#BFFF00"), UIColor.colorWithHexString(hexStr: "#CCCCFF"), UIColor.colorWithHexString(hexStr: "#1C39BB"), UIColor.colorWithHexString(hexStr: "#8E4585"), UIColor.colorWithHexString(hexStr: "#003153"), UIColor.colorWithHexString(hexStr: "#008080"), UIColor.colorWithHexString(hexStr: "#40E0D0"), UIColor.colorWithHexString(hexStr: "#CC8899"), UIColor.colorWithHexString(hexStr: "#800080"), UIColor.colorWithHexString(hexStr: "#E30B5C"), UIColor.colorWithHexString(hexStr: "#C71585"), UIColor.colorWithHexString(hexStr: "#D2B48C"), UIColor.colorWithHexString(hexStr: "#483C32"), UIColor.colorWithHexString(hexStr: "#FFBF00")]
    }

}
extension ColorClownVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath)
        let item = colorList?[indexPath.row]
        cell.contentView.backgroundColor = item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let color = colorList?[indexPath.row]
        self.view_selectedColor.backgroundColor = color
        let fillcolrView: FillImageColor = self.view_Image
        fillcolrView.paintColor = color
    }
}
