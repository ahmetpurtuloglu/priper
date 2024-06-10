//
//  LocalFileManager.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 7.08.2023.
//

import Foundation
import SwiftUI


class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    private init () {
        
    }
    
    func saveImage(image: UIImage,imageName: String,folderName: String) {
        
        // create folder
        
        createFolderIfNeeded(folderName: folderName)
        
        // get path for image
        guard
            let data = image.pngData() , let url = getURLForImage(imageName: imageName, folderName: folderName) else { return }
        // or jpeg
        
        // save image to path
        do {
            try data.write(to: url)
        } catch let error {
            print("error saving image \(imageName) \(error)")
        }
        
        
    }
    
    
    func saveCampaign(campaign: [CampaignModel], campaignName: String,folderName:String) {
        
//        create folder
        createFolderIfNeeded(folderName: folderName)
        
//        get path for campaign and save as a json
        guard  let url = getURLForCampaign(campaignName: campaignName, folderName: folderName) else { return }
        do {
           
            let jsonData = try JSONEncoder().encode(campaign)
            try jsonData.write(to: url)
        } catch let error {
            print("error \(error)")
        }
    }
    
    func getCampaign(campaignName:String,folderName:String) -> [CampaignModel] {
        guard let url = getURLForCampaign(campaignName: campaignName, folderName: folderName) else {return []}
              do {
                  let jsonData = try Data(contentsOf: url)
                  let readingData = try JSONDecoder().decode([CampaignModel].self, from: jsonData)
                  return readingData
              } catch let error {
                  print("error \(error)")
                  return []
              }
        
        
    }
    
    func getURLForCampaign(campaignName:String,folderName:String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else { return nil }
        return folderURL.appendingPathComponent("CampaignData.json")
    }
    
    
    
    func getImage(imageName: String,folderName: String) -> UIImage?{
         
        guard let url = getURLForImage(imageName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path) else { return nil }
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error {
                print("error creating directory \(folderName) \(error)")
            }
            
        }
    }
    
    private func getURLForFolder(folderName:String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return  nil }
        return url.appendingPathComponent(folderName)
        
    }
    
    private func getURLForImage(imageName: String,folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else {return nil}
        return folderURL.appendingPathComponent(imageName + ".png")
        
        
    }
    
    
}




