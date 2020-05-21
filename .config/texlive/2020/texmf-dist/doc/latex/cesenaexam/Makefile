.PHONY : example cls all clean clsfast ctan

all: cls example clean

clsfast:
	cp cesenaexam.dtx ./build/cesenaexam.dtx
	cd ./build && \
	pdflatex cesenaexam.dtx && \
	rm cesenaexam.dtx

cls:
	cp cesenaexam.dtx ./build/cesenaexam.dtx
	cd ./build && \
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" cesenaexam.dtx && \
	makeindex -s gglo.ist -o cesenaexam.gls cesenaexam.glo && \
	makeindex -s gind.ist -o cesenaexam.ind cesenaexam.idx && \
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" cesenaexam.dtx && \
	rm cesenaexam.dtx && \
	cp README.md ../

example:
	cp cesenaexam_example.tex ./build/cesenaexam_example.tex
	cp -r images ./build/
	cd ./build && \
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" cesenaexam_example.tex && \
	rm cesenaexam_example.tex &&\
	rm -r images
	
clean:
	cd ./build && \
	rm -r *.aux *_latexmk *.fls *.glo *.gls *.hd *.idx *.ilg *.ind *.log *.out *.toc README.md

ctan:
	mkdir cesenaexam
	cp Makefile ./cesenaexam/
	cp README.md ./cesenaexam/
	cp cesenaexam.dtx ./cesenaexam/
	cp ./build/cesenaexam.pdf ./cesenaexam/
	cp ./build/cesenaexam.ins ./cesenaexam/
	cp ./build/cesenaexam.cls ./cesenaexam/
	cp ./build/cesenaexam.sty ./cesenaexam/
	cp cesenaexam_example.tex ./cesenaexam/
	cp ./build/cesenaexam_example.pdf ./cesenaexam/
	zip -r9 cesenaexam.zip ./cesenaexam
