# FindMax
This program sorts through a set of data files to find the local maxima of a set of digitized, unsmoothed data. This is less straight-forward than it sounds because raw data jumps around, making a simple "turn-the-corner" approach to finding maxima irrelevant.

This code was written in Octave 3.6.4 but should run in other versions as well. It should also run in Matlab, though perhaps with some tweaking.

The input files are .csv but should easily be changed to .txt. The output file is likewise .csv.
