//
//  ViewController.swift
//  URl
//
//  Created by Nathaniel Whittington on 3/23/22.
//

import UIKit

class ViewController: UIViewController {
var vm = ViewModel()
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        vm.getData { data in
            DispatchQueue.main.async {
                guard let moviedata = data.first?.title else {return}
                print(moviedata)
                self.tblView.reloadData()
            }
          
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tblView.estimatedRowHeight = 100
        tblView.rowHeight = UITableView.automaticDimension
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.array?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
      
        cell.LabelView.text = vm.array?[indexPath.row].title ?? ""
        cell.ImagePic.setImage(stringUrl: vm.array?[indexPath.row].thumbnailUrl ?? "")
        return cell
    }
    
    
    
    
}

extension UIImageView{
    
    func setImage(stringUrl:String){
        
        guard let url = URL(string: stringUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    if let imageData = UIImage(data: data){
                        self.image = imageData
                    }
                }
            }
        }.resume()
    }
}

