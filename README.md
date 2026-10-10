# LarryDuMarkdownResume
*My resume made in markdown and easily converted to pdf, docx, and text*

## [View resume as github markdown w/ clickable links](https://github.com/LarsDu/LarryDuMarkdownResume/blob/main/LawrenceDuResume.md)
## [View resume as pdf](https://github.com/LarsDu/LarryDuMarkdownResume/blob/main/LawrenceDuResume.pdf)

Inspired from https://github.com/chmduquesne/resume

Here I [wrote my resume in markdown](https://github.com/LarsDu/LarryDuMarkdownResume/blob/main/LawrenceDuResume.md) and then used pandoc to cross compile the resume into .docx, .pdf, and .txt formats. This allows me to use version control on my resume easily, is simpler to maintain than a LaTeX based resume, and style/formatting can be handled by using css (the style.css file in the repo).

#### Requires:

 * pandoc
 * Google Chrome or Chromium (wkhtmltopdf is also supported as a fallback)
 
## Instructions:
Run `make all` to rebuild the HTML, PDF, DOCX, and plain-text resume. The PDF uses
US Letter paper and the print layout in `style.css`. To rebuild every output from
scratch, run `make clean` followed by `make all`.

The Makefile detects Chrome/Chromium on Linux and Google Chrome in the standard
macOS location. For another installation, set `CHROME` to the executable path:

```sh
make all CHROME="/path/to/chrome"
```

To check that the PDF fits one page, run `pdfinfo LawrenceDuResume.pdf` (requires
Poppler) and confirm `Pages: 1`.
