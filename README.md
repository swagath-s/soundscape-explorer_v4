# soundscape-explorer_v4
An auditory VR navigator

This was a project me and my two team-mates had done for the interim semester.

We created a cluster of soundscapes organised in two dimentions that you could navigate using an orientation-sensor mounted on a helmet and a button.

Android phone sensed orientation and sent it over Bluetooth to an Arduino, which in turn set it over serial to Processing. Processing, using Minim's functionality, sent 4 channels of audio over to four USB soundcards, which connected to four sets of wall-mounted speakers. Additional Arduino sensed button-press.

(Bad) pictures can be viewed here: https://drive.google.com/open?id=0BzH1md5pDn6BMnpTUzhBTjVWS2c


Documentation is not my strong suite. Working on it. Sorry.
