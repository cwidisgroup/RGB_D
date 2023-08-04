#!/bin/bash

# to copy the stream from input file to the output file
ffmpeg -i output_master.mkv -c copy  -map 0:0 temp_0.mkv

# to copy the stream from input file to the output file Depth and IR
ffmpeg -i output_master.mkv -c:v ffv1 -pix_fmt gray16be -allow_raw_vfw 1 -map 0:1 temp_1.mkv
ffmpeg -i output_master.mkv -c:v ffv1 -pix_fmt gray16be -allow_raw_vfw 1 -map 0:2 temp_2.mkv

# to get the configuration file 
ffmpeg -dump_attachment:3 calibration.json -i output_master.mkv

# to show the metadata from all the streams and store them in metadata.txt
ffprobe -v quiet -show_format -show_streams -print_format json output_master.mkv > metadata_out.txt

# to attach json meta data and video together
ffmpeg -i temp_0.mkv -i temp_1.mkv -i temp_2.mkv -c copy -map 0:0 -map 1:0 -map 2:0 -allow_raw_vfw 1 -attach calibration.json -metadata:s:3 mimetype=application/octet-stream out.mkv
