SNAME=zca
NAME=zca-hb-ru-proto
# BIBROOT=$(PWD)/../..
#	BIBINPUTS=$(BIBROOT) latexmk -pdfps -dvi- -ps- $(NAME)

.PHONY: FORCE_MAKE clean view all emacs edit pics

all: $(NAME).pdf
#all: $(SNAME).pdf # If the cover is already issued

%.pdf: %.tex FORCE_MAKE
	BIBINPUTS=$(BIBROOT) latexmk $(NAME).tex

clean:
	BIBINPUTS=$(BIBROOT) latexmk -C
	rm -f $(NAME).{bbl,aux,ps,thm,synctex.gz}
	rm -f $(SNAME).{bbl,aux,ps,thm}

view: all
	evince $(NAME).pdf &

edit: emacs

emacs:
	emacsclient -c $(NAME).tex --alternate-editor emacs  &

$(SNAME).pdf: $(NAME).pdf cover.jpg
	pdfjoin -o $(NAME).pdf -- $(SNAME).pdf cover.jpg

pics:
