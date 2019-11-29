BPM tempo;

SndBuf hihat => dac;

//

me.dir(-1) + "audio/drums/hihat.wav" => hihat.read;
hihat.samples() => hihat.pos;
.2 => hihat.gain;

//

8 => int sequenceLength;
while(true) {    
    Math.random2((sequenceLength - 1) - 3, (sequenceLength - 1) - 1) => int accentStep;

    for (0 => int step; step < sequenceLength; step++) {
        if (step != accentStep) {
            .8 => hihat.rate;
            getRandomPos(0, 5) => hihat.pos;

            tempo.eighthNote => now;
        }
        else {
            hihat.rate() + .1 => hihat.rate;

            Math.random2(1, 3) => int repetition;            
            repeat(repetition) {
                hihat.rate() - .05 => hihat.rate;
                getRandomPos(3, 10) => hihat.pos;

                tempo.eighthNote / repetition => now;
            }
        }
    }
}

function int getRandomPos(int min, int max) {
    min / 100 => float minDecimal;
    max / 100 => float maxDecimal;

    return Math.random2(Std.ftoi(hihat.samples() * minDecimal), Std.ftoi(hihat.samples() * maxDecimal));
}