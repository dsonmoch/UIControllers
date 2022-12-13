//
//  NotificationViewController.swift
//  LifeCycle
//
//  Created by Admin on 17/10/22.
//

import UIKit
import UserNotifications
import CoreLocation

class NotificationViewController: UIViewController, UNUserNotificationCenterDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var calenderNotificationButton: UIButton!
    @IBOutlet weak var timerDatePicker: UIDatePicker!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    
    let notificationCenter = UNUserNotificationCenter.current()
    let locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (permissionGranted, error) in
            if(!permissionGranted){
                let alert = UIAlertController(title: "Permission!", message: "Please allow notification permission", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .cancel))
                self.present(alert, animated: true)
            }
        }
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(didTapEdit))
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .badge, .sound])
    }
    
    @objc private func didTapEdit(){
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destVC = storyboard.instantiateViewController(withIdentifier: "ModalViewController") as! ModalViewController
        destVC.modalPresentationStyle = UIModalPresentationStyle.pageSheet
            destVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(destVC, animated: true, completion: nil)
    }
    
    @IBAction func showNotification(_ sender: Any){

        notificationCenter.getNotificationSettings { settings in
            DispatchQueue.main.async {
                let title = "Notification!"
                let message = "Timer triggered notification!"
                let time = self.timerDatePicker.countDownDuration
                if(settings.authorizationStatus == .authorized){
                    let content = UNMutableNotificationContent()
                    content.title = title
                    content.body = message
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(time), repeats: false)
                    let request = UNNotificationRequest(identifier: "Timer Notification At \(time)", content: content, trigger: trigger)
                    
                    self.notificationCenter.add(request){(error) in
                        if(error != nil){
                            print("Error " + error.debugDescription)
                            return
                        }
                    }
                    let alert = UIAlertController(title: "Notification Scheduled", message: "At time interval of: \(time) seconds", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in}))
                    self.present(alert, animated: true)
                }else{
                    let alert = UIAlertController(title: "Enable Notification?", message: "To use this feature you must enable notification in the settings ", preferredStyle: .alert)
                    let goToSettings = UIAlertAction(title: "Settings", style: .default){
                        (_) in
                        guard let settingsURL = URL(string: UIApplication.openSettingsURLString)else{return}
                        if(UIApplication.shared.canOpenURL(settingsURL)){
                            UIApplication.shared.open(settingsURL){(_) in}
                        }
                    }
                    alert.addAction(goToSettings)
                    alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (_) in}))
                    self.present(alert, animated: true)
                }
            }
        }
            
    }
    
    @IBAction func calenderNotification(_ sender: Any){
        notificationCenter.getNotificationSettings { settings in
            DispatchQueue.main.async {
                let title = "Notification"
                let message = "Calender Triggered Notification!"
                let date = self.datePicker.date
                if(settings.authorizationStatus == .authorized){
                    let content = UNMutableNotificationContent()
                    content.title = title
                    content.body = message
                    
                    let dateComp = Calendar.current.dateComponents([.year, .month,.hour, .minute], from: date)
                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)
                    let request = UNNotificationRequest(identifier: "Calender Notification at \(date)", content: content, trigger: trigger)
                    
                    self.notificationCenter.add(request){(error) in
                        if(error != nil){
                            print("Error " + error.debugDescription)
                            return
                        }
                    }
                    let alert = UIAlertController(title: "Notification Scheduled", message: "At " + self.formattedDate(date: date), preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in}))
                    self.present(alert, animated: true)
                }else{
                    let alert = UIAlertController(title: "Enable Notification?", message: "To use this feature you must enable notification in the settings ", preferredStyle: .alert)
                    let goToSettings = UIAlertAction(title: "Settings", style: .default){
                        (_) in
                        guard let settingsURL = URL(string: UIApplication.openSettingsURLString)else{return}
                        if(UIApplication.shared.canOpenURL(settingsURL)){
                            UIApplication.shared.open(settingsURL){(_) in}
                        }
                    }
                    alert.addAction(goToSettings)
                    alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (_) in}))
                    self.present(alert, animated: true)
                }
            }
        }
            
    }
    
    @IBAction func locationNotification(_ sender: Any){
        
        notificationCenter.getNotificationSettings { settings in
            DispatchQueue.main.async {
                let title = "Notification"
                let message = "Location Triggered Notification!"
                let coordinates = CLLocationCoordinate2D(
                    latitude: CLLocationDegrees((self.latitude.text! as NSString).floatValue),
                    longitude:CLLocationDegrees((self.longitude.text! as NSString).floatValue))
                let region = CLCircularRegion(
                    center: coordinates,
                    radius: 2000.0,
                    identifier: "Delhi")
                
                if(settings.authorizationStatus == .authorized){
                    let content = UNMutableNotificationContent()
                    content.title = title
                    content.body = message
                    
                    region.notifyOnEntry = true
                    region.notifyOnExit = true
                    
                    let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
                    let request = UNNotificationRequest(
                        identifier: "Notification for region \(coordinates.latitude), \(coordinates.longitude)",
                        content: content,
                        trigger: trigger)
                    
                    self.notificationCenter.add(request){(error) in
                        if(error != nil){
                            print("Error " + error.debugDescription)
                            return
                        }
                    }
                    
                    let alert = UIAlertController(
                        title: "Notification Scheduled",
                        message: "For location  \(coordinates.latitude) and \(coordinates.longitude)",
                        preferredStyle: .alert)
                    alert.addAction(UIAlertAction(
                        title: "OK",
                        style: .default,
                        handler: { (_) in}))
                    self.present(alert, animated: true)
                    
                }else{
                    
                    let alert = UIAlertController(
                        title: "Enable Notification?",
                        message: "To use this feature you must enable notification in the settings ",
                        preferredStyle: .alert)
                    
                    let goToSettings = UIAlertAction(
                        title: "Settings",
                        style: .default){ (_) in
                        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {return}
                        
                        if(UIApplication.shared.canOpenURL(settingsURL)){
                            UIApplication.shared.open(settingsURL){(_) in}
                        }
                    }
                    alert.addAction(goToSettings)
                    alert.addAction(UIAlertAction(
                        title: "Cancel",
                        style: .default,
                        handler: { (_) in}))
                    self.present(alert, animated: true)
                }
            }
            }
    }
    
    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM y HH:mm"
        return formatter.string(from: date)
    }

}
