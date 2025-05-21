PREFIX ?= /usr/local
BINDIR = $(PREFIX)/bin

all:
	@echo "Run 'make install' to install NeoSorcerer."

install:
	install -d $(BINDIR)
	install -m 755 neosorcery $(BINDIR)/neosorcery
	install -m 755 cast $(BINDIR)/cast
	install -m 755 cast_internal $(BINDIR)/cast_internal
	install -m 755 dispel $(BINDIR)/dispel
	install -m 755 dispel_internal $(BINDIR)/dispel_internal
	install -m 755 gaze $(BINDIR)/gaze
	install -m 755 scribe $(BINDIR)/scribe
	@echo "NeoSorcerer installed to $(BINDIR)"

uninstall:
	rm -f $(BINDIR)/neosorcery
	rm -f $(BINDIR)/cast
	rm -f $(BINDIR)/cast_internal
	rm -f $(BINDIR)/dispel
	rm -f $(BINDIR)/dispel_internal
	rm -f $(BINDIR)/gaze
	rm -f $(BINDIR)/scribe
	@echo "NeoSorcerer removed from $(BINDIR)"
