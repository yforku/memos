# REV09: Mon 04 Jul 2022 12:00
# REV08: Mon 30 May 2022 10:10
# REV07: Tue 03 Aug 2021 09:00
# REV05: Mon 19 Jul 2021 13:00
# REV02: Tue 15 Jun 2021 11:00
# START: Mon 15 Feb 2021 09:00

SITEURL="memos.vlsm.org"

ALL: .siteHack 000.md 007.md 
	@echo "xyzzy... plugh"

000.md: 000.pmd _config.yml Gemfile _layouts/default.html Makefile index.md about.md \
        _includes/navbar.html \
        _includes/footer.html _includes/head.html _includes/google-analytics.html \
	assets/css/style.css assets/scripts/includeScript.py 
	python assets/scripts/includeScript.py < 000.pmd > 000.md

007.md: 007.pmd
	python assets/scripts/includeScript.py < 007.pmd > 007.md

.siteHack: _site/sitemap.xml
	@bash  .siteHack $(SITEURL)
	@touch .siteHack

.phony: ALL

