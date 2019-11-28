BPM tempo;

SndBuf sample => dac;
sample => Delay d1 => dac;
sample => Delay d2 => dac;
sample => Delay d3 => dac;
d1 => d1;
d2 => d2;
d3 => d3;

//

me.dir(-2) + "audio/samples/a.wav" => sample.read;
sample.samples() => sample.pos;

tempo.note / 3 => d1.max => d1.delay;
tempo.note * Math.random2f(.8, 1.6) => d2.max => d2.delay;
tempo.note => d3.max => d3.delay;

.6 => d1.gain => d2.gain => d3.gain;

//

while(true) {
    for (0 => int step; step < 4; step++) {
        if (step != 3) {
            1 => sample.rate;
        }
        else {
            .75 => sample.rate;
        }

        .5 => sample.gain;
        0 => sample.pos;
        sample.length() => now;

        0 => sample.gain;
        (tempo.note * 8) - sample.length() => now;
    }
}