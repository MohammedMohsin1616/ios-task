//
//  HomeTableView.swift
//  iOS Task
//
//  Created by Mohammed Mohsin Sayed on 10/19/18.
//  Copyright © 2018 Mohammed Mohsin Sayed. All rights reserved.
//

import UIKit
import Firebase

class HomeTableView: UITableViewController {

    var countries = [Country]()
    var pageType: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getData()
    }
    
    // MARK: - Function Setup design
    func setupUI() {
    
        title = "Home"
        logoutBarButton()

    }
    
    func logoutBarButton(){
        let barButton = UIBarButtonItem(title: "Logout", style: .plain , target: self, action: #selector(logoutAction))
        self.navigationItem.setRightBarButton(barButton, animated: true)
    }
    
    @objc func logoutAction(){
        
        try! Auth.auth().signOut()
        UserDefaults.standard.removeObject(forKey: "email")
        if pageType == "appDelegate"{
            let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            let nav = UINavigationController(rootViewController: viewController)
            self.present(nav , animated: true, completion: nil)
            
        }else{
            self.dismiss(animated: true, completion: nil) 
        }
        
    }
    
    // MARK: - Function get all countries
    func getData(){
        let urlString = "https://restcountries.eu/rest/v2/all"
        guard let url = URL(string: urlString) else { return }
        self.startLoading()
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            self.stopLoading()
            if error != nil {
                print(error!.localizedDescription)
                self.showAlert(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            //Implement JSON decoding and parsing
            do {
                //Decode retrived data with JSONDecoder and assing type of Article object
                self.countries = try JSONDecoder().decode([Country].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                //print(self.countries.count)
            } catch let jsonError {
                print(jsonError)
            }
            }.resume()

    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].name
        return cell
    }
 


}
