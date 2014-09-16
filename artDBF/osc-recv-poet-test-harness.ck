// (launch with OSC_send.ck)

// Add instruments used by audience

// the patch
//AudienceInstrument1 instrument1Array[0];
/**/
PitchTrackBySemitoneDistance pitchTrackFifth;
PitchTrackBySemitoneDistance pitchTrackSeventh;
MulticombCCRMA multicomber;
FollowerHypno hypnodrone;
SpectacleClass spectacleLater;
StutterSinOsc stutterer;


Gain master => dac;
0.4 => master.gain;
/**/
// patch audio to dac as well
//adc => Gain gADC => dac;

pitchTrackFifth.r => Gain p5th => master;
pitchTrackSeventh.r => Gain p7th => master;
multicomber.gain => Gain mGain => master;
hypnodrone.g => Gain hGain => master;
spectacleLater.m => Gain spectGain => master;
stutterer.r => Gain stutGain => master;

/**/
0.0 => p5th.gain;
0.0 => p7th.gain;
0.0 => mGain.gain;
0.0 => hGain.gain;
0.0 => spectGain.gain;
0.0 => stutGain.gain;
//1.2 => gADC.gain;

// create our OSC receiver
OscRecv recv;
// use port 6449
7475 => recv.port;
// start listening (launch thread)
recv.listen();

// create an address in the receiver, store in new variable
recv.event( "/pitchFollowerFifth, s, f" ) @=> OscEvent oePoetPitchFollowerFifth;
recv.event( "/pitchFollowerSeventh, s, f" ) @=> OscEvent oePoetPitchFollowerSeventh;
recv.event( "/multicomb, s, f" ) @=> OscEvent oePoetMultiComb;
recv.event( "/hypnodrone, s, f" ) @=> OscEvent oePoetHypnodrone;
recv.event( "/spectacle, s, f" ) @=> OscEvent oePoetSpectacle;
recv.event( "/stutter, s, f" ) @=> OscEvent oePoetStutter;

fun void PoetPitchFollowerFifthHandler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oePoetPitchFollowerFifth => now;

		// grab the next message from the queue. 
		while ( oePoetPitchFollowerFifth.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oePoetPitchFollowerFifth.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oePoetPitchFollowerFifth.getFloat() => messageValue;
			// print
			<<< "got (via OSC): /pitchFollowerFifth", IPAddress, ",", messageValue >>>;
			// go do something...

            Math.pow(1.059,7) => float fifthInterval;

            // Effect 1 button passes Maraca
            if(messageValue > 0.0)
            {
                // NOTE - may need to change the gain here...
                1 => p5th.gain;
                //gADC.gain() => pitchTrackFifth.r.gain;
                1.2 => pitchTrackFifth.r.gain;
                spork ~ pitchTrackFifth.Start(fifthInterval);
                
            } else {
                spork ~ pitchTrackFifth.Stop();
                0.0 => p5th.gain;
            }
            
		}
	}	
}

fun void PoetPitchFollowerSeventhHandler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oePoetPitchFollowerSeventh => now;

		// grab the next message from the queue. 
		while ( oePoetPitchFollowerSeventh.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oePoetPitchFollowerSeventh.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oePoetPitchFollowerSeventh.getFloat() => messageValue;
			// print
			<<< "got (via OSC): /pitchFollowerSeventh", IPAddress, ",", messageValue >>>;
			// go do something...


            Math.pow(1.059,10) => float dominantSeventhInterval;

            // Effect 1 button passes Maraca
            if(messageValue > 0)
            {
                0.9 => p7th.gain;
                //gADC.gain() => pitchTrackSeventh.r.gain;
                1.2 => pitchTrackSeventh.r.gain;
                spork ~ pitchTrackSeventh.Start(dominantSeventhInterval);
            } else {
                spork ~ pitchTrackSeventh.Stop();
                0.0 => p7th.gain;
            }
            
		}
	}	
}

fun void PoetMultiCombHandler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oePoetMultiComb => now;

		// grab the next message from the queue. 
		while ( oePoetMultiComb.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oePoetMultiComb.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oePoetMultiComb.getFloat() => messageValue;
			// print
			<<< "got (via OSC): /multicomb", IPAddress, ",", messageValue >>>;
			// go do something...

                        
            if(messageValue > 0)
            {
                0.9 => mGain.gain;
                //gADC.gain() => multicomber.gain.gain;
                0.9 => multicomber.gain.gain;
                spork ~ multicomber.Start();
            } else {
                spork ~ multicomber.Stop();
                0.0 => mGain.gain;
            }            
		}
	}	
}

fun void PoetHypnoDroneHandler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oePoetHypnodrone => now;

		// grab the next message from the queue. 
		while ( oePoetHypnodrone.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oePoetHypnodrone.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oePoetHypnodrone.getFloat() => messageValue;
			// print
			<<< "got (via OSC): /hypnodrone", IPAddress, ",", messageValue >>>;
			// go do something...
			

            
            if(messageValue > 0)
            {
                0.9 => hGain.gain;
                spork ~ hypnodrone.Start();
            } else {
                spork ~ hypnodrone.Stop();
                0.0 => hGain.gain;
            }
            
		}
	}	
}

fun void PoetSpectacleHandler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oePoetSpectacle => now;

		// grab the next message from the queue. 
		while ( oePoetSpectacle.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oePoetSpectacle.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oePoetSpectacle.getFloat() => messageValue;
			// print
			<<< "got (via OSC): /spectacle", IPAddress, ",", messageValue >>>;
			// go do something...
            
            if(messageValue > 0)
            {
                0.9 => spectGain.gain;
                //gADC.gain() => spectacleLater.m.gain;
                0.9 => spectacleLater.m.gain;
                spork ~ spectacleLater.Start();
            } else {
                spork ~ spectacleLater.Stop();
                0.0 => spectGain.gain;
            }
            /**/
		}
	}	
}

fun void PoetStutterHandler()
{
	// infinite event loop
	while ( true )
	{
		// wait for event to arrive
		oePoetStutter => now;

		// grab the next message from the queue. 
		while ( oePoetStutter.nextMsg() != 0 )
		{ 
			string IPAddress;
			float messageValue;
			// getString fetches the expected string (as indicated by "s")
			oePoetStutter.getString() => IPAddress;
			// getFloat fetches the expected float (as indicated by "f")
			oePoetStutter.getFloat() => messageValue;
			// print
			<<< "got (via OSC): /stutter", IPAddress, ",", messageValue >>>;
			// go do something...

            
            if(messageValue > 0)
            {
                1.4 => stutGain.gain;
                1.2 => stutterer.r.gain;
                spork ~ stutterer.Start();
            } else {
                spork ~ stutterer.Stop();
                0.0 => stutGain.gain;
            }
            
		}
	}	
}


// kick off event handlers

spork ~ PoetPitchFollowerFifthHandler();
spork ~ PoetPitchFollowerSeventhHandler();
spork ~ PoetMultiCombHandler();
spork ~ PoetHypnoDroneHandler();
spork ~ PoetSpectacleHandler();
spork ~ PoetStutterHandler();

while (true)
{
    10::ms => now;
}