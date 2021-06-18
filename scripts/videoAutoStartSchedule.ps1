$video_destination = 'C:\script\video\'

# запускаем проигрователь
$mpc = "C:\Program Files (x86)\K-Lite Codec Pack\MPC-HC64\mpc-hc64.exe"
Start-Process -FilePath $mpc -ArgumentList $video_destination
