//
//  DataModel.swift
//  goodStore
//
//  Created by mac on 2021/08/23.
//

import Foundation

struct store: Codable {
    var ListPriceModelStoreService: ListPriceModelStoreService?
        struct ListPriceModelStoreService: Codable {
            var list_total_count: String
            var RESULT: RESULT?
                struct RESULT: Codable {
                    var CODE: String
                    var MESSAGE: String
                }
            
            var row: row?
                struct row: Codable {
                    var SH_ID: String
                    var SH_NAME: String
                    var INDUTY_CODE_SE: String
                    var INDUTY_CODE_SE_NAME: String
                    var SH_ADDR: String
                    var SH_PHONE: String
                    var SH_WAY: String
                    var SH_INFO: String
                    var SH_PRIDE: String
                    var SH_RCMN: String
                    var SH_PHOTO: String
                    var BASE_YM: String
                }

        }

}
