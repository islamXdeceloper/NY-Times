//
//  mostPopularModel.swift
//  NY Times
//
//  Created by Islam Ahmed on 27/04/2023.
//

import Foundation
struct MostPopularModel : Codable {
    var status : String?
    var copyright : String?
    var num_results : Int?
    var results : [Results]?

}

struct Results : Codable {
    var uri : String?
    var url : String?
    var id : Int?
    var asset_id : Int?
    var source : String?
    var published_date : String?
    var updated : String?
    var section : String?
    var subsection : String?
    var nytdsection : String?
    var adx_adx_keywordswords : String?
    var column : String?
    var byline : String?
    var type : String?
    var title : String?
    var abstract : String?
    var des_facet : [String]?
    var org_facet : [String]?
    var per_facet : [String]?
    var geo_facet : [String]?
    var media : [Media]?
    var eta_id : Int?

 
}
struct Media : Codable {
    var type : String?
    var subtype : String?
    var caption : String?
    var copyright : String?
    var approved_for_syndication : Int?
    var media_metadata : [MediaMetadata]?

}
struct MediaMetadata : Codable {
    var url : String?
    var format : String?
    var height : Int?
    var width : Int?
}
