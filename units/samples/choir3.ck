BPM tempo;

SndBuf sample => dac;
sample => Echo echo => dac;
sample => Delay d1 => dac;
sample => Delay d2 => dac;
sample => Delay d3 => dac;

echo => echo;
d1 => d1;
d2 => d2;
d3 => d3;

//

me.dir(-2) + "audio/samples/b.wav" => sample.read;
sample.samples() => sample.pos;
1.75 => sample.rate;
.25 => sample.gain;

tempo.sixteenthNote => echo.max => echo.delay;
.4 => echo.mix;
.2 => echo.gain;

Math.random2f(.1, .5) :: second => d1.max => d1.delay;
Math.random2f(.6, 2.5) :: second => d2.max => d2.delay;
Math.random2f(.05, .7) :: second => d3.max => d3.delay;

.4 => d1.gain => d2.gain => d3.gain;

//

while(true) {
    tempo.note * 7 => now;   

    for (0 => int rep; rep < 2; rep++) {
        if (rep == 0) {
            1.75 => sample.rate;
        }
        else {
            1.5 => sample.rate;
        }

        Math.random2(0, Std.ftoi(sample.samples() * .5)) => sample.pos;
        tempo.note / 2 => now;
    } 
}