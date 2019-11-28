BPM tempo;

SndBuf rim => dac;

//

me.dir(-1) + "audio/drums/rim.wav" => rim.read;
rim.samples() => rim.pos;

//

[0, 0, 0, 1, 0, 0, 0, 0] @=> int sequence[];

while(true) {
    for (0 => int step; step < sequence.cap(); step++) {
        if (sequence[step]) {
            0 => rim.pos;
        }

        tempo.quarterNote => now;
    }
}