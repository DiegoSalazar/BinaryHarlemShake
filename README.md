BinaryHarlemShake
=================

This is a thing now, right? Right guys?

For the uninitiated:
http://www.reddit.com/r/harlemshake

To Run:
=======
```bash
ruby < <(curl -s https://raw.github.com/DiegoSalazar/BinaryHarlemShake/master/harlem_bits.rb)
```

Todo:
=====

* Figure out how to work with frame rates and timings to make bits dance nicer.
* Figure out how to render to the terminal more efficiently. Currently just outputting screen after screen creating a huge scroll history, ncurses maybe?
* Control-C doesn't exit cleanly, currently must press twice.
