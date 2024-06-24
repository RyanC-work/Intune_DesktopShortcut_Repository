#Variables creating local folder and download .ico file
$LocalIconFolderPath = "C:\URLIcon"
$SourceIcon = "*****WEBSITE REQUIRED*****"
$DestinationIcon = "C:\URLIcon\MSEdge.ico"


#Step 1 - Create a folder to place the URL icon
New-Item $LocalIconFolderPath -Type Directory

#Step 2 - Download a ICO file from a website into previous created folder
curl $SourceIcon -o $DestinationIcon

#Step 3 - Add the custom URL shortcut to your Desktop with custom icon
$new_object = New-Object -ComObject WScript.Shell
$destination = $new_object.SpecialFolders.Item('Desktop')
$source_path = Join-Path -Path $destination -ChildPath '\\MECC Gateway.lnk'
$source = $new_object.CreateShortcut($source_path)
$source.TargetPath = 'https://www.meccgateway.co.uk/nenc'
$source.IconLocation = ”C:\URLIcon\MSEdge.ico”
$source.Save()