# TAKUUID

Generate UUID and save to KeyChain.

## Build Status

### master
[![Build Status](https://travis-ci.org/taka0125/TAKUUID.svg?branch=master)](https://travis-ci.org/taka0125/TAKUUID)

# How to use

## Podfile

```ruby
pod 'TAKUUID'
```

or

```ruby
pod 'TAKUUID', :git => 'https://github.com/taka0125/TAKUUID.git'
```

## Carthage

```
github "taka0125/TAKUUID"
```

## Project Setting

- "Keychain Sharing" on

http://stackoverflow.com/questions/20344255/secitemadd-and-secitemcopymatching-returns-error-code-34018-errsecmissingentit/31421742#31421742

# Usage

## Keychain access group (Optional)

First of all, set keychain access group.
Then call `findOrCreate`.

- Objective-C

```objectivec
[TAKUUIDStorage sharedInstance].accessGroup = @"12ABCD3E4F.shared";
```

- Swift

```swift
TAKUUIDStorage.sharedInstance().accessGroup = "12ABCD3E4F.shared"
```

### migrate

after set keychain access group, call `migrate` method.

- Objective-C

```
[[TAKUUIDStorage sharedInstance] migrate];
```

- Swift

```
TAKUUIDStorage.sharedInstance().migrate()
```

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
