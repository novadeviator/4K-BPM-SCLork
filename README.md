# 4K-BPM-SCLork

"4K/BPM SCLOrk" is an electronic composition for any amount of laptop performers - but preferably 10 or more. It is written in SuperCollider and developed for Santa Clara University's laptop orchestra, thanks to Bruno Ruviaro. The composition is based on an 8-channel sound installation "4K/BPM Sonoretum" created for "Sonoretum" project at KAPELICA gallery in Ljubljana in 2014, thanks to Marko Košnik, Sandra Sajovic and Jurij Krpan.

## User's guide

In constrast to the Sonoretum version, which was created as an autonomously-running algorhythmic composition, SCLOrk version needs laptop performers and appropriate setup.

### Instruments setup:

It is assumed that performers are using the following software/hardware setup:
- a laptop
- OS: Ubuntu Linux 14.04
- SuperCollider using scide version 3.6.6 or above
- Precision Time Protocol daemon installed (package:ptpd)
- various midi controllers (QuNeo, Wiimote, Korg NanoKontrol)
- Audio interface with first left output connected to a speaker
- network connection to a local LAN
- outputs 3 and 4 go to headphones
- all laptops and its audio interfaces have the same audio latency



### Performer's preparation

This SuperCollider patch introduces number of sound generators, 3 effects (comb filter, low-pass filter and reverb) and a master gain. Each generator, or more precisely its gain, is mapped to a midi control (CC) number. The three effects and master gain are also assigned to a midi control (CC) number. This is visible and changable under section "MIDI CONTROLS" in the patch. The patch can be started by simply loading it into SuperCollider IDE and evaluating it. Once running (see bottom-right of the IDE for something like "321u" meaning 321 UGens are running) a performer can control volume of every single generator, the effects and the master out using an external midi controller device.

In the phase of the preparation and getting familiar with all the generators a performer should adjust midi control numbers so that it suits her controller device. She should prelisten all generators and check if effects and master gain are being properly controlled by her device. Creative play is advised and encouraged.

At the next stage each performer should arrive at the three controlling generators which she will control in the piece. This can be done in different ways. It is suggested that all of generators are covered, if necessary multiple times. In other words, equal distribution of all generators should be achived. The most simple method is such that each performer is assigned one generator consecutively and cycle through number of performers and number of generators until each performer has three generators assigned. But, as said, there are different creative ways how to assign generators to performers (dice? random generator? discussion?).

Once this is done it is recommended that all but assigned three generators (and perhaps ~white2 for sync, see below) are commented out in the MIDI CONTROLS section in order not to trigger other generators accidentally. Performer is free to choose her own midi-controller devices with which to control 7 parameters: three (3) generators' gains, three effects and the master gain. These parameters should be properly assigned to midi devices.



### Creating a score for each perfomer

Print out a score template. There are PDF, PNG and SVG (Inkscape) versions avaible. It is also possible to edit an image/svg on the screen and work with that (that's more ecological, but perhaps too twiddly for some). The score has to be written by each performer for herself.

The piece is 8 minutes long. For each generator there is a timeline to be filled out with an envelope. Draw an envelope using straight lines and the following rules: for each four minutes of the piece there should be at least one (1) and maximum four (4) peaks. Starting at bottom of the timeline each "attack" *can* be followed by a "sustain" and *must* be followed by a "release". Sustain/peak must be over 50% and a release must end below 50% before starting a new "attack" or sustaining there.

Preparing the score for three effects follows a different methodology: "self-instruction". Control of the effects is less structured and is left to be in more improvisational vein. However a performer must find an instruction which she will follow during the performance. This can take a very technical and simple form ("Keep it off", "On in 2nd and 6th minute", "All the time at low level") or more suggestive and more open to intuitive interpretation ("Rarely close it for short time", "Fast waves many times", "Listen and respond to others"). The instruction must represent an action to performer herself, it must not be just an empty sentence. A word of caution about the low-pass filter: if used too broadly it can easily function as a volume control - it will cut out all the sound. It is quite dependent on the sound it affects. The performer must make sure to use it in order to manipulate sound colour.

Performers should test things out, practice on their own (headphones can be handy), rehearse together and adjust/rewrite their scores.


### Sync

The sync between laptops is achieved using Precision Time Protocol. One of the machines must be assigned as a master to which all others will sync. Before the SC patch is evaluated, prepare clock sync in the following way.

Check if master machine is running ntp daemon:

    ps waux | grep ntpd



If master is running ntp daemon (regardless if connection to internet is present), run PTPd in master mode:

    sudo ptpd -C -G



If master has no ntp daemon running, run

    sudo ptpd -C -W



All other computers should run PTPd in slave mode:

    sudo ptpd -C -g



Now all clocks of all laptops should be in tight sync and the SC patch can be evaluated. It is recommended that it is evaluated just before the performance.

To test the sync, all laptops should play "~white2", which is a short click at frequency 1Hz.






