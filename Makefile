CC := racket -I typed/racket
ENTRY := cgs-backend/cgs/base.rkt

.PHONY: all dev

all:
	@$(CC) $(ENTRY)

dev:
	@while sleep 1; do find . -type f -name '*.rkt' | entr -s 'make -s'; done
