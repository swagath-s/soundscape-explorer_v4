# soundscape-explorer_v4
An auditory VR navigator

This was a project me and my two team-mates had done for the interim semester.

We created a cluster of soundscapes organised in two dimentions that you could navigate by physically turning in the direction you wished to move and pressing a button. The user's orientation was sensed an Android phone mounted on a helmet.

A map of Yelahanka was divided into a grid and each square assigned a landmark. Soundscapes of the landmarks were made. The user starts off (virtually) middle square. He/she hears the soundscape of the occupied cell on earphones, and soundscapes of the adjacent cells from speakers mounted on all four walls. They can face any side whose soundscape they are curious about, and press a button to virtually jump to that cell. That cell now becomes the occupied cell, the soundscape of which plays on the earphones. All sounds move accordingly. The user can in this manner traverse the entire map.

Technical details:

Android phone sensed orientation and sent it over Bluetooth to an Arduino, which in turn sent the info over serial to Processing. Processing, using Minim's functionality and depending on code logic and button-press, sent 4 stereo streams of audio over to four USB soundcards outputting to the 4 respective wall-mounted speakers.


(Bad) pictures can be viewed here: https://drive.google.com/open?id=0BzH1md5pDn6BMnpTUzhBTjVWS2c


Documentation is not my strong suite. Working on it.
