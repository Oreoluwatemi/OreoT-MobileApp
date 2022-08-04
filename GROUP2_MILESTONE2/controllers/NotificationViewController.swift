//
//  NotificationViewController.swift
//  GROUP2_MILESTONE2
//
//  Created by Oreoluwa Lawal on 2022-07-18.
//

import UIKit

class NotificationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var titleHeader: UILabel?
    
    @IBOutlet weak var setReminder: UILabel?
    
    @IBOutlet weak var reminderPicker: UIPickerView?
    override func viewDidLoad() {
        super.viewDidLoad()
        applyPortraitConstraint()
        reminderPicker!.delegate = self
        reminderPicker!.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func applyPortraitConstraint(){
        titleHeader!.translatesAutoresizingMaskIntoConstraints = false;
        titleHeader!.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 3).isActive = true;
        titleHeader!.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        titleHeader!.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 7.0).isActive = true
        titleHeader!.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true
        
        setReminder!.translatesAutoresizingMaskIntoConstraints = false;
        setReminder!.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        setReminder!.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true;
        setReminder!.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 20.0).isActive = true
        setReminder!.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        
        reminderPicker!.translatesAutoresizingMaskIntoConstraints = false;
        reminderPicker!.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        reminderPicker!.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true;
        reminderPicker!.topAnchor.constraint(equalToSystemSpacingBelow:  setReminder!.topAnchor, multiplier: 10.0).isActive = true
        reminderPicker!.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true
        reminderPicker!.backgroundColor =  UIColor(red: 255/255.0, green: 206/255.0, blue: 80/255.0, alpha: 1.0)
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        4
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let reminder = "Ore"
        return reminder
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
