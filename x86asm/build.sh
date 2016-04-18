#!/bin/bash
/usr/local/bin/nasm -f macho64 main.S && ld -macosx_version_min 10.7.0 -lSystem -o main main.o
