PREFIX ?= /usr
BINDIR = $(PREFIX)/sbin

GRIMOIRE_REPO  = https://github.com/st0rmshadow/NeoSorcery_grimoire.git
GRIMOIRE_DEST  = /etc/neosorcery/grimoire

.PHONY: install install-grimoire uninstall

install: install-binaries install-grimoire

install-binaries:
	install -d $(BINDIR)
	install -m 755 neosorcery $(BINDIR)/neosorcery
	install -m 755 cast $(BINDIR)/cast
	install -m 755 cast_internal $(BINDIR)/cast_internal
	install -m 755 dispel $(BINDIR)/dispel
	install -m 755 dispel_internal $(BINDIR)/dispel_internal
	install -m 755 gaze $(BINDIR)/gaze
	install -m 755 scribe $(BINDIR)/scribe
	install -m 755 cast-defaults $(BINDIR)/cast-defaults

install-grimoire:
	@echo "Installing NeoSorcery grimoire from bundled source…"
	mkdir -p $(GRIMOIRE_DEST)
	cp -r grimoire/* $(GRIMOIRE_DEST)/	
uninstall:
	rm -f $(BINDIR)/neosorcery
	rm -f $(BINDIR)/cast
	rm -f $(BINDIR)/cast_internal
	rm -f $(BINDIR)/dispel
	rm -f $(BINDIR)/dispel_internal
	rm -f $(BINDIR)/gaze
	rm -f $(BINDIR)/scribe
	sudo rm -f /etc/neosorcery.conf
	rm -f $$HOME/.neosorcery/neosorcery.local.conf
	@echo "NeoSorcerer uninstalled and configuration removed."
