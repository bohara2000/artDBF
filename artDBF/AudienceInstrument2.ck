// Audience Instrument 2
// percussion pads

public class AudienceInstrument2 {
    JCRev reverb;
    0.2 => reverb.mix;
    Gain gain;
    0.4 => gain.gain;
    
    reverb => gain;
    
    SndBuf kick => reverb;
    SndBuf cowbell => reverb;
    SndBuf click => reverb;
    SndBuf hihat => reverb;
    
    // SndBuf Preparation
    // Open Files
    me.dir()+"/audio/kick_01.wav" => kick.read; 
    me.dir()+"/audio/cowbell_01.wav" => cowbell.read; 
    me.dir()+"/audio/click_03.wav" => click.read; 
    me.dir()+"/audio/hihat_01.wav" => hihat.read; 
    
    // Set playheads to end of file so no initial sound
    kick.samples() => kick.pos; 
    cowbell.samples() => cowbell.pos; 
    click.samples() => click.pos; 
    hihat.samples() => hihat.pos; 
    
    // set gains of each sample
    .25 => kick.gain;  
    .25 => cowbell.gain;
    .25 => click.gain;
    .25 => hihat.gain;
    
    fun void PlayKick()
    {
        0 => kick.pos;
        kick.samples()::samp => now;
    }
    
    fun void StopKick()
    {
        kick.samples() => kick.pos; 
    }
    
    fun void PlayCowbell()
    {
        0 => cowbell.pos;
        cowbell.samples()::samp => now;
    }
    
    fun void StopCowbell()
    {
        cowbell.samples() => cowbell.pos; 
    }
    
    fun void PlayClick()
    {
        0 => click.pos;
        click.samples()::samp => now;
    }
    
    fun void StopClick()
    {
        click.samples() => click.pos;
    }
    
    fun void PlayHiHat()
    {
        0 => hihat.pos;
        hihat.samples()::samp => now;
    }
    
    fun void StopHiHat()
    {
        hihat.samples() => hihat.pos;
    }
}
