SOURCES = $(wildcard */main.swift)
EXES = $(patsubst %/main.swift,build/%,$(SOURCES))
OUTPUTS = $(patsubst %/main.swift,build/%-out.txt,$(SOURCES))

all: $(OUTPUTS)

$(EXES): build/%: %/main.swift | build
	swiftc -o $@ functions.swift $<

$(OUTPUTS): build/%-out.txt: build/%
	$< > $@
	cat $@

build:
	mkdir -p build

clean:
	rm -rf build
