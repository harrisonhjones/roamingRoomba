# Useful Commands #
## Taking a Picture ##
```
fswebcam --no-info --no-overlay --no-title --no-bannex480 -S 15 dataset1/frame-5.jpg
```
Takes a picture using the default device, /dev/video0, with no overlay or info, after skipping 15 frames (lets the camera turn on and autofocus), and saves it as 'frame-5.jpg'

## Moving the Roomba forward ##
```
./roombacmd/roombacmd -p /dev/ttyUSB0 -V 250 -f -w 1000 -s
```
Moves the Roomba forward at 250mm/s, waits for 1s (1000ms), and then stops

## Rotating the Roomba clockwise 90 degrees ##
```
./roombacmd/roombacmd -p /dev/ttyUSB0 -V 100 -r -w 2432 -s
```
Rotates the Roomba clockwise, waits 2432 seconds, and then stop which results in an approximate 90 degree turn on the carpet in my room

## Rotating the Roomba counter-clockwise 90 degrees ##
```
./roombacmd/roombacmd -p /dev/ttyUSB0 -V 100 -l -w 2432 -s
```
Rotates the Roomba counter-clockwise, waits 2432 seconds, and then stop which results in an approximate 90 degree turn on the carpet in my room