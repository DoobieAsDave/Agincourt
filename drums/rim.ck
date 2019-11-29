BPM tempo;

SndBuf2 rim => Pan2 stereo => dac;

//

me.dir(-1) + "audio/drums/rim.wav" => rim.read;
rim.samples() => rim.pos;
.75 => rim.rate;

//

[0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0] @=> int sequence[];

while(true) {
    for (0 => int beat; beat < 2; beat++) {
        for (0 => int step; step < sequence.cap(); step++) {
            if (sequence[step]) {
                if (step == 14 && beat == 2) {
                    repeat(2) {
                        Math.random2f(-.2, .2) => stereo.pan;
                        0 => rim.pos;    

                        tempo.eighthNote / 2 => now;
                    }

                    continue;
                }
                else {
                    Math.random2f(-.2, .2) => stereo.pan;
                    0 => rim.pos;                    
                }
            }            

            tempo.eighthNote => now;
        }
    }
}