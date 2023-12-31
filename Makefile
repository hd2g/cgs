CC := racket -I typed/racket
ENTRY := cgs-lib/cgs/base.rkt

.PHONY: all dev test

all:
	@$(CC) $(ENTRY)

dev:
	@while sleep 1; do find . -type f -name '*.rkt' | entr -s 'make -s'; done

test:
	@raco test cgs-lib
