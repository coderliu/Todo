//
//  TodoModel.swift
//  Todo
//
//  Created by 刘岳 on 15/6/11.
//  Copyright (c) 2015年 刘岳. All rights reserved.
//

import UIKit

class TodoModel: NSObject {
    var id: String
    var image: String
    var title: String
    var date: NSDate
    
    init(id: String, image: String, title: String, date: NSDate) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
   
}
