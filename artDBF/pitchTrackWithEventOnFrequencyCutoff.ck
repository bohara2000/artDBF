/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2014 held jointly by the individual authors.

    This file is part of LiCK.

    LiCK is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    LiCK is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with LiCK.  If not, see <http://www.gnu.org/licenses/>.

*/
CustomMezmerizer m;

/*
    put values in here for ten seconds, 
    then get the average to determine base frequency
*/
FloatArrayList list; 

adc => PitchTrack pt => blackhole;

512 => pt.frame;
4 => pt.overlap;

spork ~ _sporkAtSampleRate();

10::minute => now;

<<<"done">>>;
fun void doPattern(float value)
{
   <<< "do yo dance, do yo dance..." >>>;
   if (m.IsPlayingTone == 0){
       1 => m.IsPlayingTone;
       m.playTone(value, 10);
   }
}

fun void playTone(float value, float howLong)
{
        <<< "hello ", value >>>;
        /*
        value => bt[b3s].freq;
        bt[b3s].noteOn(1.0);
        Math.round(howLong)::second => now;
        bt[b3s].noteOff(1.0);
        100::ms => now;
        */
        Mesmerizer mesmerizer => ADSR e => dac;
        // set a, d, s, and r
        e.set( 10::ms, 8::ms, .5, 500::ms );
        330.0 => mesmerizer.filterFreq;
        0.0 => mesmerizer.filterSpread;

        SinOsc low;
        0.3 => low.gain;
        value*0.8 => low.freq;

        SinOsc high;
        0.3 => high.gain;
        value => high.freq;

        low => mesmerizer;
        high => mesmerizer;

        now/1::second => float start;
        while ( true )
        {
            e.keyOn();
            Math.round(howLong)::second => now;
            
            Math.random2f(0.05, 10.0) => mesmerizer.lfoFreq;
            Math.random2f(0.0001, 0.00001) => mesmerizer.phasorLfoDepth;
            e.keyOff();
           // <<<"lfo freq", mesmerizer.lfoFreq(), "phasor lfo depth", mesmerizer.phasorLfoDepth()>>>;
        }
}


fun float getAverage( FloatList ls )
{
    float result;
    for (0 => int i; i < ls.size(); i++)
    {
        ls.get(i) +=> result;
    }
    
    return Math.round(result/ls.size());
}

fun void _sporkAtSampleRate()
{
    now/1::second => float startTime;
    
    while (true)
    {
        1::samp => now;
        pt.get() => float freq;
        if (freq != last)
        {
            <<<now, "base frequency: ", baseFreq, "; freq: ", freq>>>;
            freq => last;
            if ((now/1::second - startTime) < 10) {
                //freq => baseFreq;
                list.add(freq);
            } else {
                getAverage(list) => baseFreq;
                1 => GotBaseFreq;
            }
            
            if (GotBaseFreq == 1 && (freq > baseFreq*1.2))
            {                
                spork ~ doPattern(440);
            } else if (GotBaseFreq == 1 && (freq < baseFreq* 0.5)){                
                spork ~ doPattern(240);
            }
            
        }
    }
}
