PREFIX ?= /usr
BINDIR = $(PREFIX)/bin

install:
	install -d $(BINDIR)
	install -m 755 neosorcery $(BINDIR)/neosorcery
	install -m 755 cast $(BINDIR)/cast
	install -m 755 cast_internal $(BINDIR)/cast_internal
	install -m 755 dispel $(BINDIR)/dispel
	install -m 755 dispel_internal $(BINDIR)/dispel_internal
	install -m 755 gaze $(BINDIR)/gaze
	install -m 755 scribe $(BINDIR)/scribe
	install -m 755 cast-defaults $(BINDIR)/cast-defaults
	mkdir -p /etc/neosorcery/grimoire
	cp -r grimoire/* /etc/neosorcery/grimoire/

uninstall:
	rm -f $(BINDIR)/neosorcery
	rm -f $(BINDIR)/cast
	rm -f $(BINDIR)/cast_internal
	rm -f $(BINDIR)/dispel
	rm -f $(BINDIR)/dispel_internal
	rm -f $(BINDIR)/gaze
	rm -f $(BINDIR)/scribe
	sudo rm -f /etc/sorcery.conf
	rm -f $$HOME/.sorcery/sorcery.local.conf
	@echo "NeoSorcerer uninstalled and configuration removed."

