// quadraphonic meditation...
// Yann Ics -- Copyleft October 2025
(
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
	kenv1 = PinkNoise.ar(0.3,1);
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

~deg2midi = {
	|degree, interval, scale, root=0, previous |
	/*
	-- degree of the scale between 0 and scale.size-1
	-- interval <instance of Interval> as ambitus
	   Interval(minMidiNote, maxMidiNote, toneStep)
	-- scale <instance of Scale>
	-- root = 0 --> C
	-- previous is a midi note
	returns an array of possible midinote(s) according to the ambitus
	or the previous midinote if part of possible midinote(s) as array
	*/
	var res = interval.asArray.select{|mid| mid%12 == (scale[degree]+root).mod(12)};
	if (res.includesEqual(previous)) {[previous]} {res} };

// direction des voix en privilegiant respectivement les unissons et les mouvements conjoints.

~toMidiChord = {
	|instrumentarium, chord, scale, root, previous|
	// instrumentarium.size = chord.size = previous.size
	instrumentarium.collect{
		|inst, i|
		chord.collect{
			|deg|
			var res = ~deg2midi.(deg, inst, scale, root, previous[i]);
			[ (res-previous[i]).abs, res, i, deg ]
			// [ distance/interval, candidate/midinote, indice/voiceOrder, degree ]
			.flop
		}.flatten(1).sort{|a,b| a[0]<b[0]}[..chord.size-1]
	}
};

~assignDeg2Inst = {
	|toMidiChord, chordDeg|
	var tmp = (chordDeg!chordDeg.size).allTuples.select{|it|it.size==it.asSet.size}.collect{|chord| chord.collect{|deg, i| toMidiChord.flatten(1).select{|mc| mc[mc.size-2..]==[i,deg]}.flatten(1)}};
	tmp=tmp.select{|set| set.every{|ar| ar.isEmpty.not}};
	tmp[tmp.collect{|set| set.sum(_[0])}.minIndex].collect(_[1])
	};

//++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++

~instrumentarium = Interval(50, 88, 0.5)!4; // intervals to adjust...

~root = 2; // as D
~currentChord = [ 86, 74, 62, 50 ]; // arbitrary chord to init the process

~myScale = Scale.new(#[0, 2, 3, 4, 6, 7, 8, 9, 10, 12, 13, 16, 18, 20], 24, name: "noname");

~chordList = (Array.series(~myScale.size)!~instrumentarium.size).allTuples.select{|it| it.asSet.size == ~instrumentarium.size}.collect(_.asSortedList).asSet.collect(_.asArray);

~previousChord = ~currentChord;

~nOut = Server.default.options.numOutputBusChannels; // allows stereo output...
)

//++++++++++++++++++++++++++++++++++++++++++++++

~fl1 = Synth(\wFlute, [out: 0]); ~fl2 = Synth(\wFlute, [out: 1]); ~fl3 = Synth(\wFlute, [out: 2%~nOut]); ~fl4 = Synth(\wFlute, [out: 3%~nOut]); Pbind(\type, \set, \x, Pfunc({~tmp = ~chordList.choose.postln; ~previousChord.postln; ~currentChord = ~assignDeg2Inst.(~toMidiChord.(~instrumentarium, ~tmp, ~myScale, ~root, ~previousChord), ~tmp).postln; ~previousChord = ~currentChord; "----------".postln; ~fl1.set("pch", ~currentChord[0], "ibreath", 0.00536, "amp", 0.01, "gate", 1); ~fl2.set("pch", ~currentChord[1], "ibreath", 0.00536, "amp", 0.01, "gate", 1); ~fl3.set("pch", ~currentChord[2], "ibreath", 0.00536, "amp", 0.01, "gate", 1); ~fl4.set("pch", ~currentChord[3], "ibreath", 0.00536, "amp", 0.01, "gate", 1)}), \dur, Prand([ 1, 0.5, 1/3, 2/3, 0.25, 1/5, 2/5, 0.75, 3/5, 4/5 ] * 2, inf)).play;

//++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++

