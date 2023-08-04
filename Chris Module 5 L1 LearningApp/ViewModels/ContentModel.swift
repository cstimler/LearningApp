//
//  ContentModel.swift
//  Chris Module 5 L1 LearningApp
//
//  Created by October2022 on 8/4/23.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    init()  {
        
        getLocalData()
        
    }
    
    func getLocalData() {
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // Read the file into a data object
            let jsonData = try Data(Data(contentsOf: jsonUrl!))
            
            let jsonDecoder = JSONDecoder()
            
            // Try to decode the json into an array of Modules
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.modules = modules
            
            
        }
        catch {
            // log error
            print("Couldn't parse local data")
        }
        
        // Parse the style data
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
            
        }
        
        catch {
            
            print("Couldn't parse style data")
        }
    }
    
    
    
}
