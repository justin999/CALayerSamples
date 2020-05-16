//
//  ViewController.swift
//  CALayerSamples
//
//  Created by Koichi Sato on 2020/05/16.
//  Copyright © 2020 Koichi Sato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            self.moveViews()
        }
        
    }
    
    private func addLayers() {
        for (idx, view) in ([view1, view2]).enumerated() {
            let layer = CAGradientLayer()
            layer.startPoint = CGPoint(x: 0.5, y: 0.0)
            layer.endPoint   = CGPoint(x: 0.5, y: 1.0)
            layer.colors = [
                UIColor.black.withAlphaComponent(0.3).cgColor,
                UIColor.black.withAlphaComponent(0.6).cgColor
            ]
            layer.frame = view?.frame ?? .zero
            layer.position = CGPoint(x: (view?.bounds.width ?? 0) / 2, y: (view?.bounds.height ?? 0) / 2)
            
            if idx == 0 {
                view?.layer.addSublayer(layer)
            } else {
                view?.layer.insertSublayer(layer, at: 0)
            }
        }
    }

    private func moveViews() {
        for targetView in [view1, view2] {
            UIView.animate(withDuration: 0.3) {
                targetView?.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
            }
        }
    }
}

