SLIDEDECKS = \
    intro \
    compileSteps \
    asm \
    isas \
    y86 \
    seq \
    pipe \
    caching \
    optimization \
    exceptions \
    vm

all: $(patsubst %,dist/%.pdf,$(SLIDEDECKS))

clean:
	rm -r dist

dist:
	mkdir dist

dist/%.pdf: % dist
	cd $< && make && cp talk-slides.pdf ../dist/$<.pdf

.PHONY: all
