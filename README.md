# CS 3330 slide source files

Topics in order. A main slide deck for each topic is generated from the `talk.tex` file in each
directory.

*  intro: course instroduction (pretty UVa-specific)
*  compileSteps: compilation pipeline (object files, linking)
*  asm: x86-64 assembly review
*  isas: instruction set architectures
*  y86: Y86-64 instruction set
*  seq: single-cycle processor + our hardware description language
    *  source files for hardware description language parts of these slides are in the `hcl/` directory
*  pipe: pipelined procesor
*  caching: processor caches and cache performance (including cache blocking)
*  optimization: optimizations and out-of-order processors and vector instructions
    *  OOO slides sources are from the `ooo/` directory
    *  vector instruction slides are partially from the `vector/` directory
*  exceptions: exceptions (including potentail short section on exceptions and OOO)
*  vm: virtual memory

# Building

There is a Makefile in this directory. You will need available:

*  latexrun (https://github.com/aclements/latexrun);
*  a TeX installation similar to TeXLive;

Running `make` will produce a bunch of PDFs in the `dist` directory.

Within subdirectories, you can use `make` to build `talk-slides.pdf` (full PDF)
and `talk-slides-heldback.pdf` (omits some question answers).
