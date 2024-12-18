# Biocache-hubs


## Usage

Compile and test:
```
make jar
```

Make a release. This will update the version in `build.gradle` and create a new tag and push it. A new jar will then be built on GitHub and deployed to GitHub packages. This jar-file is used as a dependency in [ala-hub](https://github.com/biodiversitydata-se/ala-hub/blob/master/sbdi/README.md). 
```
make release
```
