#!/bin/bash


# to copy the stream from input file to the output file
ffmpeg -i output_master.mkv -c copy  -map 0:0 temp_0.mkv