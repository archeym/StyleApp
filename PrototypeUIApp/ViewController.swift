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
    
    var tableData : [Model] = []
    var dayWeatherDate: DayWeather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        closeMenu()
        setupAnimationControls()
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




