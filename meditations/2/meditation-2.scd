(
// Quadraphonic Meditation 2 -- Random Walk [ part of Meditations ]
// Yann Ics -- Copyleft November 2025
Server.killAll;
s = Server.default;
s.options.numOutputBusChannels = 8;
s.options.memSize = 2.pow(20); // default is 8192
Safety.setLimit(0.5);

s.waitForBoot({

	/* loading synths */
	// freely adapted from the Wilson, Cottle and Collins' SuperCollider patch
	// Waveguide flute based upon Hans Mikelson's Csound slide flute (ultimately derived from Perry Cook's)
	SynthDef("wFlute", { arg out=0, pch = 72, ibreath = 0.09, ifeedbk1 = 0.4, ifeedbk2 = 0.4, gate = 1, amp = 0, lag = 0.5;
		var kenv1, sr, cr, block;
		var signalOut, ifqc;
		var aflow1, asum1, asum2, afqc, ax, apoly, asum3, avalue, aflute1;
		var fdbckArray;
		sr = SampleRate.ir; // 44100.0
		cr = ControlRate.ir; // 689.062 -- 0.0014512482185928
		block = cr.reciprocal;
		ifqc = pch.midicps;
		// noise
		kenv1 = PinkNoise.ar(0.23, 1);
		aflow1 = LFClipNoise.ar( sr, kenv1 );
		asum1 = ( ibreath * aflow1 ) + kenv1 ;
		afqc = ifqc.reciprocal - ( asum1/20000 ) - ( 9/sr ) + ( ifqc/12000000 ) - block;
		fdbckArray = LocalIn.ar( 1 );
		aflute1 = fdbckArray;
		asum2 = asum1 + ( aflute1 * ifeedbk1 );
		ax = DelayC.ar( asum2, ifqc.reciprocal - block * 0.5, afqc * 0.5 - ( asum1/ifqc/cr ) + 0.001 );
		apoly = ax - ( ax.cubed );
		asum3 = apoly + ( aflute1 * ifeedbk2 );
		avalue = LPF.ar( asum3, 2000 );
		aflute1 = DelayC.ar( avalue, ifqc.reciprocal - block, afqc );
		fdbckArray = [ aflute1 ];
		LocalOut.ar( fdbckArray );
		signalOut = avalue * EnvGen.kr(Env.asr(0.001, 1, 0.1), gate);
		OffsetOut.ar( out, LeakDC.ar(signalOut) * amp.varlag(lag) );
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
	/* loading functions */
	~deg2midi = {
		|degree, interval, scale, root=0 |
		/*
		-- degree of the scale between 0 and scale.size-1
		-- interval <instance of Interval> as ambitus
		Interval(minMidiNote, maxMidiNote, toneStep)
		-- scale <instance of Scale>
		-- root = 0 --> C
		returns an array of possible midinote(s)
		*/
		interval.asArray.select{|mid| mid%12 == (scale[degree]+root).mod(12)}
	};

	// direction des voix en privilegiant respectivement les unissons et les mouvements conjoints.

	~toMidiChord = {
		|instrumentarium, chord, scale, root, previous|
		instrumentarium.collect{
			|inst, i|
			chord.collect{
				|deg|
				var res = ~deg2midi.(deg, inst, scale, root);
				[ (res-previous[i]).abs, res, i, deg ]
				// [ distance/interval, candidate/midinote, indice/voiceOrder, degree ]
				.flop }
			.flatten(1)
			.sort{|a,b| a[0]<b[0]}
		}
		.collect{|ittt| chord.collect{|itt| ittt.detect{|it| it.last==itt}}}
	};

	~assignDeg2Inst = {
		|toMidiChord, chordDeg|
		var tmp = chordDeg.size.factorial.collect({|i| chordDeg.permute(i)}).asSet.asArray.collect{|chord| chord.collect{|deg, i| toMidiChord.flatten(1).select{|mc| mc[mc.size-2..]==[i, deg]}.flatten(1)}};
		tmp=tmp.select{|set| set.every{|ar| ar.isEmpty.not}};
		tmp[tmp.collect{|set| set.sum(_[0])}.minIndex].collect(_[1])
	};

	~asTie = {
		|previous, current|
		var cur=current.copy;
		var res=previous.collect{|it| if(cur.includesEqual(it)) {cur.removeAt(cur.indexOf(it));it} {nil}};
		cur=cur.reverse;
		previous.size.collect{|i| if (res[i].isNil)
			{
				res.put(i, current[i].nearestInList(cur.sort));
				cur.removeAt(cur.indexOf(res[i]))
			}
		};
		res
	};
	/*---------------------*/

	s.sync;

	/*---------------------*/
	/* VARIABLES */
	~instrumentarium = Interval(50, 74, 0.5)!4; // intervals to adjust...
	~root = 2; // as D
	~previousChord = ~instrumentarium.collect{|inst| inst.asArray.choose}; // any arbitrary chord to init the process
	~myScale = Scale.new(#[0, 2, 3, 4, 6, 7, 8, 9, 10, 12, 13, 16, 18, 20], 24);
	// avec repetition
	~chordList = (Array.series(~myScale.size)!~instrumentarium.size).allTuples;
	// sans repetition
	//~chordList = (Array.series(~myScale.size)!~instrumentarium.size).allTuples.select{|it| it.asSet.size == ~instrumentarium.size}.collect(_.asSortedList).asSet.collect(_.asArray);

	/*---------------------*/

	s.sync;

	/*---------------------*/
	/* init synths */
	~fl = 4.collect{|i| Synth(\wFlute, [out: i+4])};
	/* and play */
	~main = Pbind(
		\type, \set,
		\x, Pfunc({
			~tmp = ~chordList.choose.postln; // select a chord as degrees
			~previousChord.postln;
			~currentChord = ~assignDeg2Inst.(~toMidiChord.(~instrumentarium, ~tmp, ~myScale, ~root, ~previousChord), ~tmp);
			~currentChord=~asTie.(~previousChord, ~currentChord);
			~previousChord = ~currentChord.postln;
			"----------".postln;
			4.do{ |i| ~fl[i].set("pch", ~currentChord[i], "ibreath", 0.00536, "amp", 0.01, "gate", 1) }
		}),
		\dur, Pwrand([ 0.2, 0.25, 1/3, 0.4, 0.5, 0.6, 2/3, 0.75, 0.8, 1 ] * 4, Array.series(10, 1).normalizeSum, inf)).play;
})
)
//~main.stop; ~fl.do(_.free); ~mainOutA.synth.free; ~mainOutB.synth.free;