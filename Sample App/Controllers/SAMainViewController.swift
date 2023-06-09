//
//  SAMainViewController.swift
//  Sample App
//
//  Created by Raees  on 04/05/2023.
//  Copyright © 2023 Sample. All rights reserved.
//

import UIKit

class SAMainViewController: SABaseViewController {

    @IBOutlet weak var tblViewArticles: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    var articles = [SAArticle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchArticles()
    }
    

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVc = segue.destination as? SADetailsViewController, let article = (sender as? SAArticleTableViewCell)?.article{
            detailsVc.article =  article
        }
    }
    

    // MARK: - custom functions
    
    /// fetch the articles from server and display it
    func fetchArticles(){
        activityIndicatorView.isHidden  =   false
        activityIndicatorView.startAnimating()
        
        SANetworkManager.get(of: SAFeed.self,url: SAConfig.APIUrl, parameters: ["api-key":SAConfig.APIKey]) { result in
            
            self.activityIndicatorView.stopAnimating()
            
            switch result {
            case .success(let feed):
                self.articles   =   feed.articles ?? []
                self.tblViewArticles.reloadData()
            case .failure(let error):
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alert, animated: true)
            }
        }
    }
}
extension SAMainViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SAArticleTableViewCell", for: indexPath) as? SAArticleTableViewCell else{fatalError("wrong UITableViewCell configuaration")}
        cell.configure(article: articles[indexPath.row])
        return cell
    }
    
    
}

class SAArticleTableViewCell:UITableViewCell{
    
    @IBOutlet weak var lblSection: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAbstract: UILabel!
    @IBOutlet weak var lblPublishDate: UILabel!
    
    var article:SAArticle?
    
    // MARK: - custom functions
    
    /// to display article info
    /// - Parameter article: article data to display
    func configure(article:SAArticle){
        self.article        =   article
        lblTitle.text       =   article.title
        lblAbstract.text    =   article.abstract
        lblSection.text     =   article.section
        lblPublishDate.text =   article.publishedDate
    }
}
