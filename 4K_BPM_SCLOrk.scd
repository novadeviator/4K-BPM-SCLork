
/* *************************************************************************
         _____  ____  __.     /\ ____________________  _____
        /  |  ||    |/ _|    / / \______   \______   \/     \
       /   |  ||      <     / /   |    |  _/|     ___/  \ /  \
      /    ^   /    |  \   / /    |    |   \|    |  /    Y    \
      \____   ||____|__ \ / /     |______  /|____|  \____|__  /
           |__|        \/ \/             \/                 \/
        __________________ .____    ________         __
       /   _____/\_   ___ \|    |   \_____  \_______|  | __
       \_____  \ /    \  \/|    |    /   |   \_  __ \  |/ /
       /        \\     \___|    |___/    |    \  | \/    <
      /_______  / \______  /_______ \_______  /__|  |__|_ \
              \/         \/        \/       \/           \/
                                                                      v150403

"4K/BPM SCLOrk" for Santa Clara University Laptop Orchestra
           by Luka Prinčič / Nova deViator <nova@deviator.si>
           thanks to Bruno Ruviaro

           adapted from 4K/BPM Sonoretum patch, released and
           installed at Sonoretum project / Kapelica Gallery, Ljubljana
           thanks to Marko Košnik, Sandra Sajovic and Jurij Krpan

           released under GNU GPL. feel free to copy, reuse, remix,
           provided that you share under same conditions: GNU GPL.

***************************************************************************** */

(



// HERE BE SOME FUNKY VARIABLES ///////////////////////////////////////

~chanExpan = [1,1]; // multi channel expansion (just stereo here)
~bpm = 1; // bpm, for now constant, it could drift...
~freqVar = { LFNoise0.ar(rrand(0.005, 0.03), 0.2, 1); }; // change tonality from time to time




/* *************************************************************************************
   DEFINE SYNTHS AND ADD TO SERVER
   *******************************                                                     */

SynthDef(\kindaBass, { | out=0, gain=0 |
	out = SinOsc.ar( ((LFSaw.kr(-0.05,1) + 1) * 100 + 40 ),	LFTri.kr(40,0,1),
		LFSaw.kr(1.5 * ~bpm) ) * 0.5 * ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\wierdBleep, { | out=0, gain=0 |
	out = LFPulse.ar(60 * ~freqVar, 0, 0.5, LFPulse.kr((1/2) * ~bpm, 0.5, 0.03, 0.3))
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\sine666, { | out=0, gain=0 |
	out = SinOsc.ar(265 * ~freqVar, 0, LFPulse.kr((2/3) * ~bpm, 0.5, 0.3) * 0.3)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\LFPar1, { | out=0, gain=0 |
	out = LFPar.ar(420 * ~freqVar, 0, LFPulse.kr((1/2) * ~bpm, 0.5,0.2) * 0.3)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\lowCub, { | out=0, gain=0 |
	out = LFCub.ar(185 * ~freqVar, 0, LFPulse.kr((1/2) * ~bpm, 0.74,0.2) * 0.3)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\midCub, { | out=0, gain=0 |
	out = LFCub.ar(1985 * ~freqVar, 0, LFPulse.kr((1/2) * ~bpm, 0.74,0.1) * 0.2)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\hiCub, { | out=0, gain=0 |
	out = LFCub.ar(9985 * ~freqVar, 0, LFPulse.kr((4/3) * ~bpm, 0.76,0.005)*0.3)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\addCub, { | out=0, gain=0 |
	out = LFCub.ar(7985 * ~freqVar, 0, LFPulse.kr((5/3) * ~bpm, 0.24,0.005)*0.3)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\sine365, { | out=0, gain=0 |
	out = SinOsc.ar(365 * ~freqVar, 0, LFPulse.kr( (4/3) * ~bpm, 0, 0.1)*0.3)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\sin800, { | out=0, gain=0 |
	out = SinOsc.ar(800 * ~freqVar, 0, LFPulse.kr(2 * ~bpm,0,0.1)*0.1)
			* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\sin5800, { | out=0, gain=0 |
	out = SinOsc.ar(5800 * ~freqVar, 0, LFPulse.kr(2 * ~bpm,0,0.01)*0.3)
			* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\cub820, { | out=0, gain=0 |
	out = LFCub.ar(820 * ~freqVar, 0, LFPulse.kr( (5/3) * ~bpm, 0, 0.1)*0.1)
			* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\lfPar7820, { | out=0, gain=0 |
	out = LFPar.ar(7820 * ~freqVar, 0, LFPulse.kr( (5/3) * ~bpm, 0, 0.03)*0.1)
			* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\white1, { | out=0, gain=0 |
	out = WhiteNoise.ar( LFPulse.kr(2 * ~bpm,0.5,0.001,1) )/2
			* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\white2, { | out=0, gain=0 |
	out = WhiteNoise.ar( LFPulse.kr(1 * ~bpm,0.5,0.001,1) )/2
			* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\white3, { | out=0, gain=0 |
	out = WhiteNoise.ar( LFPulse.kr( (5/3) * ~bpm,0.5,0.001,1) )/4
			* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\white4, { | out=0, gain=0 |
	out = WhiteNoise.ar( LFPulse.kr( (4/3) * ~bpm,0.5,0.001,1) )/4
			* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\lfTri, { | out=0, gain=0 |
	out = LFTri.ar(260 * ~freqVar, 0, LFPulse.kr(0.5 * ~bpm,0.25,0.01)*0.3)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

// effects!
SynthDef(\fX, { | in=0, out=0, reverbWet=0.3, combWet=0.2, lpfCutoff=50, gain=0 |
	var input, output;

	input = In.ar(in, 2);
	output = CombC.ar(in:input, // comb filter
		maxdelaytime:0.1,
		delaytime:SinOsc.kr(
			freq:rrand(0.01,0.001),
			phase:0.25,
			mul:0.03,
			add:0.05 ),
		mul:combWet,
		add:input);

	output = BLowPass4.ar(in:output, freq:lpfCutoff, rq:1); // low pass filter
	output = Limiter.ar((output*0.9), 0.95, 0.01);	 // limiter
	output = FreeVerb.ar(output, reverbWet, 1, 0.1, 1); // reverb
	output = output * gain; // gain control
	ReplaceOut.ar(out, output); // replace the audio on the bus!

}).add;







/* *************************************************************************************
   SCHEDULE SYNTHS USING EVENTS
   ****************************                                                        */

// schedule this!
v = Main.elapsedTime.ceil;
t = TempoClock(1, 0, v);
t.schedAbs(0, {
	~fX			= (instrument: \fX).play;
	~kindaBass 	= (instrument: \kindaBass).play;
	~wierdBleep = (instrument: \wierdBleep).play;
	~sine666	= (instrument: \sine666).play;
	~lFPar1		= (instrument: \LFPar1).play;
	~lowCub		= (instrument: \lowCub).play;
	~midCub		= (instrument: \midCub).play;
	~hiCub		= (instrument: \hiCub).play;
	~addCub		= (instrument: \addCub).play;
	~sine365	= (instrument: \sine365).play;
	~sin800		= (instrument: \sin800).play;
	~sin5800	= (instrument: \sin5800).play;
	~cub820		= (instrument: \cub820).play;
	~lfPar7820	= (instrument: \lfPar7820).play;
	~white1		= (instrument: \white1).play;
	~white2		= (instrument: \white2).play;
	~white3		= (instrument: \white3).play;
	~white4		= (instrument: \white4).play;
	~lfTri		= (instrument: \lfTri).play;


});



/* *************************************************************************************
   MIDI CONTROLS
   *************                                                                       */

MIDIdef.cc(\midikindaBass, 	{ | val | ~kindaBass.set(\gain, val/127); }, 	1 ); // <- controller number
MIDIdef.cc(\midiwierdBleep, { | val | ~wierdBleep.set(\gain, val/127); }, 	2 ); // <- controller number
MIDIdef.cc(\midisine666, 	{ | val | ~sine666.set(\gain, val/127); }, 		3 ); // <- controller number
MIDIdef.cc(\midilFPar1, 	{ | val | ~lFPar1.set(\gain, val/127); }, 		4 ); // <- controller number
MIDIdef.cc(\midilowCub, 	{ | val | ~lowCub.set(\gain, val/127); }, 		5 ); // <- controller number
MIDIdef.cc(\midimidCub, 	{ | val | ~midCub.set(\gain, val/127); }, 		6 ); // <- controller number
MIDIdef.cc(\midihiCub, 		{ | val | ~hiCub.set(\gain, val/127); }, 		7 ); // <- controller number
MIDIdef.cc(\midiaddCub, 	{ | val | ~addCub.set(\gain, val/127); }, 		8 ); // <- controller number
MIDIdef.cc(\midisine356, 	{ | val | ~sine365.set(\gain, val/127); }, 		9 ); // <- controller number
MIDIdef.cc(\midisin800, 	{ | val | ~sin800.set(\gain, val/127); }, 		10 ); // <- controller number
MIDIdef.cc(\midisin5800,	{ | val | ~sin5800.set(\gain, val/127); }, 		11 ); // <- controller number
MIDIdef.cc(\midicub820,  	{ | val | ~cub820.set(\gain, val/127); }, 		12 ); // <- controller number
MIDIdef.cc(\midilfPar7820, 	{ | val | ~lfPar7820.set(\gain, val/127); }, 	13 ); // <- controller number
MIDIdef.cc(\midiwhite1, 	{ | val | ~white1.set(\gain, val/127); }, 		14 ); // <- controller number
MIDIdef.cc(\midiwhite2, 	{ | val | ~white2.set(\gain, val/127); }, 		15 ); // <- controller number
MIDIdef.cc(\midiwhite3, 	{ | val | ~white3.set(\gain, val/127); }, 		16 ); // <- controller number
MIDIdef.cc(\midiwhite4, 	{ | val | ~white4.set(\gain, val/127); }, 		17 ); // <- controller number
MIDIdef.cc(\midipulseVerb, 	{ | val | ~pulseVerb.set(\gain, val/127); }, 	18 ); // <- controller number


// effects and master out midi control
MIDIdef.cc(\midifXcombWet, 	{ | val | ~fX.set(\combWet, val/177); }, 	60 ); // <- controller number

MIDIdef.cc(\midifXlpfCutoff, { | val |
	var cutoff; cutoff = (exp(val/12)+50).asInt.min(20000);
	//post("val:" + val); postln(" cutoff:" + cutoff);
	~fX.set(\lpfCutoff, cutoff); }, 	61 ); // <- controller number

MIDIdef.cc(\midifXreverbWet, 	{ | val | ~fX.set(\reverbWet, val/300); }, 	62 ); // <- controller number
MIDIdef.cc(\midifXgain, 	{ | val | ~fX.set(\gain, val/127); }, 	63 ); // <- controller number



) // END