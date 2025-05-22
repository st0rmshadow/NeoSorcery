PREFIX ?= /usr
BINDIR = $(PREFIX)/bin

GRIMOIRE_REPO  = https://github.com/st0rmshadow/NeoSorcery_grimoire.git
GRIMOIRE_DEST  = /etc/neosorcery/grimoire

.PHONY: install install-binaries install-grimoire install-config uninstall

install: install-binaries install-grimoire install-config

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
@echo “Installing/updating NeoSorcery grimoire…”
@# If OFFLINE_MODE is 0 and git is available, use Git; otherwise fall back to bundled copy
@if [ “$$OFFLINE_MODE” = “0” ] && command -v git >/dev/null 2>&1; then 
if [ -d “$(GRIMOIRE_DEST)/.git” ]; then 
echo “ → Resetting existing Git repo”; 
git -C $(GRIMOIRE_DEST) fetch –all && 
git -C $(GRIMOIRE_DEST) reset –hard origin/master; 
else 
echo “ → Cloning repo from $(GRIMOIRE_REPO)”; 
rm -rf $(GRIMOIRE_DEST) && 
git clone $(GRIMOIRE_REPO) $(GRIMOIRE_DEST); 
fi; 
else 
echo “ → Offline or git not found: copying bundled grimoire”; 
mkdir -p $(GRIMOIRE_DEST) && 
cp -r grimoire/* $(GRIMOIRE_DEST)/; 
fi

install-config:
@echo “Installing default config /etc/neosorcery.conf…”
install -d /etc
install -m 644 neosorcery.conf /etc/neosorcery.conf

uninstall:
rm -f $(BINDIR)/neosorcery
rm -f $(BINDIR)/cast
rm -f $(BINDIR)/cast_internal
rm -f $(BINDIR)/dispel
rm -f $(BINDIR)/dispel_internal
rm -f $(BINDIR)/gaze
rm -f $(BINDIR)/scribe
rm -f /etc/neosorcery.conf
rm -rf /etc/neosorcery/grimoire
rm -f $$HOME/.sorcery/sorcery.local.conf
@echo “NeoSorcerer uninstalled and configuration removed.”
PREFIX ?= /usr
BINDIR = $(PREFIX)/bin

GRIMOIRE_REPO  = https://github.com/st0rmshadow/NeoSorcery_grimoire.git
GRIMOIRE_DEST  = /etc/neosorcery/grimoire

.PHONY: install install-binaries install-grimoire install-config uninstall

install: install-binaries install-grimoire install-config

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
@echo “Installing/updating NeoSorcery grimoire…”
@# If OFFLINE_MODE is 0 and git is available, use Git; otherwise fall back to bundled copy
@if [ “$$OFFLINE_MODE” = “0” ] && command -v git >/dev/null 2>&1; then 
if [ -d “$(GRIMOIRE_DEST)/.git” ]; then 
echo “ → Resetting existing Git repo”; 
git -C $(GRIMOIRE_DEST) fetch –all && 
git -C $(GRIMOIRE_DEST) reset –hard origin/master; 
else 
echo “ → Cloning repo from $(GRIMOIRE_REPO)”; 
rm -rf $(GRIMOIRE_DEST) && 
git clone $(GRIMOIRE_REPO) $(GRIMOIRE_DEST); 
fi; 
else 
echo “ → Offline or git not found: copying bundled grimoire”; 
mkdir -p $(GRIMOIRE_DEST) && 
cp -r grimoire/* $(GRIMOIRE_DEST)/; 
fi

install-config:
@echo “Installing default config /etc/neosorcery.conf…”
install -d /etc
install -m 644 neosorcery.conf /etc/neosorcery.conf

uninstall:
rm -f $(BINDIR)/neosorcery
rm -f $(BINDIR)/cast
rm -f $(BINDIR)/cast_internal
rm -f $(BINDIR)/dispel
rm -f $(BINDIR)/dispel_internal
rm -f $(BINDIR)/gaze
rm -f $(BINDIR)/scribe
rm -f /etc/neosorcery.conf
rm -rf /etc/neosorcery/grimoire
rm -f $$HOME/.sorcery/sorcery.local.conf
@echo “NeoSorcerer uninstalled and configuration removed.”
