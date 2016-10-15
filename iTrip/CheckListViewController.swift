//
//  CheckListViewController.swift
//  iTrip
//
//  Created by Denis Oliveira on 10/14/16.
//  Copyright © 2016 Denis Oliveira - Maiko Trindade. All rights reserved.
//

import UIKit

class CheckListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var checkListTableView: UITableView!
    var checklist:CheckList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "CheckList"
        
        let backButton = UIBarButtonItem(title: "Voltar", style: .plain, target: self, action: #selector(backTap(sender:)))
        backButton.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = backButton
        
        checkListTableView.register(
            UINib(nibName: kCheckListHeaderView, bundle: nil),
            forHeaderFooterViewReuseIdentifier: kCheckListHeaderView
        )
        
        checkListTableView.register(
            UINib(nibName: kCheckListTableViewCell, bundle: nil),
            forCellReuseIdentifier: kCheckListTableViewCell
        )
        
        let drive:DriveData = DriveData()
        checklist = CheckList(checklist: drive.getCheckList()!)
        checkListTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("Sections: \(checklist!.categories!.keys.count)")
        return checklist!.categories!.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keys: [String] = [String](checklist!.categories!.keys)
        let key: String = keys[section]
        return checklist!.categories![key]!.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let keys: [String] = [String](checklist!.categories!.keys)
        let key: String = keys[section]
        
        let header:CheckListHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: kCheckListHeaderView) as! CheckListHeaderView!
        header.categoryLabel?.text = key
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let keys: [String] = [String](checklist!.categories!.keys)
        let key: String = keys[indexPath.section]
    
        let cell:CheckListTableViewCell = tableView.dequeueReusableCell(withIdentifier: kCheckListTableViewCell) as! CheckListTableViewCell!
        cell.itemLabel?.text = checklist!.categories![key]![indexPath.row]
        return cell
    }
 
    func backTap(sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
