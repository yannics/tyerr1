(
// Quadraphonic Meditation 4 -- Random Walk [ part of Meditations ]
// Yann Ics -- Copyleft March 2026
Server.killAll;
s = Server.default;
s.options.numOutputBusChannels = 8;
s.options.memSize = 2.pow(20); // default is 8192
Safety.setLimit(0.5);

s.waitForBoot({

	/* loading synths */
	SynthDef(\dwgbowed, { |out=0, freq=440, amp=#[0.5, 0.5], force=#[0.5, 0.5], gate=1, pos=#[0.07, 0.07], c1=0.25, c3=31, dur=5|
    var vib = Gendy1.kr(1, 1, 1, 1, 0.1, 4, mul:0.003, add:1);
    var son = DWGBowedSimple.ar(
		freq * vib,
		Line.ar(amp[0], amp[1], dur),
		Line.ar(force[0], force[1], dur),
		gate,
		Line.ar(pos[0], pos[1], dur),
		0.1, c1, c3);
    son = DWGSoundBoard.ar(son);
    son = BPF.ar(son, 118, 1) + son;
    son = BPF.ar(son, 430, 1) + son;
    son = BPF.ar(son, 490, 1) + son;
    son = LPF.ar(son, 6000);
    Out.ar(out, son * 0.1);
}).add;
	/* plugin synth */
	SynthDef(\vst_plugin2, {
		|busIn, busOut|
		Out.ar(busOut, VSTPlugin.ar(In.ar(busIn, 2), 2))
	}).add;
	/*---------------------*/

	s.sync;

	/*---------------------*/
	/* source plugin: https://valhalladsp.com/shop/reverb/valhalla-supermassive/ */
	~mainOutA = VSTPluginController(Synth(\vst_plugin2, [\busIn, 4, \busOut, 0], addAction: 'addToTail'));
	~mainOutA.open("ValhallaSupermassive", editor:true, verbose:true, action: { |x, ok| ok.if { x.loadPreset("hac") }});
	~mainOutB = VSTPluginController(Synth(\vst_plugin2, [\busIn, 6, \busOut, 2], addAction: 'addToTail'));
	~mainOutB.open("ValhallaSupermassive", editor:true, verbose:true, action: { |x, ok| ok.if { x.loadPreset("hac") }});
	//~mainOutB.synth.set(\busOut, 0); // as stereo output
	//~mainOutA.editor;
	//~mainOutA.savePreset("hac");
	//~mainOutA.info.presetFolder;
	/*---------------------*/

	s.sync;

	/*---------------------*/
	/* VARIABLES */
	~serFreqs = [ 190.41803, 1174.659, 207.65235, 87.30706, 184.99721, 116.540935, 160.12185, 854.9481, 391.99542, 293.66476, 233.08187, 415.3047, 329.62755, 640.4874, 622.25397, 427.47405, 92.498605, 146.83238, 123.470825, 320.2437, 195.99771, 155.56349, 73.41619, 174.61412, 89.86536, 269.29178, 369.99442, 587.3295, 311.126985, 659.2551, 246.94165, 134.64589, 95.209015, 77.781745, 493.8833, 103.826175, 179.73072 ];
// Durations
~tempdur = ~serFreqs.differentiate[1..].abs;
~durations = ~tempdur.explin(~tempdur.minItem, ~tempdur.maxItem, 2, 8);

	/*---------------------*/

	s.sync;

	/*---------------------*/
	/* init patterns and play*/
	~violin = Pbind(
		\out, 4,
		\instrument, \dwgbowed,
		\dur, Prand(~durations, inf)*Prand((0.1,0.2..1), inf),
		\sustain, Pkey(\dur, inf),
		\freq, Prand((~serFreqs.sort/2)[13..] ++ [\rest].dupEach(12), inf),
		\force, Prand([0,0.1,0.2,0.3,0.4,0.5], inf),
		\amp, 0.1
	).play;
	~alto1 = Pbind(
		\out, 5,
		\instrument, \dwgbowed,
		\dur, Prand(~durations, inf)*Prand((0.1,0.2..1), inf),
		\sustain, Pkey(\dur, inf),
		\freq, Prand((~serFreqs.sort/2)[9..] ++ [\rest].dupEach(8), inf),
		\force, Prand([0,0.1,0.2,0.3,0.4,0.5], inf),
		\amp, 0.1
	).play;
	~alto2 = Pbind(
		\out, 6,
		\instrument, \dwgbowed,
		\dur, Prand(~durations, inf)*Prand((0.1,0.2..1), inf),
		\sustain, Pkey(\dur, inf),
		\freq, Prand((~serFreqs.sort/2)[9..] ++ [\rest].dupEach(8), inf),
		\force, Prand([0,0.1,0.2,0.3,0.4,0.5], inf),
		\amp, 0.1
	).play;
	~cello = Pbind(
		\out, 7,
		\instrument, \dwgbowed,
		\dur, Prand(~durations, inf)*Prand((0.1,0.2..1), inf),
		\sustain, Pkey(\dur, inf),
		\freq, Prand((~serFreqs.sort/2), inf),
		\force, Prand([0,0.1,0.2,0.3,0.4,0.5], inf),
		\amp, 0.1
	).play;
})
)

~violin.pause;
~violin.resume;
~alto1.pause;
~alto1.resume;
~alto2.pause;
~alto2.resume;
~cello.pause;
~cello.resume;

~mainOutA.synth.free; ~mainOutB.synth.free; s.quit;