//
//  ItemModel.swift
//  BooksStore
//
//  Created by Abdullah Jacksi on 5/23/19.
//  Copyright © 2019 abdullah. All rights reserved.
//

import UIKit

class ItemObject{
    
    
    var idOfItem : String?
    var nameOfItem : String?
    var PriceOfItem : String?
    var linkOfImage : String?


    init(idOfItem : String?, nameOfItem : String?, PriceOfItem : String?, linkOfImage : String? )
    {
        self.idOfItem = nameOfItem
        self.nameOfItem = nameOfItem
        self.PriceOfItem = PriceOfItem
        self.linkOfImage = linkOfImage

    }
    
    
    
    
}
