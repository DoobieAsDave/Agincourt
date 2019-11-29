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
.75 => sample.rate;
.5 => sample.gain;

tempo.quarterNote / 3 => echo.max => echo.delay;
.2 => echo.mix;
.4 => echo.gain;

0.1 :: second => d1.max => d1.delay;
0.7 :: second => d2.max => d2.delay;
1.5 :: second => d3.max => d3.delay;

.4 => d1.gain => d2.gain => d3.gain;

//

while(true) {
    tempo.note * 5 => now;    
    0 => sample.pos;        
    tempo.note * 3 => now;
}
