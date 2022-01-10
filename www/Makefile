THIS_DIR := $(patsubst %/,%,$(dir $(realpath $(firstword $(MAKEFILE_LIST)))))
DESTINATION := $(THIS_DIR)/build

.PHONY: build

build:
	raco scribble --htmls --dest $(DESTINATION) index.scrbl

clean:
	rm -rf $(DESTINATION)
