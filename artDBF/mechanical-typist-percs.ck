// human interface device
Hid hid;

// a message to convey data from HID
HidMsg msg;

// device number
9 => int device;

if( hid.openKeyboard( device ) == false ) me.exit();

// print
<<< "keyboard:", hid.name(), "ready for action" >>>;
// sound chain
Echo ech;
Echo ech2;
JCRev reverb;
JCRev reverb2;
JCRev reverb3;

Gain master;
0.5 => master.gain;
BeeThree organ => ech => reverb => master => dac;
Shakers shake => ech => reverb => master => dac;
// set the reverb mix and gain
//0.5 => reverb3.gain;
//.025 => reverb3.mix;

//set reverb and echo parameters
0.4 => reverb.gain;
.2 => reverb.mix;
16::second => ech.max;
7::second => ech.delay;

0.2 => ech.mix;

0.1 => reverb2.mix;
25::second => ech2.max;
15::second => ech2.delay;

0.05 => ech2.gain;
0.3 => ech2.mix;

// percussion instruments
// kick drum
SndBuf kick => ech2 => reverb2 => dac;
me.dir()+"/audio/kick_04.wav" => kick.read;
// clap
SndBuf clap => ech2 => reverb2 => dac;
me.dir()+"/audio/clap_01.wav" => clap.read;
// cowbell
SndBuf cow => ech2 => reverb2 => dac;
me.dir()+"/audio/cowbell_01.wav" => cow.read;
// highhat
SndBuf hat => ech2 => reverb2 => dac;
me.dir()+"/audio/hihat_02.wav" => hat.read;
// snare
SndBuf snare => ech2 => reverb2 => dac;
me.dir()+"/audio/snare_01.wav" => snare.read;

// percussion parameters
kick.samples() => kick.pos;
0.2 => kick.gain;
clap.samples() => clap.pos;
0.4 => clap.gain;
cow.samples() => cow.pos;
0.5 => cow.gain;
hat.samples() => hat.pos;
0.5 => hat.gain;
snare.samples() => snare.pos;
0.5 => snare.gain;


// set tempo/note durations using BPM class
BPM bpm;
bpm.tempo(92);

fun void PlayShaker()
{
    // frequency..
    // note: Math.randomf() returns value between 0 and 1
    if( Math.randomf() > 0.625 )
    {
        Math.random2( 5, 8 ) => shake.which;
        Std.mtof( Math.random2f( 0.0, 128.0 ) ) => shake.freq;
        Math.random2f( 40, 128 ) => shake.objects;
        <<< "instrument #:", shake.which(), shake.freq(), shake.objects() >>>;
    }

    // shake it!
    Math.random2f( 0.9, 1.3 ) => shake.noteOn;

    // note: Math.randomf() returns value between 0 and 1
    if( Math.randomf() > 0.9 )
    { bpm.halfNote => now; }
    else if( Math.randomf() > .925 )
    { bpm.quarterNote => now; }
    else if( Math.randomf() > .05 )
    { bpm.eighthNote => now; }
    else
    {
        1 => int i => int pick_dir;
        // how many times
        4 * Math.random2( 1, 5 ) => int pick;
        0.0 => float pluck;
        0.7 / pick => float inc;
        // time loop
        for( ; i < pick; i++ )
        {
            bpm.thirtysecondNote => now;
            Math.random2f(.2,.3) + i*inc => pluck;
            pluck + -.2 * pick_dir => shake.noteOn;
            // simulate pluck direction
            !pick_dir => pick_dir;
        }

        // let time pass for final shake
        bpm.thirtysecondNote => now;
    }
}

fun void PlayKick()
{
    0 => kick.pos;        
    bpm.DurationList[2] => now;
}


while( true )
{
    // wait for event
    hid => now;
    
    // get event message
    while( hid.recv( msg ) )
    {
        // check for button pressed (down or up)
        if( msg.isButtonDown() )
        {
            <<< "BUTTON DOWN", msg.ascii >>>;
            if( msg.ascii == 32) 
            {               
                <<< "HIT DRUM" >>>;
                spork ~ PlayKick();
            } else if (msg.ascii == 10)
            {
                spork ~ PlayShaker();
            }
        }
        else
        {
            <<< "BUTTON UP", msg.ascii >>>;
            //1 => organ.noteOff;
        }
    }
}