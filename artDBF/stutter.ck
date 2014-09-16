// run white noise through envelope
/*
SndBuf obama => Envelope e => Gain g => dac;

"/home/bohara/Downloads/chugins-master/PitchTrack/data/obama.wav" => obama.read;
0 => obama.pos;
*/
adc => Envelope e => Gain g => dac;
0.2 => g.gain;
// infinite time-loop
while( true )
{
    // random choose rise/fall time
    //Math.random2f(10,500)::ms => dur t => e.duration;
    30::ms => dur t => e.duration;
    // print
    <<< "rise/fall:", t/ms, "ms" >>>;

    // key on - start attack
    e.keyOn();
    // advance time by 800 ms
    Math.random2(10,100)::ms => now;
    // key off - start release
    e.keyOff();
    // advance time by 800 ms
    //80::ms => now;
}