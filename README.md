# Version

Automatically generate a version file, with the build number and the year, every time you build your project in Team Foundation Server.

## How to Use

1. Copy files into your project folder.
2. Include Version.rc file into your C/C++ project ([How to] (https://msdn.microsoft.com/en-us/library/6e7446zd.aspx)).
3. Commit Version.rc and Version.ps1 (Version.txt should be excluded).
4. Add Version.ps1 to the build process template: Build->Advanced->Pre-build script path.
5. Build the project.
