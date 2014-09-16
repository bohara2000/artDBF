//NOTE - consider using some algorithm to do transformations to the melody.

public class StutterSinOsc
{
	// sine to dac
	//SinOsc s => Envelope e => JCRev r => dac;
	// connect JCRev to master gain control after instantiating class	
	SinOsc s => Envelope e => JCRev r;
	adc => Gain g1 => dac;
	0.2 => g1.gain;
	// let's turn down gain, for this can be loud and annoying
	.075 => s.gain;
	0.22 => r.mix;
	//0.4 => r.gain;
	
	0 => int start;
	
	fun void stutter()
	{
	    BPM bpm;
	    bpm.tempo(140);
	    [bpm.sixteenthNote, bpm.sixteenthNote, bpm.sixteenthNote, bpm.sixteenthNote, bpm.eighthNote, bpm.eighthNote, bpm.sixteenthNote, bpm.sixteenthNote, bpm.sixteenthNote, bpm.sixteenthNote, bpm.quarterNote*2, bpm.sixteenthNote, bpm.sixteenthNote, bpm.eighthNote] @=> dur pattern[];
	    0 => int i;
	    while( true )
	    {
		// random choose rise/fall time
		//Math.random2f(10,500)::ms => dur t => e.duration;
		40::ms => dur t => e.duration;
		// print
		<<< "rise/fall:", t/ms, "ms" >>>;

		// key on - start attack
		e.keyOn();
		// advance time by pattern notes
		//pattern[pattern.cap()-1 - (i % pattern.cap())] => now;
		pattern[(i % pattern.cap())] => now;
		<<< "pattern number:",  i % pattern.cap()>>>;
		//<<< "pattern number:",  pattern.cap()-1 - (i % pattern.cap()) >>>;
		// key off - start release
		e.keyOff();
		// advance time by 10 ms
		80::ms => now;
		i++;
	    }    
	}

	fun void Start()
	{	
		spork ~ stutter();

		// infinite time loop
		0.0 => float t;
		1 => start;
		while( start > 0 )
		{
		    // modulate
		    30 + ( Math.sin(t) + 1.0 ) * 80.0 => s.freq;
		    t + .004 => t;
		    
		    // advance time
		    1::ms => now;
		    //<<< "frequency: ", s.freq() >>>;
		}
	}

	fun void Stop()
	{
		0 => start;
		g1 =< dac;
	}
}
