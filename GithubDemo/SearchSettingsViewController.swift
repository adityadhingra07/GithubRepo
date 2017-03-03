//
//  SearchSettingsViewController.swift
//  GithubDemo
//
//  Created by Aditya Dhingra on 3/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

protocol SettingsPresentingViewControllerDelegate: class {
    func didSaveSettings(settings: GithubRepoSearchSettings)
    func didCancelSettings()
}

class SearchSettingsViewController: UIViewController {
    
    var delegate: SettingsPresentingViewControllerDelegate?
    var settings: GithubRepoSearchSettings?
    
    @IBOutlet weak var numberStars: UILabel!
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        settings?.minStars = Int(sender.value)
        numberStars.text = String(format: "%d", (settings?.minStars)!)
        print(sender.value)
    }
    
    @IBAction func save(_ sender: Any) {
        self.dismiss(animated: true, completion: {() -> Void in
            if let settings = self.settings {
                self.delegate?.didSaveSettings(settings: settings)
            }
        })
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: {() -> Void in
            self.delegate?.didCancelSettings()
        })
    }
    
    @IBOutlet weak var starslider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
