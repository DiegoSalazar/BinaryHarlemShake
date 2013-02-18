BinaryHarlemShake
=================

![Have you seen this harlem shake thing?](http://i.imgur.com/5CKyDK3.png)

This is a thing now, right? Right guys?

For the uninitiated:
http://www.reddit.com/r/harlemshake

To Run:
=======
```bash
sudo gem install harlem_bits
harlem_bits
```

You can specify width and height:
```bash
harlem_bits 50 25
```

Dependencies:
============
* The "colored" gem for colored terminal output.
* afplay (Mac only).
* mpg123 (Linux only, thanks Arkaniad!).

Todos:
=====
* Figure out how to work with frame rates and timings to make bits dance nicer.
* Figure out how to render to the terminal more efficiently. Currently just outputting screen after screen creating a huge scroll history, ncurses maybe?
* Control-C doesn't exit cleanly, currently must press twice.
