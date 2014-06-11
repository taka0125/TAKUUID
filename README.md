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

```objectivec
NSString *UUID = [[TAKUUIDStorage sharedInstance] findOrCreate];
```

## renew

renew UUID.

```objectivec
NSString *UUID = [[TAKUUIDStorage sharedInstance] renew];
```

## remove

remove UUID from Keychain.

```objectivec
BOOL isSuccess = [[TAKUUIDStorage sharedInstance] remove];
```
