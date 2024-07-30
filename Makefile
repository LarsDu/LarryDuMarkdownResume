BASENAME=LawrenceDuResumeXR
all: $(BASENAME).pdf $(BASENAME).docx $(BASENAME).txt $(BASENAME).html 

$(BASENAME).html: $(BASENAME).md style.css
	pandoc --standalone -c style.css --from markdown --to html5 -o $(BASENAME).html $(BASENAME).md

$(BASENAME).pdf: $(BASENAME).html
	wkhtmltopdf --enable-local-file-access $(BASENAME).html $(BASENAME).pdf

$(BASENAME).docx: $(BASENAME).md
	pandoc --from markdown --to docx -o $(BASENAME).docx $(BASENAME).md

$(BASENAME).txt: $(BASENAME).md
	pandoc --standalone --from markdown-smart --to plain -o $(BASENAME).txt $(BASENAME).md

clean:
	rm -f *.html *.pdf *.docx *.txt
