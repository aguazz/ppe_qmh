---
name: project-grading-agent
description: Use when Codex needs to grade processed PPE Quantitative Methods for Humanities group project submissions. The agent must find the latest 11_GRADES_AND_SUBMISSIONS/Project/processed_20xx-xx folder, ask the user to confirm the year/folder, read the project instructions and rubric, inspect each g### group folder, use QMH topic expert skills when substantive course-topic uncertainty arises, assign rubric scores, overwrite concise evidence-based feedback txt files in plain instructor English, and recreate grades_summary.csv.
---

# Project Grading Agent

Grade processed QMH group project submissions consistently and concisely.

## Required Sources

Read these before grading:

- `5_GROUP_PROJECT/Project_Instructions.tex`
- `10_RUBRICS/G351-QMH-Rubric-Project.docx` or `10_RUBRICS/G351-QMH-Rubric-Project.pdf`
- relevant datasets in `5_GROUP_PROJECT/`, especially `gay.csv` and `leaders.csv` when needed to verify calculations or variable coding.

Treat the project instructions and rubric as the grading contract.

## Folder Selection

- Work under `11_GRADES_AND_SUBMISSIONS/Project/`.
- Default to the latest folder matching `processed_20xx-xx`.
- Before starting grading, tell the user which processed folder/year was detected and ask for confirmation.
- Grade group folders named `g001`, `g002`, etc.
- Each group folder should contain the representative submission files chosen by the preprocessing agent.
- Grade the `.Rmd` file in each group folder. If there is no `.Rmd`, grade only if a compiled report exists and note the missing `.Rmd` as a Code Quality issue.

## Rubric

Assign a final score out of 10 using:

- Causal Inference: 2.5 points
- Interpretation: 3.0 points
- Code Quality: 2.0 points
- Report Clarity & Organization: 2.5 points

Use the rubric bands:

- 0-25%: many errors, misconceptions, minimal understanding, no justification.
- 25-50%: mostly incorrect or incomplete, major gaps, weak conclusions.
- 50-75%: partially correct and complete, fair understanding.
- 75-100%: mostly correct and complete, strong understanding and sound conclusions, minor to no errors.

Reward correct causal reasoning even if minor arithmetic or formatting issues appear. Penalize unsupported causal claims, unclear treatment/control framing, incorrect variable construction, non-reproducible code, and conclusions not tied to estimates.

For Code Quality, treat an absolute local path to the dataset as a minor beginner reproducibility issue. If the absolute path is the only meaningful code problem and the rest of the code is readable and complete, remove at most 0.2 points from the Code Quality category for that issue. Larger Code Quality deductions require additional problems such as missing submitted code, code that cannot reproduce the report, incorrect variable construction, broken syntax, missing packages with no setup, or incomplete analysis.

For Report Clarity & Organization, do not penalize readable printed R output merely because it is not formatted as a polished table. Penalize output formatting only when it is confusing, excessive, unreadable, or not explained in the surrounding text.

Do not penalize absence of compiled HTML/PDF if the `.Rmd` is present.

## Topic Expert Use

Use relevant QMH topic expert skills when substantive uncertainty arises:

- `$causal-inference-expert` for treatment/control, outcomes, randomization checks, ATEs, natural experiments, causal assumptions, validity, and interpretation of causal designs.
- `$intro-r-expert` for R Markdown, beginner R code structure, loading data, object use, and reproducibility.
- `$linear-regression-expert` for regression models, coefficient interpretation, fitted models, binary regressors, interactions, or regression used as a causal estimator.
- `$probability-expert` only if the submission uses probability concepts that affect grading.

Do not call experts for routine file handling or obvious rubric decisions.

## Grading Workflow

For each `g###` folder:

1. Identify the submission file(s), especially the `.Rmd`.
2. Determine which project problem is attempted: gay marriage experiment, leader assassination natural experiment, or approved alternative.
3. Inspect whether the required assignment elements are addressed.
4. Note concrete evidence for each meaningful deduction before writing feedback.
5. Check code readability and reproducibility. Run code only when practical and safe; if not run, grade from inspection and state the precise reason code was not executed.
6. Verify key variable definitions and comparisons against the instructions/datasets when needed.
7. Assign category scores and total.
8. Write one concise feedback file, explaining why points were removed in each category with a concrete example when possible.

## Evidence Standard

- For `.Rmd` and `.R` files, cite evidence with filename and line number when possible, for example `project.Rmd:18 uses Downloads/gay.csv`.
- For compiled PDF/DOCX reports, cite the section/table/phrase instead, for example `PDF section 4.1 labels leader ages as democracy-before values`.
- Use at most one concrete example per category line. Pick the clearest example, not every problem.
- If a category loses points because something is missing, name the missing assignment part instead of inventing a citation.
- Keep examples short. Quote only a few words when useful.

## R Execution Checks

When deciding whether `.Rmd` or `.R` files can be executed:

- First check for `Rscript` on `PATH`.
- On Windows, if `Rscript` is not on `PATH`, also check common install locations such as `C:\Program Files\R\R-*\bin\Rscript.exe` and use the newest version found.
- Do not say "R/Rscript is not available in the local environment" unless both checks fail.
- If Rscript exists but code is not executed or knitting fails, state the specific reason, such as missing `rmarkdown`, missing packages, unsafe local paths, file chooser prompts, or the source being incomplete.
- If execution is skipped because inspection is sufficient, say "Code was graded by inspection; Rscript was not run" in Notes. Do not make this sound like a student penalty unless execution failure is itself evidence of non-reproducibility.

## Feedback Output

Write one feedback file per group in the processed folder:

`g001_feedback.txt`

If a feedback file already exists from an earlier grading run, overwrite it. Do not append.

Use this exact structure:

```text
Group: g001
Submission graded: [filename]
Final grade: [x]/10

Category scores:
- Causal Inference: [x]/2.5. Why not full: [plain-English reason with one example/citation, or "None."]
- Interpretation: [x]/3.0. Why not full: [plain-English reason with one example/citation, or "None."]
- Code Quality: [x]/2.0. Why not full: [plain-English reason with one example/citation, or "None."]
- Report Clarity & Organization: [x]/2.5. Why not full: [plain-English reason with one example/citation, or "None."]

Feedback:
[2-3 short sentences in natural instructor voice. Say what worked and what most needs fixing. Do not repeat every category line.]

Notes:
[Missing .Rmd, code execution status with precise reason if relevant, duplicate/representative issue from report.txt, unclear authorship, or "None."]
```

Feedback must be clear, specific, concise, and human-sounding. Avoid polished boilerplate, long essays, vague praise, and generic advice. Use plain English such as "The main thing missing is..." or "This part works well, but..." instead of formal audit language. The category lines must explain the score with evidence: mention concrete issues such as missing randomization check, unclear treatment/control, unsupported conclusion, wrong success variable, missing magnitude interpretation, incomplete `.Rmd`, or code that cannot reproduce the report. If full credit is awarded in a category, write `None.`

Length target: each category reason should be one short sentence, and the `Feedback` paragraph should normally be 45-75 words total.

Also write:

`grades_summary.csv`

with columns:

`group,submission_graded,causal_inference,interpretation,code_quality,report_clarity,total,notes`

If `grades_summary.csv` already exists from an earlier grading run, recreate it from scratch. Do not append to the old file.

## Safety And Privacy

- Do not alter student submissions while grading.
- Do not write grades or feedback outside `11_GRADES_AND_SUBMISSIONS/Project/processed_20xx-xx` unless the user requests it.
- Do not commit grades, submissions, or feedback.
- Keep feedback professional and suitable to send to students.
