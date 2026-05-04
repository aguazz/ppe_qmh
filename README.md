# Quantitative Methods for Humanities

Course repository for **Quantitative Methods for Humanities**, PPE 2nd year.

This is the working folder for the course: syllabus, slides, problem sets, R practice, case studies, datasets, bibliography, exams, rubrics, and instructor-only grading material. The repository is meant to be used locally in **Positron** or **VS Code**, with AI assistance, while remaining connected to **Overleaf** for LaTeX editing/compilation and to **Git/GitHub** for version control and backup.

For a detailed tree of the current folder layout, see [MAP.md](MAP.md).

## Working Model

This repository is designed around four connected tools:

- **Local editor:** use Positron or VS Code as the main workspace for editing `.tex`, `.R`, `.Rmd`, `.csv`, `.md`, and support files.
- **AI assistance:** use Codex, Copilot, or another AI assistant locally to reorganize files, draft material, review code, update documentation, and maintain consistency.
- **Overleaf:** use the Overleaf Git integration for LaTeX-oriented work and PDF compilation when convenient.
- **Git/GitHub:** use Git to track course-material changes and, if configured, push a clean version to GitHub. The `11_GRADES_AND_SUBMISSIONS/` folder shell is tracked, but private grading material inside it is excluded from pushes through a `.gitignore` file.

At the time this README was written, the Git remote named `origin` points to the Overleaf Git remote. If a GitHub remote is also configured, use a separate remote name such as `github` to avoid confusion.

## Repository Principles

- Organize by **teaching use**, not by file type.
- Keep each teaching item as self-contained as practical: source, PDF, local data, and local scripts together.
- Keep shared LaTeX infrastructure in `LaTex/`, not mixed into every activity.
- Keep generated PDFs next to their source `.tex` files when the goal is to overwrite PDFs efficiently after compiling.
- Keep sensitive grading material in `11_GRADES_AND_SUBMISSIONS/`, but never push the private contents to Git.
- Keep legacy material in `_archive/` so it remains available without cluttering the active course structure.

## Folder Structure

- `0_SYLLABUS/`: syllabus files and course planning spreadsheets.
- `1_SLIDES/`: lecture slide folders by topic. Each topic keeps its `.tex` source beside the generated `.pdf`.
- `2_PROBLEM_SETS/`: problem sets by topic, including sources, PDFs, local datasets, and selected solution files.
- `3_R_PRACTICE/`: R practice templates, instructor solutions, data, rendered outputs, and rubric material.
- `4_CASE_STUDIES/`: self-contained RMarkdown case studies, usually with `.Rmd`, `.html`, local data, and local assets.
- `5_GROUP_PROJECT/`: group project instructions, LaTeX sources, generated PDF, and project datasets.
- `6_DATA_SETS/`: shared datasets and QSS chapter code/data.
- `7_BIBLIOGRAPHY/`: bibliography and course readings.
- `8_QUESTION_BANKS/`: quiz/question-bank LaTeX sources and archived question-bank exports.
- `9_EXAMS/`: exam sources and PDFs, organized by academic year.
- `10_RUBRICS/`: grading rubrics in PDF and editable formats.
- `11_GRADES_AND_SUBMISSIONS/`: visible placeholder for private instructor material, grades, and student submissions. Only `11_GRADES_AND_SUBMISSIONS/README.md` is tracked; private contents are ignored by Git.
- `LaTex/`: shared LaTeX infrastructure only: preamble, style files, shared images, and animation frames.
- `_archive/`: legacy material retained for reference.

## Opening The Project Locally

Open the repository root folder in Positron or VS Code:

```text
c:\Users\aguaz\OneDrive - CUNEF\Teaching\2025-26\ppe_qmh
```

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
latexmk -pdf -cd "2_PROBLEM_SETS\Topic 1 - Intro R\Problem_set_1_introR.tex"
latexmk -pdf -cd "9_EXAMS\2025-26\1stMidterm.tex"
```

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

For R and RMarkdown activities, the working directory should usually be the folder containing the `.Rmd` file and its data. Many files use local paths such as:

```r
read.csv("turnout.csv")
load("anchoring.RData")
```

This means the activity folder is part of the reproducibility setup. Avoid moving data away from a case study or practice folder unless the code paths are updated too.

Shared datasets are kept in `6_DATA_SETS/`. Local copies are allowed when they make a student-facing activity easier to run.

## Overleaf Workflow

Overleaf is useful for LaTeX editing, online compilation, and sharing rendered course documents. This repository is connected to Overleaf through Git.

Typical workflow:

```powershell
git status --short
git pull origin main
# edit locally
git add .
git commit -m "Update course materials"
git push origin main
```

Use the actual branch name if it is not `main`.

Important Overleaf note: compiling in Overleaf shows the generated PDF in Overleaf, but it does not always behave like a local build artifact committed inside the repository. If the repository needs an updated PDF file, compile locally or explicitly export/update the PDF in the repo.

## GitHub Workflow

GitHub can be used as a clean backup or public/private course repository, while Overleaf remains the LaTeX editing/compilation environment.

If GitHub is configured as a second remote, a clear setup is:

```powershell
git remote -v
git remote add github <github-repository-url>
```

Then push intentionally:

```powershell
git push origin main    # Overleaf
git push github main    # GitHub
```

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
1.IntroR.tex               -> 1.IntroR.pdf
Problem_set_1_introR.tex   -> Problem_set_1_introR.pdf
1stMidterm.tex             -> 1stMidterm.pdf
```

When adding new materials, prefer:

- Keep source and generated PDF in the same teaching folder.
- Use matching basename for `.tex` and `.pdf`.
- Put reusable LaTeX assets in `LaTex/`.
- Put activity-specific data beside the activity.
- Put broadly shared datasets in `6_DATA_SETS/`.

## AI-Assisted Maintenance

This repo is intended to be maintained with AI assistance, but the course structure should remain human-readable. Good AI-assisted tasks include:

- reorganizing folders without breaking paths;
- updating `.tex` image/input paths after moves;
- checking for missing datasets or broken references;
- drafting problem sets, rubrics, and README updates;
- reviewing R/Rmd code for reproducibility;
- generating summaries of changes before committing.

Before accepting AI-made changes, check:

```powershell
git diff
git status --short
```

For larger reorganizations, update `MAP.md` and this README in the same change.

## Local Codex Workflow Agent

This repository includes a repo-local Codex plugin for checking and guiding the Overleaf/GitHub/local-editor workflow:

```text
.agents/plugins/marketplace.json
plugins/overleaf-github-workflow-agent/
```

The plugin contributes the `overleaf-github-workflow` skill and a read-only audit script. Use it when you want Codex to inspect the local setup, explain what is missing, and propose safe next commands for connecting:

```text
Positron or VS Code + AI assistant + Overleaf + Git + GitHub + LaTeX
```

Good Codex prompt:

```text
Use the overleaf-github-workflow skill to audit this repo. Do not edit files, commit, pull, or push without approval.
```

You can also run the audit script directly from the repo root:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\plugins\overleaf-github-workflow-agent\scripts\Test-OverleafGithubWorkflow.ps1
```

The script is read-only by default. It checks Git, remotes, branch name, `.gitignore`, LaTeX tooling, LaTeX Workshop workspace settings, and whether private contents inside folders such as `11_GRADES_AND_SUBMISSIONS/` are ignored while the public placeholder remains tracked.

Optional remote checks may contact Overleaf or GitHub and can prompt for credentials:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\plugins\overleaf-github-workflow-agent\scripts\Test-OverleafGithubWorkflow.ps1 -CheckRemoteAccess
```

Never paste Overleaf Git tokens or private credentials into an AI chat. Paste tokens only into Git credential prompts or an approved credential manager.

## Legacy Material

`_archive/` contains older course material and leftover script wrappers. These files are kept for reference, not as the active 2025-26 course structure.

Do not delete archived material casually. If something is promoted back into the active course, copy or move it into the relevant active folder and update documentation.

## Quick Checklist For Changes

Before finishing a work session:

1. Confirm the relevant `.tex` or `.Rmd` still runs or compiles when possible.
2. Confirm generated PDFs are in the same folder as their source when appropriate.
3. Run `git status --short`.
4. Make sure only `11_GRADES_AND_SUBMISSIONS/README.md` is tracked and private `11_GRADES_AND_SUBMISSIONS/` contents are ignored.
5. Update `MAP.md` if the folder structure changed.
6. Commit only intentional course-material changes.
