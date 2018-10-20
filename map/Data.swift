//
//  Data.swift
//  map app
//
//  Created by Ivan Ermak on 20.03.2018.
//  Copyright © 2018 Ivan Ermak. All rights reserved.
//

import Foundation
import WebKit
class Data: NSObject
    {
    
    var alpha2Code:String
    var alpha3Code:String
    var altSpellings:[String]
    var area:Double
    var borders:[String]
    
   // var callingCodes:[String]
    var capital:String
    /*var cioc:String
    var currencies:[NSDictionary]
    var demonym:String
   
    var gini: Double
    var languages:[NSDictionary]
    var latlng:[Double]
    
    var nativeName:String
    var numericCode:String*/
    var population:Int
   /* var region:String
    var regionalBlocs:[NSDictionary]
    var subregion:String
    var timezones:[String]
    var topLevelDomain :[String]
    var translations:[String:String] */
    var flag : UIImage?
    var name: String

 /*   init?(name: String, flag: UIImage?, alpha2Code: String, alpha3Code: String, altSpellings: [String], area: Double, borders:[String], callingCodes: [String], capital:String, cioc:String, currencies:[NSDictionary], demonym:String,gini:Double, languages:[NSDictionary], latlng:[Double], nativeName:String, numericCode:String, population:Int, region:String, regionalBlocs:[NSDictionary], subregion:String, timezones:[String], topLevelDomain :[String], translations:[String:String]){
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        // Initialize stored properties.
        self.name = name
        self.alpha2Code = alpha2Code
        self.alpha3Code = alpha3Code
        self.flag = flag
        self.altSpellings = altSpellings
        self.area = area
        self.borders = borders
        self.callingCodes = callingCodes
        self.capital = capital
        self.cioc = cioc
        self.currencies = currencies
        self.demonym = demonym
        self.gini = gini
        self.languages = languages
        self.latlng = latlng
        self.nativeName = nativeName
        self.numericCode = numericCode
        self.population = population
        self.region = region
        self.regionalBlocs = regionalBlocs
        self.subregion = subregion
        self.timezones = timezones
        self.topLevelDomain = topLevelDomain
        self.translations = translations
    }
}
*/
    init?(name: String, flag: UIImage?, alpha2Code: String, alpha3Code: String, altSpellings: [String], area: Double, borders: [String], capital: String, population: Int)
    {
        guard !name.isEmpty else {
            return nil
        }
        // Initialize stored properties.
        self.name = name
        self.alpha2Code = alpha2Code
        self.alpha3Code = alpha3Code
        self.flag = flag
        self.altSpellings = altSpellings
        self.area = area
        self.borders = borders
        self.capital = capital
        self.population = population
    }
public struct Currencies
{
    var code:String
    var name:String
    var symbol:String
}
public struct Languages
{
    var iso639_1:String
    var iso639_2:String
    var name:String
    var nativeName:String
}

public struct RegionalBlocs
{
    var acronym:String
    var name:String
    var otherAcronyms:[String]
    var otherNames:[String]
}
}
