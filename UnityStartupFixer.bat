
set UNITY_PATH=C:\Program Files\Unity

set UNITY_EDITOR_PATH=%UNITY_PATH%\Editor
set UNITY_7Z=%UNITY_EDITOR_PATH%\Data\Tools\7z.exe
set UNITY_PACKAGES_PATH=%UNITY_EDITOR_PATH%\Data\Resources\Packages

set UNITY_ROAMING=%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Unity
set UNITY_ROAMING_PACKAGES=%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Unity\Packages
set UNITY_ROAMING_NODEMODULES=%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Unity\Packages\node_modules

rmdir /s /q "%UNITY_ROAMING_PACKAGES%"

mkdir "%UNITY_ROAMING%"
mkdir "%UNITY_ROAMING_PACKAGES%"

copy /Y "%UNITY_PACKAGES_PATH%\package.json" "%UNITY_ROAMING_PACKAGES%\"

"%UNITY_7Z%" x -y -o"%UNITY_ROAMING_PACKAGES%\" "%UNITY_PACKAGES_PATH%\*.tgz"

"%UNITY_7Z%" x -y -o"%UNITY_ROAMING_NODEMODULES%\" "%UNITY_ROAMING_PACKAGES%\unityeditor-cloud-hub*.tar" 
move /Y "%UNITY_ROAMING_NODEMODULES%\package" "%UNITY_ROAMING_NODEMODULES%\unityeditor-cloud-hub"

"%UNITY_7Z%" x -y -o"%UNITY_ROAMING_NODEMODULES%\" "%UNITY_ROAMING_PACKAGES%\unityeditor-collab-history*.tar" 
move /Y "%UNITY_ROAMING_NODEMODULES%\package" "%UNITY_ROAMING_NODEMODULES%\unityeditor-collab-history"

"%UNITY_7Z%" x -y -o"%UNITY_ROAMING_NODEMODULES%\" "%UNITY_ROAMING_PACKAGES%\unityeditor-collab-toolbar*.tar" 
move /Y "%UNITY_ROAMING_NODEMODULES%\package" "%UNITY_ROAMING_NODEMODULES%\unityeditor-collab-toolbar"

"%UNITY_7Z%" x -y -o"%UNITY_ROAMING_NODEMODULES%\" "%UNITY_ROAMING_PACKAGES%\unity-editor-home*.tar" 
move /Y "%UNITY_ROAMING_NODEMODULES%\package" "%UNITY_ROAMING_NODEMODULES%\unity-editor-home"

del "%UNITY_ROAMING_PACKAGES%\*.tar"
