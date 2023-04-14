//
//  NowYouSeeMe.swift
//  NowYouSeeMe
//
//  Created by Naveen Chaudhary on 27/05/20.
//  Copyright © 2020 Flipkart. All rights reserved.
//

import Foundation

/**
 NowYou(SeeMe): The main entry point to the view tracking framework.
 
 Provides access of the tracking framework to the outside world and also handles the current state of the tracking framework.
 
 - Important: The framework needs to be initialised by calling ```NowYou.seeMe()``` before adding any view for tracking.
 */
@objc public final class NowYou: NSObject {
    /**
     Enables view tracking
     
     This method should be called after the app is launched and before starting view tracking.
     
     - Important: None of the calls to trackView() will go through before calling ```NowYou.seeMe()```
    */
    @objc public static func seeMe() {
        // start swizzling
        _ = swizzleUIViewForTracking
        _ = swizzleUIViewControllerForTracking

        // sets watching to true
        watching = true
    }

    /**
     Disables view tracking
     
     This method disables callbacks for views being tracked.
     
     - Note: All the views will still be tracked by the framework but the callback will be provided only for the selected views
    */
    internal static func dont() {
        watching = false
    }

    /**
     Boolean which stores the current tracking status
     
     - **true** -> framework is **enabled**
     - **false** -> framework is **disabled**
    */
    internal private(set) static var watching: Bool = false
}
