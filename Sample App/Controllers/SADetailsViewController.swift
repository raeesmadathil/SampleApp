//
//  SADetailsViewController.swift
//  Sample App
//
//  Created by Raees  on 04/05/2023.
//  Copyright © 2023 Sample. All rights reserved.
//

import UIKit

class SADetailsViewController: SABaseViewController {

    @IBOutlet weak var imgViewBig: UIImageView!
    @IBOutlet weak var lblSection: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAbstract: UILabel!
    @IBOutlet weak var lblPublishDate: UILabel!
    @IBOutlet weak var lblByline: UILabel!
    
    var article:SAArticle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
    
    /// displaying the article data
    func setupUI(){
        lblTitle.text       =   article?.title
        lblAbstract.text    =   article?.abstract
        lblSection.text     =   article?.section
        lblPublishDate.text =   article?.publishedDate
        lblByline.text      =   article?.byline
        
        if let media = article?.media?.first(where: {$0.type == .image}), let url = media.metaData?.sorted(by: {$0.width ?? 0 > $1.width ?? 0}).first?.url{
            imgViewBig.load(url: url)
        }else{
            imgViewBig.isHidden =   true
        }
    }
}
