MAIN = vonLaszewski-mlcommons-benchmark-carpentry

# LaTeX compiler
LATEX = pdflatex
BIBTEX = biblatex

# Flags for compilation
LATEXFLAGS = -interaction=nonstopmode -halt-on-error



# Flags for compilation
LATEXFLAGS = -interaction=nonstopmode -halt-on-error

# Files to clean
CLEANFILES = *.aux *.log *.bbl *.bcf *.blg *.toc *.out *.lof *.lot *.fls *.fdb_latexmk

.PHONY: all clean view

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex
	$(BIBER) $(MAIN)
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex

view: $(MAIN).pdf
	open $(MAIN).pdf

clean:
	rm -f $(MAIN).pdf $(CLEANFILES)


zip:
	zip -r arxiv-carpentry.zip \
0000-authors.tex \
0010-abstract.tex \
0020-intro.tex \
0030-definitions.tex \
0040-formal.tex \
0050-benchmark-review.tex \
0051-table-1.tex \
0052-table-ai-2.tex \
0053-table-domains-3.tex \
0055-table-mlcommons-5.tex \
0060-review-gpu-benchmarks.tex \
0070-energy-benchmarks.tex \
0090-share.tex \
0100-profile.tex \
0110-sim.tex \
0400-carpentry.tex \
0410-democratizing.tex \
0530-conclusion.tex \
0910-acknowledgments.tex \
0930-glossary.tex \
0940-contribution.tex \
0990-appendix.tex \
graph-energy-layered.tex \
IEEEtran.bst \
IEEEtran.cls \
images \
ontology \
paper-format.tex \
ref-0-ontology.bib \
ref-carpentry.bib \
ref-database.bib \
ref-energy.bib \
ref-hpcbench.bib \
ref-profile.bib \
ref-sinclair.bib \
table-energy.tex \
vonLaszewski-frontiers-citations.bib \
vonLaszewski-mlcommons-benchmark-carpentry.tex
