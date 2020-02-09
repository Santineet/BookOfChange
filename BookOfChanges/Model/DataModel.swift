//
//  DataModel.swift
//  BookOfChanges
//
//  Created by Evgeniy Suprun on 09.12.2019.
//  Copyright © 2019 Evgeniy Suprun. All rights reserved.
//

import Foundation


struct DataMonth: Decodable {
    
    var id: Int?
    var month: Int?
    var year: Int?
    var text: String?
}


struct DataModel: Decodable {
    
    var id: Int
    var name_eng: String?
    var name_chi: String?
    var pronunciation: String?
    var base_text: String?
    var additional_text: String?
    var hexagram: String?

}

