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
    
    var articles = [SAArticle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchArticles()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - custom functions
    
    /// fetch the articles from server and display it
    func fetchArticles(){
        SANetworkManager.get(of: SAFeed.self,url: SAConfig.APIUrl, parameters: ["api-key":SAConfig.APIKey]) { result in
            switch result {
            case .success(let feed):
                self.articles   =   feed.articles ?? []
                self.tblViewArticles.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
extension SAMainViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SAArticleTableViewCell", for: indexPath)
        return cell
    }
    
    
}

class SAArticleTableViewCell:UITableViewCell{
    
}
