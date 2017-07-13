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
    
    var tableData : [Model] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        Data.getData{ (data) in
            self.tableData = data
            self.tableView.reloadData()
        }
        closeMenu()
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
    
    func closeMenu(){
        menuView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        calendarButton.transform = CGAffineTransform(translationX: 0, y: 14)
        callButton.transform = CGAffineTransform(translationX: 11, y: 11)
        mailButton.transform = CGAffineTransform(translationX: 14, y: 0)
    }
    
}//end

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.setup(model: tableData[indexPath.row])
        return cell
    }
}




