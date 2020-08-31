//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Nikhi on 31/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }
        
        set {
            subtitle = newValue
        }
    }
}


