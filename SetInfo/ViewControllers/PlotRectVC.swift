//
//  PlotRectVC.swift
//  SetInfo
//
//  Created by LaxmiPrasad Sahu on 22/03/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit

class PlotRectVC: UIViewController {

    @IBOutlet weak var lbl_centermiter: UILabel!
    @IBOutlet weak var draw_View: DrawView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Plot Rect"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func userTapedFreshStart(_ sender: UIButton) {
        let drawView: DrawView = self.draw_View
        drawView.lastPoint = nil
        drawView.newPoint = nil
        drawView.setNeedsDisplay()
    }
    
}
