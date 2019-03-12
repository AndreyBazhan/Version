# Version

Automatically generate version information in a C/C++ project with Azure DevOps.

## How to Use

1. Copy the Version.rc file to your project folder.
2. Include the Version.rc file in the project ([How to](https://docs.microsoft.com/en-us/cpp/windows/how-to-include-resources-at-compile-time?view=vs-2017#to-include-resources-in-your-project-at-compile-time)).
3. Add the definitions to your resource.h file.
```
#define APP_NAME            "AppName"
#define APP_FILE_NAME       APP_NAME ".exe"
#define APP_COMPANY_NAME    "Company Name"
#define APP_WEB_SITE        "Web Site"
#define APP_COPYRIGHT       "Copyright (C) " APP_COPYRIGHT_YEAR " Name"
#define APP_DESCRIPTION     "Application Description"
```
4. Add the compiler's preprocessor definitions ([How to](https://docs.microsoft.com/en-us/cpp/build/reference/d-preprocessor-definitions?view=vs-2017#to-set-this-compiler-option-in-the-visual-studio-development-environment)).
```
APP_VERSION="$(AppVersion)";APP_COPYRIGHT_YEAR="$([System.DateTime]::Now.Year.ToString())"
```
5. Add the resource compiler's preprocessor definitions.
```
APP_VERSION=\"$(AppVersion)\";APP_VERSION_BINARY=$(AppVersion.Replace('.', ','));APP_COPYRIGHT_YEAR=\"$([System.DateTime]::Now.Year.ToString())\"
```
6. Add the AppVersion property element to your project file (.vcxproj).
```
  <PropertyGroup>
    <AppVersion Condition="'$(AppVersion)' == ''">0.0</AppVersion>
  </PropertyGroup>
```
7. Add the AppVersion variable to your build pipeline.
![Alt text](AzureDevOps/BuildPipelineVariables.png?raw=true "Build Pipeline Variables")
8. Commit the changes.
9. Build the project.

*Note: If you need to build your project with version number locally, you can set the environment variable `$env:AppVersion="1.0"` in a PowerShell console, then open the solution from the console and build the project.*

## How to display version information in a console application

```
_tprintf(_T("\n%s %s - %s\n"), _T(APP_NAME), _T(APP_VERSION), _T(APP_DESCRIPTION));
_tprintf(_T("%s\n"), _T(APP_COPYRIGHT));
_tprintf(_T("%s\n\n"), _T(APP_WEB_SITE));

_tprintf(_T("Usage: %s <Arguments>\n\n"), _T(APP_FILE_NAME));
```
