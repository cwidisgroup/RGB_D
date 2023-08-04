# RGB_D
* This repo contains the information how to seperate the RGB and D stream with their meta data and encode it and reproduce point cloud from it. 
* The original file is stored at: \\server\PampusData\Ashu\CWIPC_RGBD

## Problem using FFmpeg commands
* By using the FFmpeg commands, we can extract the streams, but we can not play the streams using Kinnect Aizure Viewer
* This is needed, otherwise, we can not construct a point cloud from the video (RGB + D + IR + Calibration data) that we have


## MKVToolNIX
* We use MKVToolNIX to extract the streams 
* For RGB, No tags is needed and also no global tags
* For D, Local tags is needed, but no global is needed
* For IR, the stream was extrated, but it can not be opened in Kinnect Aizure Viewer