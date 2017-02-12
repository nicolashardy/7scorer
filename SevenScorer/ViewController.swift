//
//  ViewController.swift
//  SevenScorer
//
//  Created by Nicolas Hardy on 12/02/2017.
//  Copyright © 2017 Nicolas Hardy. All rights reserved.
//

import UIKit
import NapySlider

class ViewController: UIViewController {
    
    @IBOutlet weak var militaryPoints: UISegmentedControl!
    
    @IBOutlet weak var chipPoints: UISegmentedControl!
    
    @IBOutlet weak var treasurySlider: NapySlider!
    
    @IBOutlet var civilSlider: NapySlider!
    
    @IBOutlet var merchandisingSlider: NapySlider!
    
    @IBOutlet var scienceSlider: NapySlider!
    
    @IBOutlet weak var progressSlider: NapySlider!
    
    @IBOutlet weak var guildSlider: NapySlider!
    
    @IBOutlet weak var victoryPicture: UIImageView!
    
    @IBOutlet weak var victoryPoints: UILabel!
    
    var totalPoints = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func calculateButtonClicked(_ sender: UIButton) {
        
        totalPoints = getMilitaryPoints()
        
        totalPoints += getSliderPoints()
        
        totalPoints += getChipPoints()
        
        let alert = UIAlertController(title: "Total", message: "\(totalPoints) points", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        victoryPicture.isHidden = false
        
        victoryPoints.text = String(totalPoints)
        victoryPoints.isHidden = false
    }
    
    func getTotalPoints() -> Int {
        totalPoints = getMilitaryPoints() +
            getChipPoints() +
            getSliderPoints()
        return totalPoints
    }
    
    func getMilitaryPoints() -> Int {
        
        switch militaryPoints.selectedSegmentIndex {
        case 0:
            return 0
        case 1:
            return 2
        case 2:
            return 5
        case 3:
            return 10
        default:
            return 0
        }
    }
    
    func getChipPoints() -> Int {
        
        switch chipPoints.selectedSegmentIndex {
        case 0:
            return 0
        case 1:
            return 3
        case 2:
            return 4
        case 3:
            return 6
        case 4:
            return 7
        case 5:
            return 9
        default:
            return 0
        }
    }
    
    func getSliderPoints() -> Int {
        
        let allSliders = [treasurySlider, civilSlider, merchandisingSlider, scienceSlider, progressSlider, guildSlider]
        
        var points = 0

        for slider in allSliders {
            var sliderPoints = Int((getLabelsInView(view: slider!).first?.text)!)
            if(sliderPoints == nil) {
                sliderPoints = 0
            }
            
            points += sliderPoints!
        }
        
        return points
    }
    
    func getLabelsInView(view: UIView) -> [UILabel] {
        var results = [UILabel]()
        for subview in view.subviews as [UIView] {
            if let labelView = subview as? UILabel {
                results += [labelView]
            } else {
                results += getLabelsInView(view: subview)
            }
        }
        return results
    }
}

