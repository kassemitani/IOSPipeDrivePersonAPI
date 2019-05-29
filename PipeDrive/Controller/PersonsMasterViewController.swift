//
//  ViewController.swift
//  PipeDrive
//
//  Copyright © 2019 kassem Itani. All rights reserved.
//

import UIKit

class PersonsMasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var articleViewModels = [PersonViewModel]()
    let articleCellId = "ArticleCellId"
    
    let detailsSegueId = "showArticleDetail"
    var selectedArticle: PersonViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getArticles()
    }

    func setupTableView() {
        let articleNib = UINib(nibName: "PersonTableViewCell", bundle: nil)
        self.tableView.register(articleNib, forCellReuseIdentifier: articleCellId)
    }
    
    func getArticles() {
        showLoading()
        ApiManager.getPersons( success: { articles in
            self.articleViewModels = articles.map{PersonViewModel(person: $0)}
            self.tableView.reloadData()
            self.hideLoading()
        }, failure: { errorMessage in
            self.hideLoading()
            self.showAlert(title: "Error", message: errorMessage)
        })
    }
    
    // MARK: - Table view data source
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleViewModels.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let personCell = tableView.dequeueReusableCell(withIdentifier: articleCellId, for: indexPath) as! PersonTableViewCell
        personCell.personViewModel = articleViewModels[indexPath.row]
        return personCell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedArticle = articleViewModels[indexPath.row]
        performSegue(withIdentifier: detailsSegueId, sender: nil)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detailsSegueId {
            let detailsVC = segue.destination as! PersonDetailsViewController
            detailsVC.articleViewModel = selectedArticle
        }
    }
    

}

