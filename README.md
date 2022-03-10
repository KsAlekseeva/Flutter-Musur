# Musur

A new Flutter project.

## Building

This section is only for collaborators.

The built app must be signed, otherwise Spotify SDK won't work.

To do that, after cloning a project, add `android/key.properties` file with the
following contents:

```
storePassword=<password>
keyPassword=<password>
keyAlias=musur
storeFile=<path-to-your/musur-keystore.jks>
```
