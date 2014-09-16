// BPM.ck
// global BPM conductor Class
public class BPM
{
    // global variables
    dur DurationList[6];
    static dur wholeNote, halfNote, quarterNote, eighthNote, sixteenthNote, thirtysecondNote;
    
    fun void tempo(float beat)  {
        // beat is BPM, example 120 beats per minute
        
        60.0/(beat) => float SPB; // seconds per beat
        SPB :: second => quarterNote;
        
        quarterNote*4 => wholeNote;
        quarterNote*2 => halfNote;
        quarterNote*0.5 => eighthNote;
        eighthNote*0.5 => sixteenthNote;
        quarterNote*0.5 => thirtysecondNote;
        
        // store data in array
        [wholeNote, halfNote, quarterNote, eighthNote, sixteenthNote, thirtysecondNote] @=> DurationList;
    }
}

