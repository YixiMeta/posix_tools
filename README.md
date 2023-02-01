# POSIX_TOOLS
[![License: AGPL
v3](https://img.shields.io/badge/License-AGPL_v3-blue.svg)](https://www.gnu.org/licenses/agpl-3.0)

This repo delivery useful and portable tools for everyone. New utilities are keep coming!

## Installation
All tools currently available can be used out-of-box. For convenience, you may run the `install.sh` script to install these utilities to `/usr/local/bin`. The manpages will also be installed to `/usr/local/share/man`.

* You could supply `-D` or `--dest` and the destination path as prefix to the install script.

* If you only want to install manpage, you can do the following:
```sh
cd ./man
make install
# alternatively, if you don't have enough privilege:
# sudo make install
```

## User Guide
Check for each manpage or supply `-h` option for the usage of each utilities presented in this repo.

## Miscellaneous
Most of the utilities in this repo has also C / Python alternatives, which is not licenced under AGPLv3. If you want to modify / redistribute / use the utilities in proprietary code, you may want to [contact us](mailto:business@yiximeta.com).

## Bug Report
You may open an issue at [this repo's GitHub mirror](https://github.com/YixiMeta/posix_tools/).

## Acknowledgement
* This project is not a commercial product.
* The `Makefile` for manpage is adapted from the `Makefile` included in `man-pages-posix-2017`, an original copyright notice is attached to the `man/Makefile`.
* 'POSIX' is also a trademark of the IEEE. This project is not affiliated nor supported by IEEE.

## Copyright
(C) 2023 Yixi Meta

*Code or documentation contributed by others has copyright notice attached in the file or reported in [Acknowledgement](#acknowledgement)*
