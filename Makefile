# REV19: Sat 23 Jul 2022 20:00
# REV09: Mon 04 Jul 2022 14:00
# REV07: Tue 03 Aug 2021 09:00
# REV05: Mon 19 Jul 2021 13:00
# REV02: Tue 15 Jun 2021 11:00
# START: Mon 15 Feb 2021 09:00

SITEURL="memos.vlsm.org"

ALL: .siteHack 000.md 007.md 008.md
	@echo "xyzzy... plugh"

000.md: 000.pmd _config.yml Gemfile _layouts/default.html Makefile index.md about.md \
        _includes/navbar.html \
        _includes/footer.html _includes/head.html _includes/google-analytics.html \
	assets/css/style.css assets/scripts/includeScript.py 
	python assets/scripts/includeScript.py < 000.pmd > 000.md

007.md: 007.pmd \
	assets/scripts/SBU-check.sh assets/scripts/version-check.sh
	python assets/scripts/includeScript.py < 007.pmd > 007.md

008.md: 008.pmd
	python assets/scripts/includeScript.py < 008.pmd > 008.md

.siteHack: _site/sitemap.xml
	@bash  .siteHack $(SITEURL)
	@touch .siteHack

.phony: ALL

