# REV07: Tue 03 Aug 2021 09:00:00 WIB
# REV06: Fri 23 Jul 2021 10:00:00 WIB
# REV05: Mon 19 Jul 2021 13:00:00 WIB
# REV04: Sun 04 Jul 2021 13:00:00 WIB
# REV02: Tue 15 Jun 2021 11:00:00 WIB
# START: Mon 15 Feb 2021 09:00:00 WIB

ALL: 000.md .sitemap
	@echo "xyzzy... plugh"

000.md: 000.pmd _config.yml Gemfile _layouts/default.html Makefile index.md about.md tips.md links.md \
        _includes/navbar.html \
        _includes/footer.html _includes/head.html _includes/google-analytics.html \
	assets/css/style.css assets/scripts/includeScript.py 
	python assets/scripts/includeScript.py < 000.pmd > 000.md
	tar cfj ./template.tar.bz2 _config.yml .dojekyll .gitignore .template .shsh Gemfile LICENSE Makefile *.ico *.md *.pmd assets/ _includes/ _layouts/ SandBox/
	zip -r ./template.zip _config.yml .dojekyll .gitignore .template .shsh Gemfile LICENSE Makefile *.ico *.md *.pmd assets/ _includes/ _layouts/ SandBox/

.sitemap: _site/sitemap.xml
	@echo "Fixing sitemap.xml"
	@sed -i -e 's/http:\/\/localhost:5002/https:\/\/template.vlsm.org/g' _site/sitemap.xml
	@touch .sitemap

.phony: ALL

