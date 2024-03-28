MODULE = $(notdir #(CURDIR))

# all
.PHONY: all
all: bin/$(MODULE) lib/$(MODULE)
	$^

# format
.PHONY: format
format:

# rule
bin/$(MODULE): $(C) $(H)
	$(CXX) $(CFLAGS) -o $@ $(C) $(L)

# doc
.PHONY: doc
doc:

# install
.PHONY: install update gz
install:
update:
gz:

