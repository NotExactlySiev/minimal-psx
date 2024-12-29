I found myself often copy-and-pasting the same basic set of files every time I needed a clean PSX source tree. So I decided to make an actual template for future use.

Only the most basic necessities to build a PS-EXE are provided. A simple Makefile, the linker script from the PCSX-Redux project (thanks Nic <3), spicyjpeg's bare metal headers, and a
hello world program. No libraries are included. The C runtime from your own toolchain will (hopefully) be used.

You'll probably have to edit the make file. I get my compiler from Nix and therefore it has a weird invocation name. On the plus side, in case you use Nix, I've provided my `flake.nix` file.
Call `nix develop` and you're good to go.

## Usage
- Update `Makefile` based on what you need.
- Call `make`.

## TODO
- Optional Psy-Q Support
