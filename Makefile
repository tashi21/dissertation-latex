# ==================================================================================================
# Makefile: compile the dissertation locally.
#
# USAGE (run in this folder)
#   make        full build of everything	-> build/main.pdf
#   make clean	delete the build/ folder
# ==================================================================================================

# --------------------------------------------- setup ----------------------------------------------
# All generated files (.aux, .log, .bbl, the PDF, ...) go in this folder
OUT := build

# The latexmk command shared by every target
LATEXMK := latexmk -silent -pdfxe -outdir=$(OUT) -file-line-error -halt-on-error

# Targets that are commands, not files
.PHONY: all clean

# -------------------------------------------- targets ---------------------------------------------

# Full build of main.pdf. `||` runs the grep only if latexmk fails: it prints the error lines
# from the log
all: | $(OUT)/dirs
	$(LATEXMK) main.tex || { grep -A4 -E '^\./.+:[0-9]+:' $(OUT)/main.log; exit 1; }
	@echo "Built $(OUT)/main.pdf"

$(OUT)/dirs:
	mkdir -p $(OUT)/chapters $(OUT)/backmatter
	touch $@

clean:
	rm -rf $(OUT)
