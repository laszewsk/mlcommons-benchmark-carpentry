# Main document
MAIN = vonLaszewski-mlcommons-benchmark-carpentry

# Compilers
LATEX = pdflatex
BIBER = biber

# Compilation flags
LATEXFLAGS = -interaction=nonstopmode -halt-on-error

# Files to clean
CLEANFILES = *.aux *.log *.blg *.bcf *.toc *.out *.lof *.lot *.fls *.fdb_latexmk

.PHONY: all clean view zip

# Default target
all: $(MAIN).pdf

# PDF build target
$(MAIN).pdf: $(MAIN).tex
	@echo "Running LaTeX first pass..."
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex
	@echo "Running Biber for bibliography..."
	$(BIBER) $(MAIN)
	@echo "Running LaTeX second pass..."
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex
	@echo "Running LaTeX final pass..."
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex
	@echo "Build complete!"

# Open PDF
view: $(MAIN).pdf
	open $(MAIN).pdf

# Clean auxiliary files
clean:
	@echo "Cleaning auxiliary files..."
	rm -f $(MAIN).pdf $(CLEANFILES)
	@echo "Clean complete!"

# Create zip archive for submission
zip:
	@echo "Creating zip archive..."
	zip -r arxiv-carpentry.zip *.tex *.bib *.bbl images ontology *.cls *.bst
	@echo "Zip archive created: arxiv-carpentry.zip"
