//
//  AppVersion.swift
//  VersionKit
//
//  Created by Mohammad reza Koohkan on 4/10/1399 AP.
//  Copyright © 1399 AP Mohamadreza Koohkan. All rights reserved.
//

import Foundation

/// # App version
/// Stores an app version and provides methods
///
public final class AppVersion {
    
    /// Returns current application version from info.plist
    ///
    public class var applicationVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    /// Returns current application build number from info.plist
    ///
    public class var applicationBuildNumber: String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as! String
    }
    
    /// Returns version assosiated with object
    ///
    public let version: String
    
    /// Returns components from assosiated version
    ///
    public lazy var versionComponents: (major: Int, minor: Int, patch: Int) = {
        return AppVersion.components(version: self.version)!
    }()
    
    /// Creates an instance of `AppVersion` with given version
    ///
    /// This initializer returns nil if given version is not in correct format
    /// Supported formats: 1.0.0 or 10.00.00 or ... (Int.Int.Int)
    ///
    public init?(version: String) {
        guard AppVersion.isCorrect(version) else { return nil }
        self.version = version
    }
    
    /// Creates an instance of `AppVersion` with current version from info.plist
    ///
    /// This initializer returns nil if given version is not in correct format
    /// Supported formats: 1.0.0 or 10.00.00 or ... (Int.Int.Int)
    ///
    public convenience init?() {
        let version = AppVersion.applicationVersion
        guard AppVersion.isCorrect(version) else { return nil }
        self.init(version: version)
    }
    
    /// Returns major, minor and patch from given version
    ///
    public class func components(version: String) -> (major: Int, minor: Int, patch: Int)? {
        guard AppVersion.isCorrect(version) else { return nil }
        let versionComponents = version.components(separatedBy: ".").map { Int($0)! }
        let major = versionComponents[0]
        let minor = versionComponents[1]
        let patch = versionComponents[2]
        return (major,minor,patch)
    }
    
    /// Returns result of evaluating lower bound of current version and given version
    ///
    public func isLower(thanVersion newVersion: String) -> Bool {
        guard AppVersion.isCorrect(newVersion) else { return false }
        let new = AppVersion.components(version: newVersion)!
        if new.major < self.versionComponents.major {
            return false
        }else if new.major > self.versionComponents.major{
            return true
        }else if new.minor < self.versionComponents.minor {
            return false
        }else if new.minor > self.versionComponents.minor {
            return true
        }else if new.patch < self.versionComponents.patch {
            return false
        }else if new.patch > self.versionComponents.patch {
            return true
        }
        return false
    }

    /// Returns result of evaluating higher bound of current version and given version
    ///
    public func isHigher(thanVersion newVersion: String) -> Bool {
        guard AppVersion.isCorrect(newVersion) else { return false }
        let new = AppVersion.components(version: newVersion)!
        if new.major < self.versionComponents.major {
            return true
        }else if new.major > self.versionComponents.major{
            return false
        }else if new.minor < self.versionComponents.minor {
            return true
        }else if new.minor > self.versionComponents.minor {
            return false
        }else if new.patch < self.versionComponents.patch {
            return true
        }else if new.patch > self.versionComponents.patch {
            return false
        }
        return false
    }
    
    /// Returns where given version is equal to current version
    ///
    public func isEqual(to equalVersion: String) -> Bool {
        guard AppVersion.isCorrect(equalVersion) else { return false }
        return self.versionComponents == AppVersion.components(version: equalVersion)!
    }
    
    /// Returns validation result of given version
    ///
    /// Validation constraints: major.minor.patch && Int.Int.Int
    ///
    ///     var example = "1.0.0"
    ///
    private class func isCorrect(_ version: String) -> Bool {
        return isThreePart(version) && isIntegarParts(version)
    }
    
    /// Check whether given version is in the currect format
    ///
    /// major.minor.patch is the correct format
    ///
    private class func isThreePart(_ version: String) -> Bool {
        let condition = version.components(separatedBy: ".").count == 3
        return condition
    }
    
    /// Check whether given version is integar literal
    ///
    /// 1.0.0 is the correct format
    ///
    private class func isIntegarParts(_ version: String) -> Bool {
        let condition = version.components(separatedBy: ".").filter { Int($0) == nil }.isEmpty
        return condition
    }
    
}

