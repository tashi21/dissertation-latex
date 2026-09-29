# Dissertation LaTeX source

## Overleaf setup

1. This repository is the Overleaf project (synced via git); `main.tex` is the root file.
2. Compile with **XeLaTeX** (Menu → Compiler). Aptos is loaded from the font files in `assets/font-aptos/`, so that folder must be in the project. Details in `preamble/fonts.tex`.
3. Recompile once more if the cover logos or glossary links look misplaced; both need two passes.

The chapters start empty, so References and Appendix A stay empty until something is cited or used. To check the setup on the first compile, paste this into Chapter 1 temporarily:

```latex
The \gls{mcp} lets \glspl{llm} call tools; a \gls{rug-pull} \cite{kumar2018rev2}
is hard to spot \cite[p.~335]{kumar2018rev2}. Again: \gls{mcp}, \gls{def-mcp}.
```

Expected: "Model Context Protocol (MCP)" on first use and "MCP" after; [1] and [1, p. 335] linking to References; Appendix A.1 lists LLM and MCP, with MCP ending "(see definition)" and linking to A.2, which lists the MCP definition and "rug pull".

## Where things are

| File | Contents |
| --- | --- |
| `config.tex` | title, name, degree, department, supervisor, date, margins, spacing, link colour |
| `main.tex` | page order |
| `preamble/` | packages, fonts, layout, floats, references, links, glossary setup |
| `frontmatter/` | cover, acknowledgements, abstract, ToC and lists |
| `chapters/` | one file per chapter |
| `glossary/entries.tex` | abbreviations and glossary terms |
| `references.bib` | bibliography database |
| `figures/` | images for figures |

## Citing (IEEE)

Entries go in `references.bib`. Keys are first-author surname + year + first title word, e.g. `kumar2018rev2`, `hou2026model`, `page1954continuous`; the file is sorted by key. Only cited entries are printed.

| Write | Get |
| --- | --- |
| `\cite{kumar2018rev2}` | [1] |
| `\cite[p.~3]{key}` or `\cite[3]{key}` | [2, p. 3] |
| `\cite[Sec.~4.2]{key}` | [2, Sec. 4.2] |
| `\cite{a,d,f}` | [1], [4], [6] |
| `\cite{a,b,c,d}` | [1]–[4] |
| `\cites[p.~3]{a}[Sec.~2]{b}` | [1, p. 3], [2, Sec. 2] |
| `\textcite{key}` | Kumar et al. [1] |

## Glossary and abbreviations

Define entries in `glossary/entries.tex` (instructions at the top of that file); only entries used in the text are printed in Appendix A.

| Write | Get |
| --- | --- |
| `\gls{mcp}` | first use: Model Context Protocol (MCP); afterwards: MCP, linked to Abbreviations |
| `\gls{def-mcp}` | Model Context Protocol, linked to its Glossary definition |
| `\gls{rug-pull}` | rug pull, linked to Glossary |
| `\glspl{llm}`, `\Gls{...}` | plural; capitalised |
| `\glsfmtshort{mcp}` | MCP in a chapter/section title or caption |

An abbreviation defined with `\newtermabbr` ends its Abbreviations entry with "(see definition)", linking to the Glossary.

## Figures, tables, algorithms

```latex
\begin{figure}[tb]
  \centering
  \includegraphics[width=0.8\linewidth]{my-figure}
  \caption{Caption below the figure.}\label{fig:my-figure}
\end{figure}

\begin{table}[tb]
  \centering
  \caption{Caption above the table.}\label{tab:my-table}
  \begin{tabular}{lr}
    \toprule
    Scenario & Value \\
    \midrule
    A & 1 \\
    \bottomrule
  \end{tabular}
\end{table}

\begin{algorithm}[tb]
  \caption{Name of the algorithm}\label{alg:my-alg}
  \begin{algorithmic}[1]
    \Require input
    \State step
  \end{algorithmic}
\end{algorithm}
```

Cross-reference with `\cref{fig:my-figure}` → "Figure 3.1" (`\Cref` at the start of a sentence).
