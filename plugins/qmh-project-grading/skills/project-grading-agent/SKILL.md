---
name: project-grading-agent
description: Use when Codex needs to grade processed PPE Quantitative Methods for Humanities group project submissions. For 2026-27, the active project is a causal-inference paper exposition, not a data-analysis coding project. The agent must find the latest 11_GRADES_AND_SUBMISSIONS/Project/processed_20xx-xx folder, ask the user to confirm the year/folder, read the active project instructions and rubric, inspect each g### group folder, use QMH topic expert skills when substantive course-topic uncertainty arises, assign rubric scores, overwrite concise evidence-based feedback txt files in plain instructor English, and recreate grades_summary.csv.
---

# Project Grading Agent

Grade processed QMH group project submissions consistently and concisely.

## Required Sources

Read these before grading:

- `5_GROUP_PROJECT/Project_Instructions.tex`
- `10_RUBRICS/G351-QMH-Rubric-Project.docx` or `10_RUBRICS/G351-QMH-Rubric-Project.pdf`

Treat the project instructions and rubric as the grading contract.

For 2026-27, do not look for project datasets in `5_GROUP_PROJECT/`; the active project is a paper exposition. The old 2025-26 data-analysis project and datasets are archived under `_archive/2025-26_data_analysis_project/` and should be used only if the instructor explicitly asks to grade that historical project.

## Folder Selection

- Work under `11_GRADES_AND_SUBMISSIONS/Project/`.
- Default to the latest folder matching `processed_20xx-xx`.
- Before starting grading, tell the user which processed folder/year was detected and ask for confirmation.
- Grade group folders named `g001`, `g002`, etc.
- Each group folder should contain the representative submission files chosen by the preprocessing agent.
- For 2026-27, grade the submitted paper-exposition materials. Expect a short report and presentation slides unless the instructor says otherwise. These may be PDF reports, slide decks, DOCX files, PPTX files, or other instructor-approved files. Do not require `.Rmd`, `.R`, executable code, datasets, or code-quality evidence.

## Rubric

Assign a final score out of 10 using the active project rubric:

- Problem, research question, and motivation: 1.5 points
- Causal framework: 2.0 points
- Data and descriptive evidence: 1.5 points
- Causal method, assumptions, and threats: 2.0 points
- Results, uncertainty, and interpretation: 1.5 points
- Presentation, oral questions, and source use: 1.5 points

Use the rubric bands:

- 0-25%: many errors, misconceptions, minimal understanding, no justification.
- 25-50%: mostly incorrect or incomplete, major gaps, weak conclusions.
- 50-75%: partially correct and complete, fair understanding.
- 75-100%: mostly correct and complete, strong understanding and sound conclusions, minor to no errors.

Reward clear, accurate exposition of the assigned paper. Penalize unsupported causal claims, unclear treatment/control framing, confusion about the estimand, weak explanation of identification assumptions, missing threats to validity, results stated without magnitude or uncertainty, or presentation choices that make the paper difficult to understand.

Do not penalize students for not writing code or not submitting data-analysis files in the 2026-27 paper-exposition project. Penalize only missing or weak exposition elements required by the active project instructions and rubric.

## Topic Expert Use

Use relevant QMH topic expert skills when substantive uncertainty arises:

- `$causal-inference-expert` for treatment/control, outcomes, randomization checks, ATEs, natural experiments, causal assumptions, validity, and interpretation of causal designs.
- `$linear-regression-expert` for regression models, coefficient interpretation, fitted models, binary regressors, interactions, or regression used as a causal estimator.
- `$probability-expert` for uncertainty, standard errors, confidence intervals, p-values, comparison of means, or central-limit-theorem reasoning that affects grading.
- `$intro-r-expert` only if the instructor explicitly asks to grade optional R/code material.

Do not call experts for routine file handling or obvious rubric decisions.

## Grading Workflow

For each `g###` folder:

1. Identify the submission file(s) to grade.
2. Identify the assigned paper or paper chosen by the group.
3. Inspect whether the required exposition elements are addressed.
4. Note concrete evidence for each meaningful deduction before writing feedback.
5. Check the explanation of the research question, causal framework, data, method, assumptions, threats, results, uncertainty, and interpretation.
6. Assess presentation clarity and source use, including whether claims are tied to the paper's pages, tables, figures, or sections.
7. Assign category scores and total.
8. Write one concise feedback file, explaining why points were removed in each category with a concrete example when possible.

## Evidence Standard

- For PDF/DOCX reports and slides, cite the section, slide, table, figure, or short phrase, for example `slide 5 labels the control group unclearly`.
- For source files with line numbers, cite filename and line number when useful.
- Use at most one concrete example per category line. Pick the clearest example, not every problem.
- If a category loses points because something is missing, name the missing assignment part instead of inventing a citation.
- Keep examples short. Quote only a few words when useful.

## Feedback Output

Write one feedback file per group in the processed folder:

`g001_feedback.txt`

If a feedback file already exists from an earlier grading run, overwrite it. Do not append.

Use this exact structure:

```text
Group: g001
Submission graded: [filename or file bundle]
Final grade: [x]/10

Category scores:
- Problem, research question, and motivation: [x]/1.5. Why not full: [plain-English reason with one example/citation, or "None."]
- Causal framework: [x]/2.0. Why not full: [plain-English reason with one example/citation, or "None."]
- Data and descriptive evidence: [x]/1.5. Why not full: [plain-English reason with one example/citation, or "None."]
- Causal method, assumptions, and threats: [x]/2.0. Why not full: [plain-English reason with one example/citation, or "None."]
- Results, uncertainty, and interpretation: [x]/1.5. Why not full: [plain-English reason with one example/citation, or "None."]
- Presentation, oral questions, and source use: [x]/1.5. Why not full: [plain-English reason with one example/citation, or "None."]

Feedback:
[2-3 short sentences in natural instructor voice. Say what worked and what most needs fixing. Do not repeat every category line.]

Notes:
[Duplicate/representative issue from report.txt, missing expected file, unclear authorship, oral-question note if provided by the instructor, or "None."]
```

Feedback must be clear, specific, concise, and human-sounding. Avoid polished boilerplate, long essays, vague praise, and generic advice. Use plain English such as "The main thing missing is..." or "This part works well, but..." instead of formal audit language. The category lines must explain the score with evidence: mention concrete issues such as unclear treatment/control, weak link between the design and the causal claim, missing assumptions, missing threat to validity, unsupported conclusion, no discussion of uncertainty, or confusing slide/report organization. If full credit is awarded in a category, write `None.`

Length target: each category reason should be one short sentence, and the `Feedback` paragraph should normally be 45-75 words total.

Also write:

`grades_summary.csv`

with columns:

`group,submission_graded,problem_motivation,causal_framework,data_descriptive_evidence,method_assumptions_threats,results_uncertainty_interpretation,presentation_source_use,total,notes`

If `grades_summary.csv` already exists from an earlier grading run, recreate it from scratch. Do not append to the old file.

## Safety And Privacy

- Do not alter student submissions while grading.
- Do not write grades or feedback outside `11_GRADES_AND_SUBMISSIONS/Project/processed_20xx-xx` unless the user requests it.
- Do not commit grades, submissions, or feedback.
- Keep feedback professional and suitable to send to students.
