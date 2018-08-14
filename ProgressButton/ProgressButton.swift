//
//  ProgressButton.swift
//  ProgressButton
//
//  Created by Emily Castles on 10/08/2018.
//  Copyright © 2018 Emily Castles. All rights reserved.
//

import UIKit


class ProgressButton: UIButton {
    var titleText: String? {
        didSet {
            self.setTitle(titleText, for: .normal)
        }
    }
    
    var timer: Timer!
    var progressPercentage:Float = 1.0
    var progressDuration:Float = 5.0
    var progressInterval:Float = 0.05
    var pBar = UIProgressView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addSubview(pBar)
    }
    
    override func layoutSubviews() {
        pBar.frame = bounds
        
        super.layoutSubviews()
    }
    
    @objc func animateProgressBar() {
        pBar.setProgress(progressPercentage, animated: true)
        if(progressPercentage < 0){
            self.sendActions(for: .touchUpInside)
        } else {
            progressPercentage = progressPercentage - progressInterval/progressDuration
            timer = Timer.scheduledTimer(timeInterval: Double(progressInterval), target: self, selector: #selector(animateProgressBar), userInfo: nil, repeats: false)
        }
    }
    
    func autoDismiss(after: Int) {
        if let timer = timer {
            timer.invalidate()
        }
        
        progressPercentage = 1.0
        pBar.progress = progressPercentage
        timer = Timer.scheduledTimer(timeInterval: Double(progressInterval), target: self, selector: #selector(animateProgressBar), userInfo: nil, repeats: false)
        self.isHidden = false
    }
    
    





}
