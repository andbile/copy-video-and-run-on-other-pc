# получаем процесc 
$process_id = (Get-Process "mpc-hc64" -ErrorAction SilentlyContinue).id
$process_id | Out-Host

# убиваем процес
if($process_id){
    Stop-Process -Id $process_id -Force
    Start-Sleep -Seconds 1
}

$video_source = '\\share\_video\'
$video_destination = 'C:\script\video\'


# создаем папку, если она отсутствует
if (!(Test-Path -Path $video_destination)){
    New-Item -Path $video_destination -ItemType Directory
}


# очистка папки
Remove-Item -Path ($video_destination + '*.*') -Force -Recurse


#Copy-Item -Filter *.mp4 -Path $video_source -Destination $video_destination -Force
$fileFilter = '*.mp4', '*.mov'

$files = Get-ChildItem -Include $fileFilter -Path $video_source -Force -Recurse #| Sort-Object -Descending -Property LastWriteTime -top 1
$files | Out-Host 
Copy-Item $files -Destination $video_destination -Force

# запускаем проигрователь
$mpc = "C:\Program Files (x86)\K-Lite Codec Pack\MPC-HC64\mpc-hc64.exe"
Start-Process -FilePath $mpc -ArgumentList "C:\script\video\"