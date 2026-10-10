BASENAME=LawrenceDuResume
CHROME ?= $(shell command -v google-chrome || command -v chromium || command -v chromium-browser || printf '%s' '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome')

.PHONY: all clean

all: $(BASENAME).pdf $(BASENAME).docx $(BASENAME).txt $(BASENAME).html 

$(BASENAME).html: $(BASENAME).md style.css Makefile
	pandoc --standalone --metadata pagetitle="Lawrence Du Resume" -c style.css --from markdown --to html5 -o $(BASENAME).html $(BASENAME).md

$(BASENAME).pdf: $(BASENAME).html Makefile
	@if [ -x "$(CHROME)" ]; then \
		profile=$$(mktemp -d); \
		trap 'rm -rf "$$profile"' EXIT HUP INT TERM; \
		"$(CHROME)" --headless --disable-gpu --no-pdf-header-footer \
			--user-data-dir="$$profile" --print-to-pdf="$(CURDIR)/$@" \
			"file://$(CURDIR)/$<"; \
	elif command -v wkhtmltopdf >/dev/null 2>&1; then \
		wkhtmltopdf --enable-local-file-access --print-media-type --page-size Letter \
			--margin-top 10.16mm --margin-bottom 10.16mm \
			--margin-left 11.43mm --margin-right 11.43mm $< $@; \
	else \
		echo 'Install Google Chrome, Chromium, or wkhtmltopdf to build the PDF.' >&2; \
		exit 1; \
	fi

$(BASENAME).docx: $(BASENAME).md
	pandoc --from markdown --to docx -o $(BASENAME).docx $(BASENAME).md

$(BASENAME).txt: $(BASENAME).md
	pandoc --standalone --from markdown-smart --to plain -o $(BASENAME).txt $(BASENAME).md

clean:
	rm -f $(BASENAME).html $(BASENAME).pdf $(BASENAME).docx $(BASENAME).txt
