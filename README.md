# Musur

A minimal Spotify client written in Flutter.

## Design 

This link can redirect you to our [Figma project](https://www.figma.com/file/4YjNgWoq6JNSp1sFMbu3iB/Neumorphism-Music-App-(Community)?node-id=12%3A166).

## Building

This section is only for collaborators.

The project with its key hash should be added to the [Spotify API Dashboard](https://developer.spotify.com/dashboard/),
and then the app's build should be signed with this key - otherwise Spotify SDK won't work.

[A guide to generate a keystore.](https://docs.flutter.dev/deployment/android#create-an-upload-keystore)

To sign the app build, after cloning a project, add `android/key.properties` file with the
following contents:

```
storePassword=<password>
keyPassword=<password>
keyAlias=musur
storeFile=<path-to-your/musur-keystore.jks>
```
