# TAKUUID

Generate UUID and save to KeyChain.

## Build Status

### master
[![Build Status](https://travis-ci.org/taka0125/TAKUUID.svg?branch=master)](https://travis-ci.org/taka0125/TAKUUID)

### develop
[![Build Status](https://travis-ci.org/taka0125/TAKUUID.svg?branch=develop)](https://travis-ci.org/taka0125/TAKUUID)

# How to use

## Podfile

```ruby
pod 'TAKUUID'
```

or

```ruby
pod 'TAKUUID', :git => 'https://github.com/taka0125/TAKUUID.git'
```

## Project Setting

- "Keychain Sharing" on

# Usage

## findOrCreate

If UUID already created, return it.
If not creating UUID yet, create and return it.

- Objective-C

```objectivec
NSString *UUID = [[TAKUUIDStorage sharedInstance] findOrCreate];
```

- Swift

```swift
let UUID = TAKUUIDStorage.sharedInstance().findOrCreate()
```

## renew

renew UUID.

- Objective-C

```objectivec
NSString *UUID = [[TAKUUIDStorage sharedInstance] renew];
```

- Swift

```swift
let UUID = TAKUUIDStorage.sharedInstance().renew()
```

## remove

remove UUID from Keychain.

- Objective-C

```objectivec
BOOL isSuccess = [[TAKUUIDStorage sharedInstance] remove];
```

- Swift

```swift
let isSuccess = TAKUUIDStorage.sharedInstance().remove()
```

## last error

get last error.

- Objective-C

```objectivec
OSStatus status = [TAKUUIDStorage sharedInstance].lastErrorStatus;
```

- Swift

```swift
let status = TAKUUIDStorage.sharedInstance().lastErrorStatus
```

### show error detail from code

```console
$ macerror CODE
```
