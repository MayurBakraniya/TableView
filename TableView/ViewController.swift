//
//  ViewController.swift
//  TableView
//
//  Created by MAC on 15/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    var Arraytitle = ["Android","Apple","Mac","Lenovo","Sony","Hp","Wifi","Sim"]
    var ArrayDescription = ["aaa","bbb","ccc","ddd","eee","fff","ggg","hhh"]
    var ArrayImg = [#imageLiteral(resourceName: "08"),#imageLiteral(resourceName: "41"),#imageLiteral(resourceName: "32"),#imageLiteral(resourceName: "12"),#imageLiteral(resourceName: "42"),#imageLiteral(resourceName: "09"),#imageLiteral(resourceName: "888"),#imageLiteral(resourceName: "15")]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
}

extension ViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Arraytitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if ((indexPath.row % 2) !=  0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            cell.lblTitle.text = Arraytitle[indexPath.row]
            cell.lblDescription.text = ArrayDescription[indexPath.row]
            cell.ImgView.image = ArrayImg[indexPath.row]
            cell.backgroundColor = #colorLiteral(red: 0.8744143248, green: 0.8745648265, blue: 0.8744048476, alpha: 1)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            cell.lblTitle.text = Arraytitle[indexPath.row]
            cell.lblDescription.text = ArrayDescription[indexPath.row]
            cell.ImgView.image = ArrayImg[indexPath.row]
            cell.backgroundColor = .none
            return cell
        }
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail:tableViewController = self.storyboard?.instantiateViewController(withIdentifier: "tableViewController") as! tableViewController
        detail.strlbl1 = Arraytitle[indexPath.row]
        detail.strlbl2 = ArrayDescription[indexPath.row]
        detail.strimg = ArrayImg[indexPath.row]
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            Arraytitle.remove(at: indexPath.row)
            ArrayDescription.remove(at: indexPath.row)
            ArrayImg.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

