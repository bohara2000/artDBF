/*---------------------------------------------------------------------------
    S.M.E.L.T. : Small Musically Expressive Laptop Toolkit

    Copyright (c) 2007 Rebecca Fiebrink and Ge Wang.  All rights reserved.
      http://smelt.cs.princeton.edu/
      http://soundlab.cs.princeton.edu/

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
    U.S.A.
-----------------------------------------------------------------------------*/

//-----------------------------------------------------------------------------
// name: follower.ck
// desc: simple (but effective) envelope follower
//
// Perry's comments:
/* Hi all.  I keep meaning to post to this list about the under-exploited
feature that all unit generators have, in that you can cause their inputs
to multiply rather than add.  As an example, here's a simple power
envelope follower that doesn't require sample-level chuck intervention.  A
gain UG is used to square the incoming A/D signal (try it on your built-in
mic), then a OnePole UG is used as a "leaky integrator" to keep a running
estimate of the signal power. The main loop wakes up each 100 ms and
checks the power, and prints out a message if it's over a certain level. 
You might need to change the threshold, but you get the idea. */
//
// author: Perry Cook
// commented by: Rebecca Fiebrink and Ge Wang
//
// to run (in command line chuck):
//     %> chuck follower.ck
//
// to run (in miniAudicle):
//     (make sure VM is started, add the thing)
//-----------------------------------------------------------------------------

public class FollowerHypno
{
	// patch
	adc => Gain g => OnePole p => blackhole;
	// square the input, by chucking adc to g a second time
	adc => g;
	// set g to multiply its inputs
	3 => g.op;

	// tempo
	BPM bpm;
	//bpm.tempo(60);

	// threshold
	.275 => float threshold;
	// set pole position, influences how closely the envelope follows the input
	//   : pole = 0 -> output == input; 
	//   : as pole position approaches 1, follower will respond more slowly to input
	0.999 => p.pole;

	// duration between successive polling
	20::ms => dur pollDur;
	// duration to pause when onset detected
	bpm.quarterNote => dur pauseDur;
	// time before which to not check for threshold
	time notBefore;

	int shredArray[20];
	
	// start flag
	0 => int start;

	/* Functions */
	fun float getAverage( FloatList ls )
	{
	    float result;
	    for (0 => int i; i < ls.size(); i++)
	    {
		ls.get(i) +=> result;
	    }
	    
	    return Math.round(result/ls.size());
	}


	fun void playHypnoDrone(float DroneBaseFrequency, float gain, dur fadeInIncrement, dur fadeOutDecrement)
	{
	 
	    3.0 => float FilterMod; 
	    12.0 => float SoundVariation; 
	    .1 => float SweepingLFOFreq; 

	    SinOsc lfo1 => blackhole; 
	    SweepingLFOFreq => lfo1.freq; 

	    Step freq => Phasor s1 => Gain s1_g; 
	    3 => s1_g.op; 

	    freq => s1_g; 
	    freq => SinOsc s2 => NRev rev1 => LPF s2_f => PRCRev rev2 => Gain droneGain => dac; 
	    s1_g => s2; 
	    
	    /* Start fade-in */
	    0 => droneGain.gain;
	    <<< "starting fadein...">>>;
	    float droneVolume;
	    while(droneGain.gain() < gain)
	    {
	       gain/(fadeInIncrement/1::ms) +=> droneVolume;
	       droneVolume => droneGain.gain;
	       <<< droneGain.gain() >>>;
	       fadeInIncrement => now;
	    }
	    
	    
	    <<< "setting drone gain to:", gain >>>;
	    
	    .8 => rev1.mix; 
	    2 => s2_f.Q; 
	    .05 => rev2.mix; 
	    .1 => rev2.gain; 

	    .2 => s2.gain; 

	    int i; 
	    
	    while(droneGain.gain() > 0) 
	    { 
		((i * 5) % 8 * DroneBaseFrequency + DroneBaseFrequency => freq.next) * FilterMod => s2_f.freq; 
		100::ms => now; 
		i++; 
		Math.floor(lfo1.last() * SoundVariation) => s1_g.gain; 
		
		if(shredArray[me.id()-1] == 1)
		{
		    <<< me.id(), ": starting fade out" >>>;
		    /* start fade-out*/
		    while(droneGain.gain() > 0)
		    {
		       (gain/(fadeInIncrement/1::ms)) -=> droneVolume;
		       droneVolume => droneGain.gain;
		       fadeOutDecrement => now;
		    }
		    0 => shredArray[me.id()-1];
		    droneGain =< dac;
		}
	    }
	}

	fun void Start()
	{
		4 => int dividingVolume;

		1 => start;

		// infinite time loop
		while( start > 0 )
		{
		    // print
		    //<<< "current envelope value:", p.last() >>>;
		    // detect onset
		    if( now > notBefore && p.last() > threshold )
		    {
			// do something
			<<< "BANG!!" >>>;
			spork ~ playHypnoDrone(Math.random2f(60, 120), g.gain()/dividingVolume, 60::ms, 30::ms) @=> Shred shred1;
			2 *=> dividingVolume;
			// compute time to resume checking
			now + pauseDur => notBefore;
		    }
		    
		    // determines poll rate
		    pollDur => now;
		}
	}

	// NOTE: may want to play it safe and disconnect the gain;
	fun void Stop()
	{
		0 => start;
	}

}
