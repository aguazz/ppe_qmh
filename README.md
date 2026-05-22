# Quantitative Methods for Humanities (2026-27)

Course repository for **Quantitative Methods for Humanities**, PPE 2nd year.

The active course version is **2026-27**. The 2025-26 course has been preserved under `_archive/2025-26_active_course_snapshot/`, and the former 2025-26 data-analysis project has been preserved under `_archive/2025-26_data_analysis_project/`.

This is the working folder for the course: syllabus, slides, problem sets, optional R enrichment, case studies, datasets, bibliography, exams, rubrics, and instructor-only grading material. The repository is meant to be used locally in **Positron** or **VS Code**, with AI assistance, while remaining connected to **Overleaf** for LaTeX editing/compilation and to **Git/GitHub** for version control and backup.

For a detailed tree of the current folder layout, see [MAP.md](MAP.md). For the repo-local Codex agents and skills, see [AGENTS.md](AGENTS.md).

## 2026-27 Course Direction

- R is retained as optional/enrichment material and as a tool for case-study demonstrations. It is not part of the required continuous-evaluation workload unless explicitly reintroduced.
- The required assessment structure is centered on written course-content exams, problem sets/practice, and a paper-exposition group project.
- The group project is now a causal-inference paper exposition, not a new data-analysis or coding project.
- The new inference material should remain technically minimal but clear: comparison of means, central limit theorem intuition, and basic hypothesis-testing logic for PPE students.
- Older 2025-26 materials should stay available in `_archive/` without looking like active 2026-27 requirements.

## Working Model

This repository is designed around four connected tools:

- **Local editor:** use Positron or VS Code as the main workspace for editing `.tex`, `.R`, `.Rmd`, `.csv`, `.md`, and support files.
- **AI assistance:** use Codex, Copilot, or another AI assistant locally to reorganize files, draft material, review code, update documentation, and maintain consistency.
- **Overleaf:** use the Overleaf Git integration for LaTeX-oriented work and PDF compilation when convenient.
- **Git/GitHub:** use Git to track course-material changes and push clean course versions to GitHub and Overleaf.

The current local branch is `master`. The configured remotes are:

- `overleaf`: Overleaf Git remote, pushed as `master`.
- `github`: GitHub repository, pushed from local `master` to GitHub `main`.

## Repository Principles

- Organize by **teaching use**, not by file type.
- Keep each teaching item as self-contained as practical: source, PDF, local data, and local scripts together.
- Keep shared LaTeX infrastructure in `LaTex/`, not mixed into every activity.
- Keep generated PDFs next to their source `.tex` files when the goal is to overwrite PDFs efficiently after compiling.
- Keep sensitive grading material in `11_GRADES_AND_SUBMISSIONS/`, but never push the private contents to Git.
- Keep legacy material in `_archive/` so it remains available without cluttering the active course structure.
- Keep optional R material visibly optional in folder names and documentation.

## Folder Structure

- `0_SYLLABUS/`: active 2026-27 syllabus source. The DOCX is the current source of truth; regenerate/export the PDF when needed.
- `1_SLIDES/`: lecture slide folders by topic. The Intro R deck is retained as optional/enrichment material pending the slide rewrite.
- `2_PROBLEM_SETS/`: problem sets by topic. Existing Intro R and R-based exercises should be treated as optional/enrichment until rewritten or relabeled.
- `3_OPTIONAL_R_PRACTICE/`: optional R practice templates, instructor solution, data, rendered output, and older R-practice material. This is not a required continuous-evaluation folder for 2026-27.
- `4_CASE_STUDIES/`: self-contained RMarkdown case studies, usually with `.Rmd`, `.html`, local data, and local assets.
- `5_GROUP_PROJECT/`: active 2026-27 paper-exposition project instructions, LaTeX source, and generated PDF.
- `6_DATA_SETS/`: shared datasets and QSS chapter code/data.
- `7_BIBLIOGRAPHY/`: bibliography and course readings.
- `8_QUESTION_BANKS/`: quiz/question-bank LaTeX sources and archived question-bank exports.
- `9_EXAMS/`: exam sources and PDFs, organized by academic year. `9_EXAMS/2026-27/` is the active skeleton for the new Midterm 1, Midterm 2, and final-exam materials.
- `10_RUBRICS/`: grading rubrics in PDF and editable formats. The active project rubric is now the paper-exposition rubric DOCX; export its PDF manually if needed.
- `11_GRADES_AND_SUBMISSIONS/`: visible placeholder for private instructor material, grades, and student submissions. Only `11_GRADES_AND_SUBMISSIONS/README.md` is tracked; private contents are ignored by Git.
- `LaTex/`: shared LaTeX infrastructure only: preamble, style files, shared images, and animation frames.
- `_archive/`: legacy material retained for reference, including the full 2025-26 snapshot and the old 2025-26 data-analysis project.

## Opening The Project Locally

Open the repository root folder in Positron or VS Code. The root is the folder containing `README.md`, `MAP.md`, `AGENTS.md`, and the numbered course folders.

Recommended local workflow:

1. Open the root folder, not an individual subfolder.
2. Use the file explorer to work inside the topic/activity folder.
3. Compile `.tex` files from their own folder using `latexmk -cd`.
4. Render `.Rmd` files from the folder where their data files live.
5. Use Git status before and after larger edits.

Useful commands:

```powershell
git status --short
git remote -v
```

## Compiling LaTeX Locally

Active `.tex` files live next to the PDFs they should overwrite. Compile with `latexmk -cd` so relative paths resolve from the document folder and the PDF is written next to the `.tex` file.

Examples:

```powershell
latexmk -pdf -cd "1_SLIDES\Topic 0 - Intro Course\0.Intro.tex"
latexmk -pdf -cd "5_GROUP_PROJECT\Project_Instructions.tex"
latexmk -pdf -cd "9_EXAMS\2026-27\Midterm1.tex"
```

The exam example is the intended 2026-27 convention once `Midterm1.tex` is created.

Slide decks load shared assets from `LaTex/` through paths such as:

```tex
\input{../../LaTex/preamble}
\usepackage{../../LaTex/simplemetropolis}
\includegraphics{../../LaTex/img/title_page.png}
```

The point of this layout is that recompiling a document naturally updates the PDF beside it. For example, compiling:

```text
1_SLIDES/Topic 2 - Probability/2.Probability.tex
```

produces or overwrites:

```text
1_SLIDES/Topic 2 - Probability/2.Probability.pdf
```

Note: `2_PROBLEM_SETS/solution.tex` is a legacy combined solution source that has not yet been split by topic.

## Working With R And RMarkdown

R remains useful in this course, especially for demonstrations, case studies, optional practice, and students who want to go deeper. For 2026-27, it should not be treated as a required coding workload unless a later syllabus decision explicitly changes that.

For R and RMarkdown activities, the working directory should usually be the folder containing the `.Rmd` file and its data. Many files use local paths such as:

```r
read.csv("turnout.csv")
load("anchoring.RData")
```

This means the activity folder is part of the reproducibility setup. Avoid moving data away from a case study or optional R folder unless the code paths are updated too.

Shared datasets are kept in `6_DATA_SETS/`. Local copies are allowed when they make a student-facing activity easier to run.

## Overleaf And GitHub Workflow

Overleaf is useful for LaTeX editing, online compilation, and sharing rendered course documents. GitHub is used as the clean repository backup.

Typical workflow:

```powershell
git status --short
# edit locally
git add <changed-files>
git commit -m "Update course materials"
git push overleaf master
git push github master:main
```

Important Overleaf note: compiling in Overleaf shows the generated PDF in Overleaf, but it does not always behave like a local build artifact committed inside the repository. If the repository needs an updated PDF file, compile locally or explicitly export/update the PDF in the repo.

Before pushing to GitHub, check:

```powershell
git status --short --ignored
```

Make sure private files inside `11_GRADES_AND_SUBMISSIONS/` appear as ignored and that no private student or grading files are staged. The only tracked file in that folder should be `11_GRADES_AND_SUBMISSIONS/README.md`.

## Privacy And Git Ignore

The root `.gitignore` keeps the `11_GRADES_AND_SUBMISSIONS/` folder visible in the repository while excluding its private contents:

```gitignore
/11_GRADES_AND_SUBMISSIONS/*
!/11_GRADES_AND_SUBMISSIONS/README.md
```

This works because Git cannot track an empty folder. The tracked `11_GRADES_AND_SUBMISSIONS/README.md` file keeps the folder present on Overleaf and GitHub, while all other files and subfolders inside `11_GRADES_AND_SUBMISSIONS/` remain local-only.

If additional private folders are added later, add them to `.gitignore` immediately.

## Naming Conventions

Names are mostly kept close to the original course materials. The main exception is where source/PDF names were aligned so recompiling overwrites the intended PDF.

Examples:

```text
0.Intro.tex                -> 0.Intro.pdf
Project_Instructions.tex   -> Project_Instructions.pdf
Midterm1.tex               -> Midterm1.pdf
```

When adding new materials, prefer:

- Keep source and generated PDF in the same teaching folder.
- Use matching basename for `.tex` and `.pdf`.
- Put reusable LaTeX assets in `LaTex/`.
- Put activity-specific data beside the activity.
- Put broadly shared datasets in `6_DATA_SETS/`.
- Put historical versions under `_archive/`, not in active teaching folders.

## AI-Assisted Maintenance

This repo is intended to be maintained with AI assistance, but the course structure should remain human-readable. Good AI-assisted tasks include:

- reorganizing folders without breaking paths;
- updating `.tex` image/input paths after moves;
- checking for missing datasets or broken references;
- drafting problem sets, rubrics, and README updates;
- reviewing optional R/Rmd code for reproducibility;
- generating summaries of changes before committing.

Before accepting AI-made changes, check:

```powershell
git diff
git status --short
```

For larger reorganizations, update `MAP.md` and this README in the same change.

## Local Codex Agents

This repository includes repo-local Codex plugins and agents documented in [AGENTS.md](AGENTS.md). They are registered through the local marketplace file and stored under `plugins/`:

```text
.agents/plugins/marketplace.json
plugins/
```

The current agent families are:

- **Overleaf GitHub Workflow Agent:** audits and guides the local Positron or VS Code, AI assistant, Overleaf, Git, GitHub, and LaTeX workflow.
- **QMH Topic Experts:** reusable course experts for optional Intro R enrichment, Probability, Causal Inference, and Linear Regression.
- **QMH Project Grading:** private-workflow agents for preprocessing Canvas group-project submissions and grading processed submissions. Before using them for 2026-27, check that the grading prompt and rubric match the paper-exposition project.

Use an agent by naming its trigger in a Codex prompt:

```text
Use $probability-expert to create or review a QMH probability question with an answer key.
Use $project-submission-preprocessor to organize the latest QMH project submissions folder.
Use $project-grading-agent to grade the latest processed QMH project submissions.
```

Never paste Overleaf Git tokens or private credentials into an AI chat. Paste tokens only into Git credential prompts or an approved credential manager.

## Legacy Material

`_archive/` contains older course material and leftover script wrappers. These files are kept for reference, not as the active 2026-27 course structure.

Do not delete archived material casually. If something is promoted back into the active course, copy or move it into the relevant active folder and update documentation.

## Quick Checklist For Changes

Before finishing a work session:

1. Confirm the relevant `.tex` or `.Rmd` still runs or compiles when possible.
2. Confirm generated PDFs are in the same folder as their source when appropriate.
3. Run `git status --short`.
4. Make sure only `11_GRADES_AND_SUBMISSIONS/README.md` is tracked and private `11_GRADES_AND_SUBMISSIONS/` contents are ignored.
5. Update `MAP.md` if the folder structure changed.
6. Commit only intentional course-material changes.
