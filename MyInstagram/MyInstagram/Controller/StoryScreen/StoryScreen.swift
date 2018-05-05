//
//  StoryScreen.swift
//  MyInstagram
//
//  Created by Vakhtangi Beridze on 5/4/18.
//  Copyright © 2018 c0mrade. All rights reserved.
//

import UIKit

class StoryScreen: UIViewController {
    
    private var imageArray = [String]()
    
    private var imageIndex = 0
    private var timer:Timer?
    private var isTimerRunning = false
    private var progressbarWidthConstraint:NSLayoutConstraint?
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer()
        imageArray = ["test_0", "test_1", "test_2", "test_3", "test_4", "test_5", "test_6", "test_7"]
        
        runTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer?.invalidate()
    }
    
    func runTimer() {

        if let barWidth = self.progressBar.constraint(withIdentifier: "progressbar-width") {
            self.progressbarWidthConstraint = barWidth
        }
        
        self.loadImg(load: self.imageIndex)
        timerProgressBar()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (time) in
            self.imageIndex += 1
            
            if self.imageIndex >= self.imageArray.count-1 {
                self.imageIndex = 0
            }
            
            self.loadImg(load: self.imageIndex)
            self.timerProgressBar()
        })
    }
    
    func timerProgressBar() {
        UIView.animate(withDuration: 0.9, animations: {
            self.progressbarWidthConstraint?.constant = UIScreen.main.bounds.size.width
            self.view.layoutIfNeeded()
        }) { (true) in
            self.progressbarWidthConstraint?.constant = 20
        }
    }
    
    
    func loadImg(load index:Int) {
        imageView.image = UIImage(named: imageArray[index])
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    // MARK: - IBActions
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("deinited")
    }

}

extension UIView {
    func constraint(withIdentifier: String) -> NSLayoutConstraint? {
        return self.constraints.filter { $0.identifier == withIdentifier }.first
    }
}
