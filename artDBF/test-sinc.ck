// FIR tests of Sinc filter(s), Perry R. Cook, 10/12
// Bunch - o - random filter settings

//Noise n => FIR f => WvOut w => dac;
//w.wavFilename("temp.wav");
Noise n => FIR f => dac;
0.1 => n.gain;

256 => f.order;

f.bpHetero(0.25);
//1.0 :: second => now;    
/*
7.333 => f.sinc;
1.0 :: second => now;

16.0 => f.sinc;
1.0 :: second => now;
32.0 => f.sinc;
1.0 :: second => now;
64.0 => f.sinc;
1.0 :: second => now;
*/

7.333 => float min;
64.0 => float max;
(min + max)/2 => float avg;
0.0 => float i;

while(true)
{
    avg + (avg*Math.sin(i)/2) => f.sinc;
    0.024 +=> i; // this would be a parameter to change...
    10::ms => now;
}

//w.closeFile();
