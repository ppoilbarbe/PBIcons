.PHONY: help setup build-icons build-icons-windows build-icons-macos

PROGRAM_ICONS := programs/pbpicat-full.png \
			     programs/pbprompt-full.png \
			     programs/pbrecipe-512x512.png \
				 programs/pbregisteractivity.svg \
				 programs/pbrenamer.svg

# Icon base name for a source file: drop the directory and extension, then a
# trailing -full or -WxH resolution suffix, matching scripts/make-icons.sh.
icon_stem = $(shell echo '$(basename $(notdir $(1)))' | sed -E 's/-(full|[0-9]+x[0-9]+)$$//')

WINDOWS_ICONS := $(foreach src,$(PROGRAM_ICONS),programs/$(call icon_stem,$(src)).ico)
MACOS_ICONS := $(foreach src,$(PROGRAM_ICONS),programs/$(call icon_stem,$(src)).icns)

help:
	@echo "Available targets:"
	@echo "  setup                 Install the pre-commit hooks for this repository"
	@echo "  build-icons           Rebuild .ico and .icns files for PROGRAM_ICONS whose source changed"
	@echo "  build-icons-windows   Rebuild .ico files for PROGRAM_ICONS whose source changed"
	@echo "  build-icons-macos     Rebuild .icns files for PROGRAM_ICONS whose source changed"

setup:
	@command -v pre-commit >/dev/null 2>&1 || pip install --user pre-commit
	pre-commit install

build-icons: build-icons-windows build-icons-macos

build-icons-windows: $(WINDOWS_ICONS)

build-icons-macos: $(MACOS_ICONS)

define ICON_RULES
programs/$(call icon_stem,$(1)).ico: $(1)
	scripts/make-icons.sh $$< --ico

programs/$(call icon_stem,$(1)).icns: $(1)
	scripts/make-icons.sh $$< --icns
endef

$(foreach src,$(PROGRAM_ICONS),$(eval $(call ICON_RULES,$(src))))
