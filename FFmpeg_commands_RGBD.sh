#!/bin/bash

# to copy the stream from input file to the output file
ffmpeg -i output_master.mkv -c copy  -map 0:0 temp_0.mkv

# to copy the stream from input file to the output file Depth and IR
ffmpeg -i output_master.mkv -c:v ffv1 -pix_fmt gray16be -allow_raw_vfw 1 -map 0:1 temp_1.mkv
ffmpeg -i output_master.mkv -c:v ffv1 -pix_fmt gray16be -allow_raw_vfw 1 -map 0:2 temp_2.mkv

# to get the configuration file 
ffmpeg -dump_attachment:3 calibration.json -i output_master.mkv