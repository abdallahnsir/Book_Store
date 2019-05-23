//
//  OwnerShowAddedItems.swift
//  BooksStore
//
//  Created by Abdullah Jacksi on 5/23/19.
//  Copyright © 2019 abdullah. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SDWebImage

class OwnerShowAddedItems: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var myTableView: UITableView!
                                                { didSet {
                                                        myTableView.delegate = self ;
                                                        myTableView.dataSource = self ;
                                                          }
                                                 }
    
    var arrayItems = [ItemObject]() { didSet {
                                                DispatchQueue.main.async { [weak self] in
                                                self?.myTableView.reloadData()
                                                }
                                              }
                                    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        _ = Database.database().reference().child("items").observe(DataEventType.value, with: { (snapshot) in
            
            //if the reference have some values
            if snapshot.childrenCount > 0 {

                //clearing the list
                self.arrayItems.removeAll()
                
                //iterating through all the values
                for Items in snapshot.children.allObjects as! [DataSnapshot] {
                    //getting values
                    let itemObject = Items.value as? [String: AnyObject]
                    
                    let idOfItem  = itemObject?["idOfItem"] as! String?
                    let nameOfItem  = itemObject?["nameOfItem"] as! String?
                    let priceOfItem = itemObject?["priceOfItem"] as! String?
                    let linkOfImage = itemObject?["linkOfImage"] as! String?

                    let item = ItemObject(idOfItem: idOfItem, nameOfItem: nameOfItem, PriceOfItem: priceOfItem, linkOfImage: linkOfImage)
                    
                    self.arrayItems.insert(item, at: 0)
                }
                
                //reloading the tableview
                DispatchQueue.main.async { [weak self] in
                    self?.myTableView.reloadData()
                }
                
            }else{
                
            }
            print(self.arrayItems.count)
            
        })
        
        
        
        myTableView.register(UINib(nibName: "OwnerItemTableViewCell", bundle: nil), forCellReuseIdentifier: "myCell")
        
        
        

    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("raw ========= \(self.arrayItems.count) \n\n\n")



        return self.arrayItems.count
//        return 1

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 151
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = self.myTableView.dequeueReusableCell(withIdentifier: "myCell") as! OwnerItemTableViewCell


        let item : ItemObject
        item = self.arrayItems[indexPath.row]

        //MARK: download image
        if let imageDownloadURL = self.arrayItems[indexPath.row].linkOfImage {

            let url = URL(string: imageDownloadURL)
            let chat = UIImage(named: "bus")
            cell.myImage.sd_setImage(with: url, placeholderImage: chat  )

        }


        if arrayItems.count > 0 {
//                    print(")))))))))))))))((((((((((((")
//                    print(self.arrayItems.count)
            cell.nameLabel?.text = item.nameOfItem
            cell.priceLabel?.text = item.PriceOfItem

        }

        return cell
    }



    
    
    
    

}
