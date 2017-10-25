DOCUMENT = currvita

.PHONY: default
default: $(DOCUMENT).pdf

.PHONY: $(DOCUMENT).pdf
$(DOCUMENT).pdf:
	latexmk $(OPT) -halt-on-error -shell-escape -pdf $(DOCUMENT)

view: default
	evince $(DOCUMENT).pdf &

.PHONY: continuous
continuous:
	OPT="-pvc " $(MAKE) $(DOCUMENT).pdf

.PHONY: clean
clean:
	latexmk -C

.PHONY: distclean
distclean: clean
	$(RM) $(DOCUMENT).pdf
