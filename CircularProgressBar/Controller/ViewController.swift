//
//  ViewController.swift
//  CircularProgressBar
//
//  Created by Massimiliano on 12/11/2019.
//  Copyright © 2019 Massimiliano Bonafede. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets

    @IBOutlet var progressBar: ProgressBarView!
    @IBOutlet var startBtn: UIButton!
    
    //MARK: - Properties

    let text = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    var timer : Timer!
    var progressCounter : Float = 0
    let duration : Float = 10.0
    var progressIncrement : Float = 0
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
    }

    //MARK: - Methods

    private func setLabel() {
        text.center = view.center
        text.textAlignment = .center
        text.font = UIFont(name: "MarkerFelt-Wide", size: 25)
        text.textColor = .white
        view.addSubview(text)
    }

    //MARK: - Actions

    @objc func showProgress(){
        
        if (progressCounter > 1.0) {
            timer.invalidate()
        }
        
        progressBar.progress = progressCounter
        progressCounter = progressCounter + progressIncrement
        text.text = "\(Int(progressBar.progress * 100))%"
    }
    
    @IBAction func startBtnWasPressed(_ sender: Any) {
        progressIncrement = 0.01
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(showProgress), userInfo: nil, repeats: true)
    }
    
}

