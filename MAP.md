# Repository Map

This repository is organized by course use. The active version is **2026-27**. Historical materials live under `_archive/`.

In general, a teaching item should keep its source files, generated PDF, local data, and supporting scripts together.

## Top Level

```text
.
|-- 0_SYLLABUS/
|-- 1_SLIDES/
|-- 2_PROBLEM_SETS/
|-- 3_OPTIONAL_R_PRACTICE/
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
|-- 2026-27_REPO_UPDATE_PLAN.md
|-- AGENTS.md
|-- LOCAL_AI_OVERLEAF_GITHUB_WORKFLOW.md
|-- MAP.md
`-- README.md
```

## Active Course Folders

```text
0_SYLLABUS/
`-- Syllabus_G351_QuantitativeMethodsForHumanities_2026-27.docx
```

The 2026-27 DOCX is the active syllabus source. Export a matching PDF manually when needed.

```text
1_SLIDES/
|-- Topic 0 - Intro Course/
|   |-- 0.Intro.tex
|   `-- 0.Intro.pdf
|-- Topic 0.5 (optional) - Intro R/
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

`Topic 0.5 (optional) - Intro R/` is optional/enrichment material for 2026-27. It supports students who want to use R/RStudio and instructor-led demonstrations, but it is not required assessment.

```text
2_PROBLEM_SETS/
|-- Topic 0.5 (optional) - Intro R/
|   |-- introR_practice.tex
|   |-- introR_practice.pdf
|   |-- introR_practice_solution.tex
|   |-- introR_practice_solution.pdf
|   |-- introR_practice_solution.R
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
|   |-- Problem_set_5_linear_regression.tex
|   |-- Problem_set_5_linear_regression.pdf
|   `-- Problem_set_prediction.tex
`-- solution.tex
```

`Topic 0.5 (optional) - Intro R/` and `Problem_set_prediction.tex` are optional/enrichment unless explicitly assigned. The active Topic 5 sheet is primarily no-code, with optional R-based regression exercises placed at the end.

`solution.tex` is a legacy combined solution source. It has not yet been split into topic folders.

```text
3_OPTIONAL_R_PRACTICE/
|-- optional_R_practice.tex
|-- optional_R_practice.pdf
|-- optional_R_practice_template.Rmd
|-- optional_R_practice_solution.Rmd
`-- turnout.csv
```

This folder is optional/enrichment material for 2026-27, not a required continuous-evaluation folder.

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

Each case-study folder is intended to be self-contained, typically with its `.Rmd`, rendered `.html`, local data, and local style/assets. Case studies may still use R for demonstration even though R practice is optional.

```text
5_GROUP_PROJECT/
|-- Project_Instructions.tex
`-- Project_Instructions.pdf
```

The active project is the 2026-27 causal-inference paper exposition. The old data-analysis project and its datasets are in `_archive/2025-26_data_analysis_project/`.

```text
6_DATA_SETS/
|-- 1_INTRO_R/
|-- 2_PROBABILITY/
|-- 3_CAUSALITY/
|-- 4_LINEAR_MODEL/
|-- 5_DISCOVERY/
|-- UNpop.csv
`-- UNpop.RData
```

Shared datasets and QSS chapter code live here. If an activity has a small local copy of a dataset for student use, that copy stays with the activity.

```text
7_BIBLIOGRAPHY/
|-- course readings
`-- More/
```

```text
8_QUESTION_BANKS/
|-- Hypothesis_Testing_2026-27.tex
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
|-- 2025-26/
|   |-- 1stMidterm.tex
|   |-- 1stMidterm.pdf
|   |-- FinalExam.tex
|   |-- FinalExam.pdf
|   `-- mock final exam sources/PDFs
`-- 2026-27/
    |-- Midterm1.tex
    |-- Midterm1.pdf
    |-- Midterm2.tex
    |-- Midterm2.pdf
    `-- README.md
```

`9_EXAMS/2026-27/` is the active skeleton for the new Midterm 1, Midterm 2, and final-exam materials. Keep the older year folders untouched unless explicitly archiving or cross-referencing them.

```text
10_RUBRICS/
|-- G351-QMH-Rubric-Final_exam.docx
|-- G351-QMH-Rubric-Final_exam.pdf
|-- G351-QMH-Rubric-Midterm.docx
|-- G351-QMH-Rubric-Midterm.pdf
`-- G351-QMH-Rubric-Project.docx
```

The active project rubric is now the paper-exposition DOCX. Its PDF still needs manual export from Word if a committed PDF is required. The old R-practice assessment rubrics are archived under `_archive/2025-26_r_practice_assessment/`.

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
|-- 2025-26_active_course_snapshot/
|-- 2025-26_data_analysis_project/
|-- 2025-26_r_practice_assessment/
`-- Scripts_remainder/
```

`2025-26_active_course_snapshot/` preserves the full active course state before the 2026-27 migration. `2025-26_data_analysis_project/` preserves the former project instructions, project datasets, and project rubric that were removed from active folders during the 2026-27 migration. `2025-26_r_practice_assessment/` preserves the old R-practice assessment rubrics and stale rendered outputs.

## Compile Convention

Active `.tex` files live next to the PDF they should overwrite. Compile with `latexmk -cd` so the working directory becomes the document folder.

```powershell
latexmk -pdf -cd "1_SLIDES\Topic 0 - Intro Course\0.Intro.tex"
latexmk -pdf -cd "5_GROUP_PROJECT\Project_Instructions.tex"
latexmk -pdf -cd "9_EXAMS\2026-27\Midterm1.tex"
```

The `Midterm1.tex` example describes the intended 2026-27 exam naming convention once the file exists.

Slide decks use shared assets through paths such as:

```tex
\input{../../LaTex/preamble}
\usepackage{../../LaTex/simplemetropolis}
\includegraphics{../../LaTex/img/title_page.png}
```
