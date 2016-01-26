//
//  SSFileManager.swift
//  SSFileManager
//
//  Created by dulingkang on 16/1/26.
//  Copyright © 2016年 Shawn. All rights reserved.
//


func kCachesPath() -> String! {
    return NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).first!
}

func kCachesUrl() -> NSURL! {
    return NSFileManager.defaultManager().URLsForDirectory(.CachesDirectory, inDomains: .UserDomainMask).first
}

func kDocPath() -> String! {
    return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
}

func createFolder(folderName: String, searchPathDir: NSSearchPathDirectory) {
    let fileManager = NSFileManager.defaultManager()
    let dir: NSString = NSSearchPathForDirectoriesInDomains(searchPathDir, .UserDomainMask, true).first!
    let folder = dir.stringByAppendingPathComponent(folderName)
    if !fileManager.fileExistsAtPath(folder){
        do {
            try fileManager.createDirectoryAtPath(folder, withIntermediateDirectories: true, attributes: nil)
        } catch {}
    }
}