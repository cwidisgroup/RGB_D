# RGB_D
* This repo contains the information how to seperate the RGB and D stream with their meta data and encode it and reproduce point cloud from it. 
* The original file is stored at: **\\server\PampusData\Ashu\CWIPC_RGBD**

## Problem using FFmpeg commands
* By using the FFmpeg commands, we can extract the streams, but we can not play the streams using Kinnect Aizure Viewer
* This is needed, otherwise, we can not construct a point cloud from the video (RGB + D + IR + Calibration data) that we have


## MKVToolNIX
* We use MKVToolNIX to extract the streams 
* For RGB, No tags is needed and also no global tags
* For D, Local tags is needed, but no global is needed
* For IR, the stream was extrated, but it can not be opened in Kinnect Aizure Viewer

## Creation of Point Cloud using RGB and D streams without any compression
* MKVToolNIX is used to combine the RGB and D streams along with their tags and Global Tags.
* We will use CWIPC to construct the point cloud
* RGB_D along with their tags and Global Tags is stored in a single file RGB_D.mkv and can be accessed at: **\\server\PampusData\Ashu\CWIPC_RGBD**
* CameraConfigFile is also stored at:\ **\\server\PampusData\Ashu\CWIPC_RGBD**
* Command to create the point cloud is: **cwipc_grab --k4aoffline --binary --fpattern timestamp:08d --inpoint 5727933 --outpoint 36561266 --nodrop --outliers 30 1.1 1 ply**


## Creation of Point Cloud using RGB and D streams with compression
* Extracting images for RGB Video.
**ffmpeg -i RGB.mkv -map 0:0 -vsync 0 -c:v copy RGB-%04d.png**
**ffmpeg -i .\RGB_WithMeta.mkv RGB-%04d.png**

* The below four commands could be used to reconstruct the RGB file. 

* ffmpeg -i RGB-%04d.png -pix_fmt yuv420p -r 30 -s 2048:1536 RG1.mkv
* ffmpeg -f image2 -framerate 30 -i RGB-%04d.png -s 2048x1536 -pix_fmt yuv422p rg.mkv
* ffmpeg -framerate 30 -i RGB-%04d.png -c:v mjpeg -s 2048x1536 -pix_fmt bgr24 RGB_2.mkv
* ffmpeg -framerate 30 -i RGB-%04d.png -c:v copy --enable-decoder=mjpeg,png RGB_1.mkv

