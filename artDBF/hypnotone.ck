// Seq Drone no. 01 31/01/2009 by Kijjasak Triyanond (kijjaz@yahoo.com) 
// This software is protected by GNU License. 
// Feel free to use, modify, distribute. 

//Gain master => dac;
int shredArray[20];

fun void playHypnoDrone(float DroneBaseFrequency, float gain, dur fadeOutDecrement)
{
    3.0 => float FilterMod; 
    12.0 => float SoundVariation; 
    .1 => float SweepingLFOFreq; 

    SinOsc lfo1 => blackhole; 
    SweepingLFOFreq => lfo1.freq; 

    Step freq => Phasor s1 => Gain s1_g; 
    3 => s1_g.op; 

    freq => s1_g; 
    freq => SinOsc s2 => NRev rev1 => LPF s2_f => PRCRev rev2 => Gain g => dac; 
    s1_g => s2; 
    gain => g.gain;
    
    .8 => rev1.mix; 
    2 => s2_f.Q; 
    .05 => rev2.mix; 
    .1 => rev2.gain; 

    .2 => s2.gain; 

    int i; 
    while(g.gain() > 0) 
    { 
        ((i * 5) % 8 * DroneBaseFrequency + DroneBaseFrequency => freq.next) * FilterMod => s2_f.freq; 
        100::ms => now; 
        i++; 
        Math.floor(lfo1.last() * SoundVariation) => s1_g.gain; 
        
        if(shredArray[me.id()-1] == 1)
        {
            <<< me.id(), ": starting fade" >>>;
            while(g.gain() > 0)
            {
               g.gain() - 0.01 => g.gain;
               fadeOutDecrement => now;
            }
            0 => shredArray[me.id()-1];
            g =< dac;
        }
    }
}

/*
<<< "master.gain", master.gain() >>>;
1 => master.gain;
*/
spork ~ playHypnoDrone(120, 0.5, 30::ms) @=> Shred shred1;
10::second => now;
spork ~ playHypnoDrone(140, 0.5, 60::ms) @=> Shred shred2;
10::second => now;
1 => shredArray[shred1.id()-1];
5::second => now;
1 => shredArray[shred2.id()-1];
10::second => now;
/*
while (master.gain() > 0)
{
   //master.gain() - 0.01 => master.gain;
   100::ms => now;
}
*/


