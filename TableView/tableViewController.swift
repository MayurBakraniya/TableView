//
//  tableViewController.swift
//  TableView
//
//  Created by MAC on 15/10/20.
//

import UIKit

class tableViewController: UIViewController {

    @IBOutlet weak var strImg: UIImageView!
    @IBOutlet weak var strTitle: UILabel!
    @IBOutlet weak var strDescription: UILabel!
    
    var strlbl1:String!
    var strlbl2:String!
    var strimg:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        strTitle.text = strlbl1
        strDescription.text = strlbl2
        strImg.image = strimg
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
