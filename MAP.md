# Repository Map

This repository is organized by course use. In general, a teaching item should keep its source files, generated PDF, local data, and supporting scripts together.

## Top Level

```text
.
|-- 0_SYLLABUS/
|-- 1_SLIDES/
|-- 2_PROBLEM_SETS/
|-- 3_R_PRACTICE/
|-- 4_CASE_STUDIES/
|-- 5_GROUP_PROJECT/
|-- 6_DATA_SETS/
|-- 7_BIBLIOGRAPHY/
|-- 8_QUESTION_BANKS/
|-- 9_EXAMS/
|-- 10_RUBRICS/
|-- 11_GRADES_AND_SUBMISSIONS/
|-- LaTex/
|-- _archive/
|-- .gitignore
|-- README.md
`-- MAP.md
```

## Active Course Folders

```text
0_SYLLABUS/
|-- Syllabus_G351_QuantitativeMethodsForHumanities_2025-26.docx
|-- Syllabus_G351_QuantitativeMethodsForHumanities_2025-26.pdf
`-- weekly_schedule_quant-meths-hum_2024_2025.xlsx
```

```text
1_SLIDES/
|-- Topic 0 - Intro Course/
|   |-- 0.Intro.tex
|   `-- 0.Intro.pdf
|-- Topic 1 - Intro R/
|   |-- 1.IntroR.tex
|   |-- 1.IntroR.pdf
|   `-- supporting R/Rmd/data files
|-- Topic 2 - Probability/
|   |-- 2.Probability.tex
|   |-- 2.Probability.pdf
|   `-- supporting reference PDFs
|-- Topic 3 - Causality/
|   |-- 3.Causality.tex
|   |-- 3.Causality.pdf
|   `-- supporting reference PDFs
|-- Topic 4 - Studies/
|   |-- 4.Studies.tex
|   `-- 4.Studies.pdf
`-- Topic 5 - Linear Regression/
    |-- 5.LinearRegression.tex
    `-- 5.LinearRegression.pdf
```

```text
2_PROBLEM_SETS/
|-- Topic 1 - Intro R/
|   |-- Problem_set_1_introR.tex
|   |-- Problem_set_1_introR.pdf
|   |-- Problem_set_1_introR_solution.tex
|   |-- Problem_set_1_introR_solution.pdf
|   `-- local data files
|-- Topic 2 - Probability/
|   |-- Problem_set_2_probability.tex
|   `-- Problem_set_2_probability.pdf
|-- Topic 3 - Causality/
|   |-- Problem_set_3_causality.tex
|   `-- Problem_set_3_causality.pdf
|-- Topic 4 - Studies/
|   |-- Problem_set_4_studies.tex
|   |-- Problem_set_4_studies.pdf
|   `-- local data files
|-- Topic 5 - Linear Regression/
|   |-- Problem_set_5_linear_regression_R.tex
|   |-- Problem_set_5_linear_regression_R.pdf
|   |-- problem_set_5_linear_regression_noR.tex
|   `-- Problem_set_prediction.tex
`-- solution.tex
```

`solution.tex` is a legacy combined solution source. It has not yet been split into topic folders.

```text
3_R_PRACTICE/
|-- R_practice_template.Rmd
|-- R_practice_solution.Rmd
|-- R_practice_solution.html
|-- R practice.pdf
|-- turnout.csv
|-- Rubric.docx
`-- RPractice_2023-24/
    |-- RPractice_2023-24.tex
    `-- turnout.csv
```

```text
4_CASE_STUDIES/
|-- Anchoring/
|-- AuthorshipDispute/
|-- ConditionalCashElection/
|-- FacialElections/
|-- FemalePoliticians/
|-- GayMarriage/
|-- GovernmentTransfer/
|-- Injury/
|-- LeaderAssasination/
|-- PressureTurnout/
|-- RacialHiring/
|-- STAR/
|-- WageEmploy/
`-- WealthOffice/
```

Each case-study folder is intended to be self-contained, typically with its `.Rmd`, rendered `.html`, local data, and local style/assets.

```text
5_GROUP_PROJECT/
|-- Project.tex
|-- Project_Instructions.tex
|-- Project_Instructions.pdf
|-- gay.csv
`-- leaders.csv
```

```text
6_DATA_SETS/
|-- 1_INTRO_R/
|-- 2_PROBABILITY/
|-- 3_CAUSALITY/
|-- 4_LINEAR_MODEL/
`-- 5_DISCOVERY/
```

Shared datasets and QSS chapter code live here. If an activity has a small local copy of a dataset for student use, that copy stays with the activity.

```text
7_BIBLIOGRAPHY/
|-- course readings
`-- More/
```

```text
8_QUESTION_BANKS/
|-- pool.tex
|-- ProbabilityQuiz_1.tex
|-- ProbabilityQuiz_2.tex
`-- _archives/
    `-- zipped question-bank exports
```

```text
9_EXAMS/
|-- 2024-25/
|   |-- exam .tex sources
|   `-- exam PDFs and solution PDFs
`-- 2025-26/
    |-- 1stMidterm.tex
    |-- 1stMidterm.pdf
    |-- 1stMidterm_solution.pdf
    `-- logo.png
```

```text
10_RUBRICS/
`-- rubric PDFs and editable DOCX files
```

```text
11_GRADES_AND_SUBMISSIONS/
`-- README.md
```

This folder is intentionally kept at the repository root for convenience. Git tracks only `11_GRADES_AND_SUBMISSIONS/README.md` so the folder appears on Overleaf and GitHub; private grading files, student submissions, feedback, and subfolders inside `11_GRADES_AND_SUBMISSIONS/` are ignored through `.gitignore`.

## Shared LaTeX Infrastructure

```text
LaTex/
|-- README.md
|-- preamble.tex
|-- simplemetropolis.sty
|-- img/
`-- simpson/
```

Use `LaTex/` only for reusable infrastructure: shared preamble, Beamer style, common images, and animation frames. Course documents themselves live in their course-material folders.

Some empty legacy subfolders may still appear inside `LaTex/` because OneDrive refused to delete them. They are not active locations.

## Archive Material

```text
_archive/
|-- 2024-25_legacy_QuantMethdsHum/
`-- Scripts_remainder/
```

Legacy course bundles and leftover script wrappers are kept here for reference.

## Compile Convention

Active `.tex` files live next to the PDF they should overwrite. Compile with `latexmk -cd` so the working directory becomes the document folder.

```powershell
latexmk -pdf -cd "1_SLIDES\Topic 0 - Intro Course\0.Intro.tex"
latexmk -pdf -cd "2_PROBLEM_SETS\Topic 1 - Intro R\Problem_set_1_introR.tex"
latexmk -pdf -cd "9_EXAMS\2025-26\1stMidterm.tex"
```

Slide decks use shared assets through paths such as:

```tex
\input{../../LaTex/preamble}
\usepackage{../../LaTex/simplemetropolis}
\includegraphics{../../LaTex/img/title_page.png}
```
