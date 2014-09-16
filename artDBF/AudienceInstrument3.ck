// Audience Instrument 3
// Mechanical typist
// this will take ascii text from OSC signals

public class AudienceInstrument3
{
    // Unique Identifier
    string ID;
    
    // sound chain
    Echo ech;
    Echo ech2;
    JCRev reverb;
    JCRev reverb2;
    JCRev reverb3;
    Gain gain;

    JCRev r => gain;
    0.1 => gain.gain;

    //set reverb and echo parameters
    0.125 => r.gain;
    0.23 => r.mix;
    0.04 => reverb.gain;
    .2 => reverb.mix;
    6::second => ech.max;
    2::second => ech.delay;

    0.2 => ech.mix;

    0.1 => reverb2.mix;
    10::second => ech2.max;
    4::second => ech2.delay;

    0.05 => ech2.gain;
    0.13 => ech2.mix;

    // set tempo/note durations using BPM class
    BPM bpm;
    bpm.tempo(92);

    // percussion instruments
    // kick drum
    SndBuf kick => ech2 => reverb2 => gain;
    me.dir()+"/audio/click_03.wav" => kick.read;

    // percussion parameters
    kick.samples() => kick.pos;
    1.2 => kick.gain;
    //kick => r;

    // which keyboard
    9 => int device;
    // get from command line
    if( me.args() ) me.arg(0) => Std.atoi => device;

    [-2, -1, 0, 1, 2, 3] @=> int octaveRange[];
    [50, 52, 53, 55, 57, 59, 60, 62] @=> int CurrentScale[];
    int word[0];   

    fun void playNoteForDuration(int asciiValue, dur duration)
    {
       SinOsc s => Envelope e => r;
       80::ms => e.duration;
        
       CurrentScale[ asciiValue % CurrentScale.cap() ]  => Std.mtof => float freq;
       freq + (12 * (1 + octaveRange[asciiValue % octaveRange.cap()])) => float transposedFrequency;
        <<< "Playing note ", asciiValue, "mapped to Frequency (not transposed)", freq, " (transposed) ", transposedFrequency, "for (in seconds)", duration/1::second  >>>;    
        transposedFrequency => s.freq;
        e.keyOn();
        2::second => now;
        e.keyOff();
        100::ms => now;
        
    }

    fun void PlayKick()
    {
        <<< "playing kick from instrument 3" >>>;
        0 => kick.pos;
        kick.samples()::samp => now;
    }
    
    fun void Type(int ASCIIValue)
    {
        //<<< "down:", msg.which, "(code)", msg.key, "(usb key)", msg.ascii, "(ascii)" >>>;
        if (ASCIIValue != 32)
        {
          word << ASCIIValue;
        } 
        else
        {
            if (word.cap() > 0)
            {
                for (0 => int i; i < word.cap(); i++)
                {
                    spork ~ playNoteForDuration(word[i], (word.cap() - i)::second );
                    if (i % 5 == 0)
                    {
                        1::second => now;
                    }
                }
                <<< "Clear word array..." >>>;
                word.clear();
                //<<< "REALLY Play something representing space..." >>>;
                //spork ~ PlayKick();
                
            } else {
                <<< "NOW Play something representing space..." >>>;
                //spork ~ PlayKick();
            }
            
        }    
    }
    
}
