all: index.pdf index.docx index.txt index.html 

index.html: index.md style.css
	pandoc --standalone -c style.css --from markdown --to html5 -o index.html index.md

index.pdf: index.html
	wkhtmltopdf index.html index.pdf

index.docx: index.md
	pandoc --from markdown --to docx -o index.docx index.md

index.txt: index.md
	pandoc --standalone --from markdown-smart --to plain -o index.txt index.md

clean:
	rm -f *.html *.pdf *.docx *.txt
