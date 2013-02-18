BinaryHarlemShake
=================

Because anything can be done in binary.

For the uninitiated:
http://www.reddit.com/r/harlemshake

To Run:
=======
```bash
git clone git@github.com:DiegoSalazar/BinaryHarlemShake.git
cd BinaryHarlemShake
ruby harlem_bits.rb <width> <height>
```

Todo:
=====

* Figure out how to work with frame rates and timings to make bits dance nicer.
* Figure out how to render to the terminal more efficiently. Currently just outputting screen after screen creating a huge scroll history, ncurses maybe?
* Control-C doesn't exit cleanly, currently must press twice.
