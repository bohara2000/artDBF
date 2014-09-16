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

public class MulticombCCRMA
{
	Multicomb comb;
	Gain gain;

	//adc => comb => gain;
	comb => gain;
	500::ms => comb.revtime;
	0.23 => gain.gain;

	0 => int start;

	fun void Start()
	{
		1 => start;
		adc => comb;		
		while(start > 0)
		{
			comb.set(220,700);
			//1 => imp.next;
			50::ms => now;
		}
	}

	fun void Stop()
	{
		0 => start;
		adc =< comb;
	}
}
