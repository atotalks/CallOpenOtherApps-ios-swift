//
//  ViewController.swift
//  CallOpenOtherApps
//
//  Created by JuneK on 07/09/2019.
//  Copyright © 2019 JuneK. All rights reserved.
//

import UIKit
import MessageUI
import AVFoundation

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
    }

    @IBOutlet weak var tableview: UITableView!
    var bombSoundEffect: AVAudioPlayer?
    
    let menus = ["Call the scheme Apps",
                 "Open the Apple WebPage",
                 "Open the Apple Map App",
                 "Looking for Apple Map Route",
                 "Open the Google Map App",
                 "Call the Phone",
                 "Send the SMS Message",
                 "Send the E-mail",
                 "Play the Media"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    func callApptoApp() {
        let url = URL(string: "AppBSwift:Vacation?index=1")
        
        UIApplication.shared.open(url!) { (result) in
            if result {
                // The URL was delivered successfully!
            }
        }
    }
    
    func openTheSafari() {
        let url = URL(string: "http://www.apple.com")
        
        UIApplication.shared.open(url!) { (result) in
            if result {
                // The URL was delivered successfully!
            }
        }
    }
    
    func MoveToAppleMap() {
        
        let url = "http://maps.apple.com/?q=cupertino"
        UIApplication.shared.open(URL(string:url)!) { (result) in
            if result {
                // The URL was delivered successfully!
            }
        }
        
    }
    
    func MoveToAppleMapRoute() {
        
        let url = "http://maps.apple.com/?daddr=San+Francisco,+CA&saddr=cupertino"
        UIApplication.shared.open(URL(string:url)!) { (result) in
            if result {
                // The URL was delivered successfully!
            }
        }
    }
    
    
    func MoveToGoogleMap() {
        
        let url = "comgooglemaps://?center=40.765819,-73.975866&zoom=14&views=traffic"
        UIApplication.shared.open(URL(string:url)!) { (result) in
            if result {
                // The URL was delivered successfully!
            }
        }
    }
    
    func callPhone() {
        
        let url: NSURL = URL(string: "TEL://1234567890")! as NSURL
        UIApplication.shared.open(url as URL) { (result) in
            if result {
                // The URL was delivered successfully!
            }
        }
        
        
    }
    
    func sendSMSMessage() {
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = "Message Body"
            controller.recipients = ["821111"]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
        
        
    }
    
    func sendEmailMessage() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["you@yoursite.com"])
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
        
    }
    
    func playMediafile() {
        let path = Bundle.main.path(forResource: "ab.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.play()
        } catch {
            // couldn't load file :(
        }
    }


}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "FirstCustomCell", for: indexPath) as! FirstCustomCell
        
        cell.tvLabel.text = menus[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
            
        case 0:
            callApptoApp()
            break;
        case 1:
            openTheSafari()
            
            break;
        case 2:
            MoveToAppleMap();
            break;
            
        case 3:
            MoveToAppleMapRoute();
            break;
            
        case 4:
            MoveToGoogleMap();
            break;
            
        case 5:
            callPhone();
            break;
            
        case 6:
            sendSMSMessage();
            break;
            
        case 7:
            sendEmailMessage();
            break;
        case 8:
            playMediafile();
            break;
            
            
        default:
            
            return
            
        }
        
    }
    
    
}

extension ViewController : UITableViewDelegate {
    
}
