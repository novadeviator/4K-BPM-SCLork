(
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


/* *************************************************************************************
   MIDI CONTROLS
   *************

GENERATORS' GAINS:                                                        midi        */
MIDIdef.cc(\midilfTri,      { | val | ~lfTri.set(\gain, val/127); },       0 );
MIDIdef.cc(\midikindaBass,  { | val | ~kindaBass.set(\gain, val/127); },   1 );
MIDIdef.cc(\midiwierdBleep, { | val | ~wierdBleep.set(\gain, val/127); },  2 );
MIDIdef.cc(\midisine666,    { | val | ~sine666.set(\gain, val/127); },     3 );
MIDIdef.cc(\midilFPar1,     { | val | ~lFPar1.set(\gain, val/127); },      4 );
MIDIdef.cc(\midilowCub,     { | val | ~lowCub.set(\gain, val/127); },      5 );
MIDIdef.cc(\midimidCub,     { | val | ~midCub.set(\gain, val/127); },      6 );
MIDIdef.cc(\midihiCub,      { | val | ~hiCub.set(\gain, val/127); },       7 );
MIDIdef.cc(\midiaddCub,     { | val | ~addCub.set(\gain, val/127); },      8 );
MIDIdef.cc(\midisine356,    { | val | ~sine365.set(\gain, val/127); },     9 );

MIDIdef.cc(\midisin800,     { | val | ~sin800.set(\gain, val/127); },     10 );
MIDIdef.cc(\midisin5800,    { | val | ~sin5800.set(\gain, val/127); },    11 );
MIDIdef.cc(\midicub820,     { | val | ~cub820.set(\gain, val/127); },     12 );
MIDIdef.cc(\midilfPar7820,  { | val | ~lfPar7820.set(\gain, val/127); },  13 );
MIDIdef.cc(\midiwhite1,     { | val | ~white1.set(\gain, val/127); },     14 );
MIDIdef.cc(\midiwhite2,     { | val | ~white2.set(\gain, val/127); },     15 );
MIDIdef.cc(\midiwhite3,     { | val | ~white3.set(\gain, val/127); },     16 );
MIDIdef.cc(\midiwhite4,     { | val | ~white4.set(\gain, val/127); },     17 );
MIDIdef.cc(\midisine56,     { | val | ~sine65.set(\gain, val/127); },     18 );
MIDIdef.cc(\midilowCub2,    { | val | ~lowCub2.set(\gain, val/127); },    19 );

MIDIdef.cc(\midiwhite5,     { | val | ~white5.set(\gain, val/127); },     20 );
MIDIdef.cc(\midibrown1,     { | val | ~brown1.set(\gain, val/127); },     21 );

// ------------------------------------------------------------------------------- //

// effects and master out midi control
MIDIdef.cc(\midifXcombWet, 	{ | val | ~fX.set(\combWet, val/300); },      60 ); // comb filter WET

MIDIdef.cc(\midifXlpfCutoff, { | val |
	var cutoff; cutoff = (exp(val/12)+50).asInt.min(20000);
	~fX.set(\lpfCutoff, cutoff); },                                       61 ); // LPF cutoff freq

MIDIdef.cc(\midifXreverbWet, { | val | ~fX.set(\reverbWet, val/300); },   62 ); // Reverb WET

MIDIdef.cc(\midifXgain, { | val | ~fX.set(\gain, val/127); },             63 ); // MASTER OUT

//s.makeGui;

/* *************************************************************************************
   SCHEDULE SYNTHS USING EVENTS
   ****************************                                                        */

v = Main.elapsedTime.ceil;
t = TempoClock(1, 0, v);
t.schedAbs(0, {
	~fX	        = (instrument: \fX).play;
	~kindaBass  = (instrument: \kindaBass).play;
	~wierdBleep = (instrument: \wierdBleep).play;
	~sine666    = (instrument: \sine666).play;
	~lFPar1	    = (instrument: \LFPar1).play;
	~lowCub	    = (instrument: \lowCub).play;
	~lowCub2    = (instrument: \lowCub2).play;
	~midCub	    = (instrument: \midCub).play;
	~hiCub      = (instrument: \hiCub).play;
	~addCub     = (instrument: \addCub).play;
	~sine365    = (instrument: \sine365).play;
	~sine65	    = (instrument: \sine65).play;
	~sin800     = (instrument: \sin800).play;
	~sin5800    = (instrument: \sin5800).play;
	~cub820     = (instrument: \cub820).play;
	~lfPar7820  = (instrument: \lfPar7820).play;
	~white1	    = (instrument: \white1).play;
	~white2	    = (instrument: \white2).play;
	~white3	    = (instrument: \white3).play;
	~white4	    = (instrument: \white4).play;
	~lfTri      = (instrument: \lfTri).play;
	~white5	    = (instrument: \white5).play;
	~brown1	    = (instrument: \brown1).play;
	postln(v);
});



// HERE BE SOME FUNKY VARIABLES ///////////////////////////////////////

// SCALES! //

~aSc = Scale.minorPentatonic; // define scale type
~freqTrig = { Impulse.kr(rrand(0.01,0.05)); }; // how fast the note changes
~freqOff = {rrand(0.98, 1.02);}; // detune a bit

// define one var for each octave for use in SynthDefs
~freqVar3 = { (Demand.kr(~freqTrig, 0, (Dxrand(~aSc.semitones, inf))) + (12 * 3) ).midicps * ~freqOff };
~freqVar4 = { (Demand.kr(~freqTrig, 0, (Dxrand(~aSc.semitones, inf))) + (12 * 4) ).midicps * ~freqOff };
~freqVar5 = { (Demand.kr(~freqTrig, 0, (Dxrand(~aSc.semitones, inf))) + (12 * 5) ).midicps * ~freqOff };
~freqVar6 = { (Demand.kr(~freqTrig, 0, (Dxrand(~aSc.semitones, inf))) + (12 * 6) ).midicps * ~freqOff };
~freqVar7 = { (Demand.kr(~freqTrig, 0, (Dxrand(~aSc.semitones, inf))) + (12 * 7) ).midicps * ~freqOff };
~freqVar8 = { (Demand.kr(~freqTrig, 0, (Dxrand(~aSc.semitones, inf))) + (12 * 8) ).midicps * ~freqOff };

~chanExpan = [1,1]; // multi channel expansion (just stereo here)

~bpm = 1; // bpm, for now constant, it could drift...


/* *************************************************************************************
   DEFINE SYNTHS AND ADD TO SERVER
   *******************************                                                     */

SynthDef(\kindaBass, { | out=0, gain=0 |
	out = SinOsc.ar( ((LFSaw.kr(-0.05,1) + 1) * 100 + 40 ),	LFTri.kr(40,0,1),
		LFSaw.kr(1.5 * ~bpm) ) * 0.5 * ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\wierdBleep, { | out=0, gain=0 |
	out = LFPulse.ar(~freqVar3, 0, 0.5, LFPulse.kr((1/2) * ~bpm, 0.5, 0.03, 0.05))
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\sine666, { | out=0, gain=0 |
	out = SinOsc.ar(~freqVar4, 0, LFPulse.kr((2/3) * ~bpm, 0.5, 0.3) * 0.3)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\LFPar1, { | out=0, gain=0 |
	out = LFPar.ar(~freqVar4, 0, LFPulse.kr((1/2) * ~bpm, 0.5,0.2) * 0.3)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\lowCub, { | out=0, gain=0 |
	out = LFCub.ar(~freqVar3, 0, LFPulse.kr((1/2) * ~bpm, 0.74,0.2) * 0.3)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\lowCub2, { | out=0, gain=0 |
	out = LFCub.ar(~freqVar3, 0, LFPulse.kr((4/3) * ~bpm, 0.74,0.2) * 0.3)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\midCub, { | out=0, gain=0 |
	out = LFCub.ar(~freqVar5, 0, LFPulse.kr((1/2) * ~bpm, 0.74,0.1) * 0.2)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\hiCub, { | out=0, gain=0 |
	out = LFCub.ar(~freqVar7, 0, LFPulse.kr((4/3) * ~bpm, 0.76, SinOsc.kr(rrand(0.01,0.001),mul:0.05, add:0.055)) * 0.1)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\addCub, { | out=0, gain=0 |
	out = LFCub.ar(~freqVar7, 0, LFPulse.kr((5/3) * ~bpm, 0.24, SinOsc.kr(rrand(0.01,0.001),mul:0.05, add:0.055) )*0.1)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\sine65, { | out=0, gain=0 |
	out = SinOsc.ar(~freqVar3, 0, LFPulse.kr( (1) * ~bpm, 0, 0.1)*0.3)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\sine365, { | out=0, gain=0 |
	out = SinOsc.ar(~freqVar4, 0, LFPulse.kr( (4/3) * ~bpm, 0, 0.1)*0.3)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\sin800, { | out=0, gain=0 |
	out = SinOsc.ar(~freqVar5, 0, LFPulse.kr(2 * ~bpm,0,0.1)*0.1)
			* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\sin5800, { | out=0, gain=0 |
	out = SinOsc.ar(~freqVar8, 0, LFPulse.kr(2 * ~bpm,0, SinOsc.kr(rrand(0.01,0.001),mul:0.05, add:0.055))*0.1)
			* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\cub820, { | out=0, gain=0 |
	out = LFCub.ar(~freqVar5, 0, LFPulse.kr( (5/3) * ~bpm, 0, 0.1)*0.1)
			* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\lfPar7820, { | out=0, gain=0 |
	out = LFPar.ar(~freqVar8, 0, LFPulse.kr( (5/3) * ~bpm, 0, 0.03)*0.1)
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
	out = LFTri.ar(~freqVar4, 0, LFPulse.kr(0.5 * ~bpm,0.25,0.01)*0.3)
		* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\white5, { | out=0, gain=0 |
	out = RHPF.ar(WhiteNoise.ar( LFPulse.kr( (1/8) * ~bpm,0.5,0.1,1) ),4000)*0.05
			* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;

SynthDef(\brown1, { | out=0, gain=0 |
	out = RLPF.ar(BrownNoise.ar( LFPulse.kr( (1/9) * ~bpm,0.5,0.05,1) ),8000)*0.1
			* ~chanExpan * gain;
	OffsetOut.ar(0, out); }).add;


// effects!
SynthDef(\fX, { | in=0, out=0, reverbWet=0, combWet=0, lpfCutoff=20000, gain=0.4 |
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
	output = output + FreeVerb.ar(output*reverbWet, 1, rrand(0.5,1), 0.1); // reverb
	output = output * gain; // gain control
	output = [output,output,output,output]; // send it to 4 channels
	ReplaceOut.ar(out, output); // replace the audio on the bus!
	//Out.ar(2, out);

}).add;

/* ************************************************************************************************* */
 // END
)