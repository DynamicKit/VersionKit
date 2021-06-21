//
//  AppVersion.swift
//  VersionKit
//
//  Created by Mohammad reza Koohkan on 4/10/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation

/// # App Version
/// Stores an app version and provides availablity services
///
public struct AppVersion {

    /// Returns standard version components type
    ///
    public typealias VersionComponent = (major: Int, minor: Int, patch: Int)
    
    /// Returns version assosiated with object
    ///
    public let version: String
    
    /// Returns major version
    ///
    public let major: Int
    
    /// Returns minor version
    ///
    public let minor: Int
    
    /// Returns patch version
    ///
    public let patch: Int
    
    /// Returns current application version checker
    ///
    public static let current: AppVersion = .init(version: applicationVersion)!
    
    /// Returns current application version from info.plist
    ///
    private static var applicationVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    /// Returns current application build number from info.plist
    ///
    private static var applicationBuildNumber: String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as! String
    }
    
    /// Returns major, minor and patch from given version
    ///
    public let components: VersionComponent
    
//        guard VersionChecker.isCorrect(version) else { return nil }
//        let versionComponents = version.components(separatedBy: ".").map { Int($0)! }
//        let major = versionComponents[0]
//        let minor = versionComponents[1]
//        let patch = versionComponents[2]
//        return (major,minor,patch)
//    }
    
    /// Creates an instance of `VersionChecker` with given version
    ///
    /// This initializer returns nil if given version is not in correct format
    /// Supported formats: 1.0.0 or 10.00.00 or ... (Int.Int.Int)
    ///
    public init?(version: String) {
        let components = version.components(separatedBy: ".").compactMap(Int.init)
        guard AppVersion.isCorrect(version), components.count == 3 else { return nil }
        self.version = version
        major = components[0]
        minor = components[1]
        patch = components[2]
        self.components = (major,minor,patch)
    }
    
    /// Returns result of evaluating lower bound of current version and given version
    ///
    public func isLower(thanVersion newVersion: String) -> Bool {
        guard let newVersion = AppVersion(version: newVersion) else { return false }
        if newVersion.major < major {
            return false
        }else if newVersion.major > major {
            return true
        }else if newVersion.minor < minor {
            return false
        }else if newVersion.minor > minor {
            return true
        }else if newVersion.patch < patch {
            return false
        }else if newVersion.patch > patch {
            return true
        }
        return false
    }

    /// Returns result of evaluating higher bound of current version and given version
    ///
    public func isHigher(thanVersion newVersion: String) -> Bool {
        guard let newVersion = AppVersion(version: newVersion) else { return false }
        if newVersion.major < major {
            return true
        }else if newVersion.major > major {
            return false
        }else if newVersion.minor < minor {
            return true
        }else if newVersion.minor > minor {
            return false
        }else if newVersion.patch < patch {
            return true
        }else if newVersion.patch > patch {
            return false
        }
        return false
    }
    
    /// Returns where given version is equal to current version
    ///
    public func isEqual(to equalVersion: String) -> Bool {
        guard let equalVersion = AppVersion(version: equalVersion) else { return false }
        return equalVersion.major == major
            && equalVersion.minor == minor
            && equalVersion.patch == patch
    }
    
    /// Returns validation result of given version
    ///
    /// Validation constraints: major.minor.patch && Int.Int.Int
    ///
    ///     var example = "1.0.0"
    ///
    private static func isCorrect(_ version: String) -> Bool {
        return isThreePart(version) && isIntegarParts(version)
    }
    
    /// Check whether given version is in the currect format
    ///
    /// major.minor.patch is the correct format
    ///
    private static func isThreePart(_ version: String) -> Bool {
       return version
            .components(separatedBy: ".")
            .count == 3
    }
    
    /// Check whether given version is integar literal
    ///
    /// 1.0.0 is the correct format
    ///
    private static func isIntegarParts(_ version: String) -> Bool {
        return version
            .components(separatedBy: ".")
            .filter { Int($0) == nil }
            .isEmpty
    }
}

