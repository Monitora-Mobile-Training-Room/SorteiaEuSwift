//
//  HomeViewController.swift
//  SorteiaEuSwift
//
//  Created by Yasmin Benatti on 13/06/17.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var emptyStateView: EmptyStateView!
    
    var raffleArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Title
        self.title = "Home"
        
        //Right Button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(self.didTapRightBarButton(_:)))
        
        //Testing Raffle Array
        self.raffleArray.append("Raffle1")
        self.raffleArray.append("Raffle2")
        self.raffleArray.append("Raffle3")
        
        //TableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(RaffleTableViewCell.classForCoder(), forCellReuseIdentifier: raffleTableViewCellIdentifier)
        self.tableView.register(UINib(nibName: "RaffleTableViewCell", bundle: nil), forCellReuseIdentifier: raffleTableViewCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.emptyStateView.isHidden = true
        self.emptyStateView.messageLabel.text = "Coming Soon!"
        
        self.tableView.reloadData()
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
    
    // MARK : - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.raffleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: raffleTableViewCellIdentifier, for: indexPath) as! RaffleTableViewCell
        
        cell.raffleNameLabel.text = self.raffleArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TableHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 24))
        headerView.titleLabel.text = "Raffles"
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK : - IBActions
    
    @IBAction func didTapRightBarButton(_ sender: Any) {
        self.navigationController?.tabBarController?.selectedIndex = 1;
    }
    
    @IBAction func didChangeSegmentedControl(_ sender: Any) {
        switch self.segmentedControl.selectedSegmentIndex {
        case 1:
            self.emptyStateView.isHidden = false
        default:
            self.emptyStateView.isHidden = true
        }
    }
}
