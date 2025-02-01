I found myself often copy-and-pasting the same basic set of files every time I needed a clean PSX source tree. So I decided to make an actual template for future use.

Only the most basic necessities to build a PS-EXE are provided. A simple Makefile, the linker script from the [PCSX-Redux](https://github.com/grumpycoders/pcsx-redux/) project (thanks Nic <3), spicyjpeg's [bare metal headers](https://github.com/spicyjpeg/ps1-bare-metal/tree/main/src/ps1), and a
hello world program. No libraries are included. The C runtime from your own toolchain will (hopefully) be used.

You'll probably have to edit the make file. I get my compiler from Nix and therefore it has a weird invocation name. On the plus side, in case you use Nix, I've provided my `flake.nix` file.
Call `nix develop` and you're good to go.

Optionally, the [converted PsyQ 4.7 libraries](https://github.com/pcsx-redux/nugget/tree/main/psyq) from nugget are included, along with the [fixed header files by johnbaumann](https://github.com/johnbaumann/psyq_include_what_you_use). An example of how to use them is in the make file. Feel free to remove the `psyq` directory if you don't plan on using them.

## Usage
- Update `Makefile` based on what you need.
- Call `make`.

## TODO
- Add basic PsyQ usage to the example.
