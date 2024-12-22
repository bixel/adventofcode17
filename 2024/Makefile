SOURCES = $(wildcard */main.rs)
EXES = $(patsubst %/main.rs,build/%,$(SOURCES))
OUTPUTS = $(patsubst %/main.rs,build/%-out.txt,$(SOURCES))

all: $(OUTPUTS)

$(EXES): build/%: %/main.rs | build
	rustc -o $@ $<

$(OUTPUTS): build/%-out.txt: build/%
	$< > $@
	cat $@

build:
	mkdir -p build

clean:
	rm -rf build
