# Version

Automatically generate a version file, with the build number and the year, every time you build your project in Team Foundation Server.

## How to Use (XAML Build)

1. Copy files into your project folder (Version.rc, Version.txt and Version.ps1).
2. Include Version.rc file into your C/C++ project ([How to] (https://msdn.microsoft.com/en-us/library/6e7446zd.aspx)).
3. Commit Version.rc, Version.txt and Version.ps1.
4. Add Version.ps1 to the build process template: Build->Advanced->Pre-build script path.
5. Build the project.

## How to Use (TFS Build)

1. Copy files into your project folder (Version.rc, Version.txt, Set-VersionNumber.ps1, Get-ReleaseBinaries.ps1).
2. Include Version.rc file into your C/C++ project ([How to] (https://msdn.microsoft.com/en-us/library/6e7446zd.aspx)).
3. Commit Version.rc, Version.txt, Set-VersionNumber.ps1 and Get-ReleaseBinaries.ps1.
4. Create build definition (see the pictures).
5. Build the project.
