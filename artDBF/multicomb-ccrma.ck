////////////////////////////////////////////////////
// Multicomb                                      //
//                                                //
// Multiple simultaneous comb filters randomly    //
// chosen within a specified frequency range      //
// and spread across the stereo field             //
////////////////////////////////////////////////////
//
// Settings:
//
// num (int): set number of comb filters (default 5)
// minfreq (float): set low frequency
// maxfreq (float): set high frequency
// set (float, float): set both low and high freqs
// revtime (dur): total ring time (default 1::second)

adc => Multicomb comb => Gain master => dac;
500::ms => comb.revtime;
0.13 => master.gain;


while(true)
{
	comb.set(220,700);
	//1 => imp.next;
	50::ms => now;
}
