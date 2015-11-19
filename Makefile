.PHONY: all build spec format

all: spec build

build: bin/citrine

bin/citrine: $(shell find . -name *.cr)
	@mkdir -p bin
	@crystal build -o bin/citrine src/citrine.cr

spec: $(shell find . -name *.cr)
	@crystal spec

format:
	@crystal tool format .
