//
//  ViewController.swift
//  PrototypeUIApp
//
//  Created by Arkadijs Makarenko on 05/07/2017.
//  Copyright © 2017 ArchieApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menuView: UIViewX!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var calendarButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var mailButton: UIButton!
    @IBOutlet weak var dayView: UIView!
    @IBOutlet weak var weatherView: UIView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var sideMenu: UIView!
    
    @IBOutlet weak var menuCurveImageView: UIImageView!
    @IBOutlet weak var screenCoverButton: UIButton!
    
    @IBOutlet weak var profileImageView: UIImageViewX!
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var noteButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var callendarButton: UIButton!
    @IBOutlet weak var newsButton: UIButton!
    
    var tableData : [Model] = []
    var dayWeatherDate: DayWeather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuCurveImageView.image = #imageLiteral(resourceName: "MenuCurve")
        tableView.dataSource = self
        tableView.delegate = self
        
        Data.getDayWeather { (data) in
            if let data = data{
                self.dayLabel.text = data.dayName
                self.dateLabel.text = data.longDate
                self.weatherLabel.text = data.temperature
                self.cityLabel.text = data.city
                self.weatherImageView.image = data.weatherIcon
                
            }
        }
        Data.getData{ (data) in
            self.tableData = data
            self.tableView.reloadData()
            self.animateTableCell()
            
        }
        hideSideMenu()
        closeMenu()
        setupAnimationControls()
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        showSideMenu()
    }
    
    func showSideMenu() {
        sideMenu.isHidden = false
        UIView.animate(withDuration: 0.7, animations: {
            self.sideMenu.alpha = 1
            self.screenCoverButton.alpha = 1
        })
        
        
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.userButton.transform = .identity
            self.callendarButton.transform = .identity
        })
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.noteButton.transform = .identity
            self.photoButton.transform = .identity
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut, animations: {
            self.menuCurveImageView.transform = .identity
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.2, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.profileImageView.transform = .identity
            self.newsButton.transform = .identity
        })
    }
    
    @IBAction func screenCoverTapped(_ sender: Any) {
        hideSideMenu()
    }
    
    func hideSideMenu(){
        UIView.animate(withDuration: 0.7, animations: {
            self.sideMenu.alpha = 0
            self.screenCoverButton.alpha = 0
        })
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.profileImageView.transform = CGAffineTransform(translationX: -self.sideMenu.frame.width, y: 0)
            self.newsButton.transform = CGAffineTransform(translationX: -self.sideMenu.frame.width, y: 0)
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.userButton.transform = CGAffineTransform(translationX: -self.sideMenu.frame.width, y: 0)
            self.callendarButton.transform = CGAffineTransform(translationX: -self.sideMenu.frame.width, y: 0)
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [.curveEaseOut, .allowUserInteraction], animations: {
            self.noteButton.transform = CGAffineTransform(translationX: -self.sideMenu.frame.width, y: 0)
            self.photoButton.transform = CGAffineTransform(translationX: -self.sideMenu.frame.width, y: 0)
        }) { success in
            self.sideMenu.isHidden = true
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut, animations: {
            self.menuCurveImageView.transform = CGAffineTransform(translationX: -self.menuCurveImageView.frame.width, y: 0)
            
        })
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            self.dayView.transform = .identity
            self.weatherView.transform = .identity
        }) { (success) in
            
        }
    }
    
    @IBAction func menuButtonTapped(_ sender: FloatingButton) {
        UIView.animate(withDuration: 0.3, animations: {
        if self.menuView.transform == .identity {
            
            self.closeMenu()
        }else{

            self.menuView.transform = .identity
            }
        })
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            if self.menuView.transform == .identity {
                self.calendarButton.transform = .identity
                self.callButton.transform = .identity
                self.mailButton.transform = .identity
            }
        })
    }
    func setupAnimationControls(){
        dayView.transform = CGAffineTransform(translationX: -dayView.frame.width, y: 0)
        weatherView.transform = CGAffineTransform(translationX: weatherView.frame.width, y: 0)
    }
    
    func closeMenu(){
        menuView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        calendarButton.transform = CGAffineTransform(translationX: 0, y: 14)
        callButton.transform = CGAffineTransform(translationX: 11, y: 11)
        mailButton.transform = CGAffineTransform(translationX: 14, y: 0)
    }
    func animateTableCell(){
        let cells = tableView.visibleCells
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: view.frame.width, y: 0)
            
        }
        var delay = 0.8
        for cell in cells {
            UIView.animate(withDuration: 0.2, delay: delay, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = .identity
                
            })
            delay += 0.1
        }
    }
    
}//end

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = tableData[indexPath.row]
        var cell : TableViewCell!
        
        if model.images.count > 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! TableViewCell
            
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
            
        }
        cell.setup(model: tableData[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = tableData[indexPath.row]
         if model.images.count > 0 {
            return 110
        }
        return 80
    }
}




