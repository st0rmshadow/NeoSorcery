PREFIX ?= /usr
BINDIR = $(PREFIX)/bin
install:
	install -d $(BINDIR)
	install -m 755 neosorcery cast cast_internal dispel dispel_internal gaze scribe $(BINDIR)
uninstall:
	rm -f $(BINDIR)/neosorcery $(BINDIR)/cast $(BINDIR)/cast_internal \
      $(BINDIR)/dispel $(BINDIR)/dispel_internal $(BINDIR)/gaze $(BINDIR)/scribe
