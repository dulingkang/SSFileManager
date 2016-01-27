//
//  SSFileManager.swift
//  SSFileManager
//
//  Created by dulingkang on 16/1/26.
//  Copyright © 2016年 Shawn. All rights reserved.
//


public func kCachesPath() -> String! {
    return NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).first!
}

public func kCachesUrl() -> NSURL! {
    return NSFileManager.defaultManager().URLsForDirectory(.CachesDirectory, inDomains: .UserDomainMask).first
}

public func kDocPath() -> String! {
    return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
}

public func createFolder(folderName: String, searchPathDir: NSSearchPathDirectory) {
    let fileManager = NSFileManager.defaultManager()
    let dir: NSString = NSSearchPathForDirectoriesInDomains(searchPathDir, .UserDomainMask, true).first!
    let folder = dir.stringByAppendingPathComponent(folderName)
    if !fileManager.fileExistsAtPath(folder){
        do {
            try fileManager.createDirectoryAtPath(folder, withIntermediateDirectories: true, attributes: nil)
        } catch {}
    }
}

public func caculateFileSize(path: String) -> UInt64 {
    var size: UInt64 = 0
    do {
        let attr: NSDictionary = try NSFileManager.defaultManager().attributesOfItemAtPath(path)
        size = attr.fileSize()
    } catch {}
    return size
}

public func saveFileAtFolderWithName(location: NSURL, folder:String, name: String) -> String? {
    let fullFolder = getFolder(folder)
    let lastTwoComponent = folder + name
    let fullPath = fullFolder + name
    let destUrl = kCachesUrl().URLByAppendingPathComponent(lastTwoComponent)
    if NSFileManager.defaultManager().fileExistsAtPath(fullPath) {
        do {
            try NSFileManager.defaultManager().removeItemAtPath(fullPath)
        } catch {}
    }
    do {
        try NSFileManager.defaultManager().moveItemAtURL(location, toURL: destUrl)
        return fullPath
    } catch let error as NSError {
        print("saveFileError:\(error.domain)")
        return nil
    }
}

private func getFolder(folderName: String) -> String! {
    createFolder(folderName, searchPathDir: .CachesDirectory)
    return kCachesPath() + "/" + folderName + "/"
}
