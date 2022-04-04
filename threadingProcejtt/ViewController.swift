//
//  ViewController.swift
//  threadingProcejtt
//
//  Created by İSMAİL AÇIKYÜREK on 4.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{
   
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageview: UIImageView!
    
    let urlStrings = ["https://upload.wikimedia.org/wikipedia/commons/1/12/SultanAhmetMosqueCourtyard.jpg","https://upload.wikimedia.org/wikipedia/commons/7/74/Earth_poster_large.jpg"]
    var data = Data()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.urlStrings[0])!) //background
            DispatchQueue.main.async {
                self.imageview.image = UIImage(data:self.data) //main thread
            }
            
        }
        
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(changeimage))
        
    }
    
    @objc func changeimage() {
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.urlStrings[1])!) //background
            DispatchQueue.main.async {
                self.imageview.image = UIImage(data:self.data) //main thread
            }
            
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Threading Test"
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    


}

