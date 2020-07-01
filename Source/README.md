**CLASS**

# `AppVersion`

```swift
public final class AppVersion
```

# App version
Stores an app version and provides methods

## Properties
### `versionComponents`

```swift
public lazy var versionComponents: (major: Int, minor: Int, patch: Int) = {
    return AppVersion.components(version: self.version)!
}()
```

Returns components from assosiated version

## Methods
### `init(version:)`

```swift
public init?(version: String)
```

Creates an instance of `AppVersion` with given version

This initializer returns nil if given version is not in correct format
Supported formats: 1.0.0 or 10.00.00 or ... (Int.Int.Int)

### `init()`

```swift
public convenience init?()
```

Creates an instance of `AppVersion` with current version from info.plist

This initializer returns nil if given version is not in correct format
Supported formats: 1.0.0 or 10.00.00 or ... (Int.Int.Int)

### `components(version:)`

```swift
public class func components(version: String) -> (major: Int, minor: Int, patch: Int)?
```

Returns major, minor and patch from given version

### `isLower(thanVersion:)`

```swift
public func isLower(thanVersion newVersion: String) -> Bool
```

Returns result of evaluating lower bound of current version and given version

### `isHigher(thanVersion:)`

```swift
public func isHigher(thanVersion newVersion: String) -> Bool
```

Returns result of evaluating higher bound of current version and given version

### `isEqual(to:)`

```swift
public func isEqual(to equalVersion: String) -> Bool
```

Returns where given version is equal to current version
