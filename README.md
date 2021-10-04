# KeyCheck

Check if a BTC's wallet private key matches the public address.

This app may be useful for validating paper wallets.


## Null safety
Some of the dependencies do not provide null safety. 
For now, we have to test / run with null safety off, as shown below.

## Test without null safety
```
flutter test --no-sound-null-safety
```

## Run without null safety
```
flutter run --no-sound-null-safety
```

# Notes

When validating an actual wallet, you may want to 
1. Put the phone in airplane mode
2. Validate your wallet
3. Kill the app
4. Deactivate the airplane mode

The current version of the app was not tested on iOS, only on Android.
It does not work in the browser.

Please do not send any crypto to the test addresses used in this app - it will be lost forever!