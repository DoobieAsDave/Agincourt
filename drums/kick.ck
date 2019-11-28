BPM tempo;

SndBuf kick => dac;

//

me.dir(-1) + "audio/drums/kick.wav" => kick.read;
kick.samples() => kick.pos;

//

[1, 0, 0, 0, 0, 1, 0, 0] @=> int sequence[];

while(true) {
    for (0 => int beat; beat < 2; beat++) {
        for (0 => int step; step < sequence.cap(); step++) {
            if (sequence[step]) {
                0 => kick.pos;             
            }
            
            tempo.quarterNote => now;
        }    
    }
}