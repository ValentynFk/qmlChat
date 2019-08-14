.pragma library

function sleep_for(delay)
{
    var start = new Date().getTime();
    while (new Date().getTime() < start + delay);
}

var golden_ratio = 1.61803398875

function golder_ratio_times(multiplier)
{
    return golden_ratio * multiplier
}
