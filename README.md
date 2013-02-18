BinaryHarlemShake
=================

![Have you seen this harlem shake thing?](http://i.imgur.com/5CKyDK3.png)

This is a thing now, right? Right guys?

For the uninitiated:
http://www.reddit.com/r/harlemshake

To Run:
=======
```bash
# download first, you need the mp3 file.
git clone git@github.com:DiegoSalazar/BinaryHarlemShake.git
gem install colored
cd BinaryHarlemShake
ruby harlem_bits.rb
```

Todo:
=====

* Figure out how to work with frame rates and timings to make bits dance nicer.
* Figure out how to render to the terminal more efficiently. Currently just outputting screen after screen creating a huge scroll history, ncurses maybe?
* Control-C doesn't exit cleanly, currently must press twice.
