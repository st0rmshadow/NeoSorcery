PREFIX ?= /usr
BINDIR = $(PREFIX)/bin

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
        @echo "Installing/updating NeoSorcery grimoire…"
        @if command -v git >/dev/null 2>&1 && \
           git ls-remote $(GRIMOIRE_REPO) HEAD >/dev/null 2>&1; then \
          if [ -d $(GRIMOIRE_DEST)/.git ]; then \
            echo " → Existing Git repo detected, resetting to origin/master"; \
            git -C $(GRIMOIRE_DEST) fetch --all && \
            git -C $(GRIMOIRE_DEST) reset --hard origin/master; \
          else \
            echo " → Cloning fresh from $(GRIMOIRE_REPO)"; \
            rm -rf $(GRIMOIRE_DEST) && \
            git clone $(GRIMOIRE_REPO) $(GRIMOIRE_DEST); \
          fi \
        else \
          echo " → [offline] copying bundled grimoire/ → $(GRIMOIRE_DEST)"; \
          mkdir -p $(GRIMOIRE_DEST) && \
          cp -r grimoire/* $(GRIMOIRE_DEST)/; \
        fi

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
