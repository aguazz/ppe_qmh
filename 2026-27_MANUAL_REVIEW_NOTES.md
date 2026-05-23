# 2026-27 Manual Review Notes

This file tracks course-update changes that should be reviewed by hand before the 2026-27 version is treated as final.

## Topic 2 Probability Slides: New Inference Block

Status: pending instructor review.

Compilation status: compiled successfully after the first draft. The resulting inference section appears on slides 65-74 of the generated PDF.

Files:

- `1_SLIDES/Topic 2 - Probability/2.Probability.tex`
- `1_SLIDES/Topic 2 - Probability/2.Probability.pdf`

Change added:

- Added a new section after the CLT material: `Introduction to Statistical Inference`.
- Added concise slides on:
  - the move from probability to inference;
  - a survey-support example;
  - sampling distributions and standard errors;
  - null and alternative hypotheses;
  - one-mean tests;
  - difference-in-means tests for treatment/control comparisons;
  - p-values and common misinterpretations;
  - confidence intervals;
  - what students should report.

Please review by hand:

- Whether the inference block is the right length for the probability chapter.
- Whether the survey and treatment/control examples fit your intended emphasis.
- Whether the formulas are light enough but still rigorous enough for PPE second-year students.
- Whether introducing both one-mean tests and difference-in-means tests here is useful, or whether one should be moved to a problem set or later deck.
- Whether the p-value wording is clear enough and avoids the common mistake "the probability that the null is true."
- Whether the confidence-interval slide should keep the approximate `1.96 x SE` rule or use a more verbal explanation.
- Whether the final "what students should report" slide should become a recurring standard for problem sets and exams.

Observed compile notes:

- LaTeX reports the same title-page package/path warning pattern seen in other decks.
- LaTeX reports an overfull title-page hbox and a small LLN-slide vbox warning; these do not appear to come from the new inference slides.

Related cleanup:

- The birthday-problem slide no longer offers points for posting R code. It now treats `lfactorial` as an optional software note.

## Topic 2 Probability Problem Set: Inference Exercises

Status: pending instructor review.

Files:

- `2_PROBLEM_SETS/Topic 2 - Probability/Problem_set_2_probability.tex`
- `2_PROBLEM_SETS/Topic 2 - Probability/Problem_set_2_probability.pdf`
- `2_PROBLEM_SETS/Topic 2 - Probability/Problem Set 2 - Probability - Solution.pdf`

Change added:

- Added a one-sided hypothesis-testing exercise about majority support for a housing policy.
- Added a two-sided difference-in-means exercise about a fact-checking prompt and headline-accuracy scores.
- Kept the exercises non-coding and aligned with the new Topic 2 inference slides.

Solution corrections made:

- Corrected the Zener Test binomial probabilities for exactly 10 correct guesses, 15 or more correct guesses, and the probability of at least one extreme result among 1,000 test-takers.
- Corrected the anthropology CLT tail probability for \(n=30\), and corrected the standard error for \(n=100\).
- Corrected the casino CLT test statistic display from an inconsistent near-zero z-score to \(Z > 2.0004\).

Please review by hand:

- Whether the two added problems are the right difficulty and length for this problem set.
- Whether the housing-policy example should remain one-sided or become two-sided for simplicity.
- Whether the fact-checking prompt example should explicitly mention random assignment as causal language, or stay framed only as a comparison of means.
- Whether the p-values should be supplied, as drafted, or whether students should be asked to approximate them from a normal table.
- Whether the corrected Zener Test values change the pedagogical point too much; the multiple-testing effect is still present, but much less dramatic for 1,000 participants than the previous erroneous numbers suggested.

## Topic 2 Question Bank: Hypothesis Testing

Status: pending instructor review.

Compilation status: LaTeX draft compile passed. No PDF was added, to keep `8_QUESTION_BANKS/` source-only like the older probability quiz files unless you decide otherwise.

Files:

- `8_QUESTION_BANKS/Hypothesis_Testing_2026-27.tex`
- `plugins/qmh-topic-experts/skills/probability-expert/SKILL.md`

Change added:

- Added a small 2026-27 question bank with answers for introductory hypothesis testing.
- Included short items on null/alternative hypotheses, one-sided and two-sided tests, p-values, confidence intervals, standard errors, sample size, difference in means, and statistical versus substantive significance.
- Kept examples tied to PPE-friendly contexts: student study time, rent-control support, trust in parliament, civic-information prompts, tutoring, polls, and ballot design.
- Updated the probability expert skill so future probability work treats introductory hypothesis testing as part of Topic 2, while keeping regression inference outside the probability scope.

Please review by hand:

- Whether eight questions is the right size for a "small" reusable bank.
- Whether the examples are sufficiently close to the new Topic 2 inference slides and problem-set exercises without duplicating them too heavily.
- Whether any question should be converted into multiple-choice quiz format for Canvas.
- Whether the bank should also be compiled and stored as a PDF, or whether the active question-bank folder should remain source-only like the older probability quiz files.
- Whether to add more comparison-of-means questions, since that is the course's most important bridge into causal inference.

## 2026-27 Midterm 1 Draft

Status: pending instructor review.

Compilation status: compiled successfully as the student-facing PDF with solutions hidden. The source contains hidden answer keys via the `exam` class.

Files:

- `9_EXAMS/2026-27/Midterm1.tex`
- `9_EXAMS/2026-27/Midterm1.pdf`
- `9_EXAMS/2026-27/README.md`

Change added:

- Created a 10-point, 50-minute Midterm 1 draft for 2026-27.
- Covered early-course material through four 2.5-point questions:
  - probability, conditional probability, independence, total probability, and Bayes' rule;
  - LLN/CLT intuition and a one-sided support test for a sample proportion;
  - difference-in-means inference with a p-value and confidence interval;
  - early causal-inference concepts using potential outcomes, the fundamental problem, selection bias, and design improvement.
- Kept the exam non-coding and aligned with the new Topic 2 inference material and early Topic 3 causal-inference language.

Please review by hand:

- Replace `Date TBA` with the official exam date once Canvas/scheduling is final.
- Confirm that the 50-minute time limit is still appropriate now that Midterm 1 includes introductory hypothesis testing.
- Check whether four 2.5-point questions are the right balance, or whether the causal-inference question should be shorter.
- Decide whether you want a separate solution PDF generated by temporarily enabling `\printanswers`.
- Decide whether the civic-information scenario should be replaced with a topic closer to examples used in class.

## 2026-27 Midterm 2 Draft

Status: pending instructor review.

Compilation status: compiled successfully as the student-facing PDF with solutions hidden. The source contains hidden answer keys via the `exam` class.

Files:

- `9_EXAMS/2026-27/Midterm2.tex`
- `9_EXAMS/2026-27/Midterm2.pdf`
- `9_EXAMS/2026-27/README.md`

Change added:

- Created a 10-point, 50-minute Midterm 2 draft for 2026-27.
- Covered later-course material through four 2.5-point questions:
  - randomized study interpretation, potential outcomes, difference in means, and SUTVA;
  - before-and-after and difference-in-differences estimators;
  - subclassification for a voluntary workshop and remaining conditional-independence assumptions;
  - linear-regression interpretation, fitted values, residuals, `R^2`, extrapolation, and causal caution.
- Kept the exam non-coding and aligned with the 2026-27 no-R emphasis for required assessment.

Please review by hand:

- Replace `Date TBA` with the official exam date once Canvas/scheduling is final.
- Confirm whether the 50-minute time limit is appropriate for four design/regression questions.
- Decide whether to keep the subclassification question or replace it with a STAR-style table from Topic 4.
- Decide whether the regression question should include p-values/confidence intervals or remain interpretation-only.
- Decide whether you want a separate solution PDF generated by temporarily enabling `\printanswers`.

## Local Plugin And Agent Metadata Update

Status: pending instructor review.

Files:

- `AGENTS.md`
- `plugins/qmh-topic-experts/.codex-plugin/plugin.json`
- `plugins/qmh-topic-experts/skills/probability-expert/SKILL.md`
- `plugins/qmh-topic-experts/skills/probability-expert/agents/openai.yaml`
- `plugins/qmh-project-grading/.codex-plugin/plugin.json`
- `plugins/qmh-project-grading/skills/project-submission-preprocessor/SKILL.md`
- `plugins/qmh-project-grading/skills/project-submission-preprocessor/agents/openai.yaml`
- `plugins/qmh-project-grading/skills/project-grading-agent/SKILL.md`
- `plugins/qmh-project-grading/skills/project-grading-agent/agents/openai.yaml`

Change added:

- Confirmed the probability expert skill now includes introductory hypothesis testing, p-values, confidence intervals, and comparison-of-means language.
- Updated probability plugin metadata and UI prompt text so Topic 2 includes introductory inference.
- Confirmed the project preprocessor and grading skills expect 2026-27 paper-exposition reports/slides rather than `.Rmd` data-analysis projects.
- Updated project-grading plugin metadata and UI prompt text to refer to paper-exposition submissions, reports, and slides.
- Removed R Markdown as a project-grading plugin keyword and added paper-exposition/report/slide keywords.
- Updated `AGENTS.md` so local-agent descriptions no longer present the project-grading update as a pending check.

Please review by hand:

- Whether the project grading categories in `project-grading-agent/SKILL.md` exactly match the final DOCX rubric.
- Whether the grading agent should expect both report and slides, or allow one combined PDF without treating it as missing material.
- Whether the preprocessor should treat `.pptx` and `.pdf` bundles from the same student as one representative submission by default.
- Whether the probability expert should include hypothesis testing only for Topic 2, or also explicitly support Midterm 1 item writing.

## Final QA Audit

Status: audit completed; unresolved items pending instructor or later maintenance decision.

Audit date: 2026-05-23.

Scope:

- Stale-reference scan of active files, excluding `_archive/`, private submissions, PDFs, DOCX files, HTML files, and old exam-year folders where appropriate.
- Two-pass draft-mode LaTeX compile audit for active/2026-facing `.tex` materials:
  - Topic 0, Topic 0.5, Topic 2, Topic 3, Topic 4, and Topic 5 slide decks;
  - active Topic 0.5, 2, 3, 4, and 5 problem-set sources, plus optional Topic 5 prediction;
  - optional R practice source;
  - active group-project instructions;
  - 2026-27 hypothesis-testing question bank;
  - 2026-27 Midterm 1 and Midterm 2.

Compile result:

- No broken builds found in the audited TeX files.
- After a second draft compile pass, no unresolved-reference or unresolved-citation warnings remained in the audited TeX files.

Remaining stale-reference findings:

- These active slide decks still use `\date{2025/2026}` and should be updated in a narrow date-only pass:
  - `1_SLIDES/Topic 3 - Causality/3.Causality.tex`
  - `1_SLIDES/Topic 4 - Studies/4.Studies.tex`
  - `1_SLIDES/Topic 5 - Linear Regression/5.LinearRegression.tex`
- `LOCAL_AI_OVERLEAF_GITHUB_WORKFLOW.md` still contains old local path examples with `Teaching/2025-26` and one reference to `3_R_PRACTICE/`. This is workflow documentation, not student-facing course content, but it should be refreshed if the workflow guide remains active.
- `gay.csv` and `leaders.csv` references remain in active case-study/data folders:
  - `4_CASE_STUDIES/GayMarriage/gay_marriage.Rmd`
  - `4_CASE_STUDIES/LeaderAssasination/leader_assasination.Rmd`
  - `6_DATA_SETS/3_CAUSALITY/README.md`
  These are not in the active project folder and do not indicate that the 2026-27 project still expects those datasets. They should be left if the case studies remain available, or labeled optional if needed.
- Several stale-looking strings remain inside `2026-27_REPO_UPDATE_PLAN.md` because that file preserves the original audit findings and task descriptions. These are intentional historical references unless you want the plan cleaned after migration.

Remaining layout warnings:

- All beamer slide decks report the same title-page/package warning pattern and a shared title-page overfull hbox around line 28.
- Topic 2 slides report a small overfull vbox near the LLN/CLT area.
- Topic 5 slides report one overfull hbox and two underfull hboxes.
- Intro R solution, optional Topic 5 prediction, Midterm 1, and Midterm 2 report small overfull boxes. These are layout warnings, not build failures.

Not audited or not resolved:

- The active syllabus DOCX remains a Word artifact and was not compile-audited by LaTeX.
- No broad content fixes were made during this QA pass.

## Topic 3/4 Problem Sets: No-Code Causality And Studies Pass

Status: pending instructor review.

Files:

- `2_PROBLEM_SETS/Topic 3 - Causality/Problem_set_3_causality.tex`
- `2_PROBLEM_SETS/Topic 4 - Studies/Problem_set_4_studies.tex`
- `2_PROBLEM_SETS/Topic 4 - Studies/Problem_set_4_studies.pdf`

Change added:

- Reviewed Topic 3 and found no active required R execution in the problem-set questions.
- Converted the active Topic 4 STAR section from data-frame/R tasks into a table-based interpretation exercise.
- Converted the active Topic 4 anchoring section from `load(anchoring.RData)` and R summaries into table-based balance, outcome, and external-validity questions.
- Converted the active Topic 4 injury section from `load(injury.RData)` and R/Rmd references into table-based BA and DiD calculations.
- Kept R only as optional enrichment for students who want to reproduce the printed tables.

Please review by hand:

- Whether the STAR section now contains too many summary tables for one problem set, or whether some should move to an appendix/case-study handout.
- Whether the STAR race-gap table should focus on white/black comparisons, as drafted, given the extremely small Hispanic sample in the available score data.
- Whether the anchoring country table has the right countries for illustrating external-validity variation.
- Whether the injury BA and DiD calculations should stay in the solution text, since this file currently includes active solutions directly in the problem-set PDF.
- Whether to remove the old commented-out STAR R solution block from the source file, or keep it as hidden reference material for optional replication.

## Topic 5 Linear Regression Problem Set: Primary No-Code Sheet With Optional R Section

Status: pending instructor review.

Files:

- `2_PROBLEM_SETS/Topic 5 - Linear Regression/Problem_set_5_linear_regression.tex`
- `2_PROBLEM_SETS/Topic 5 - Linear Regression/Problem_set_5_linear_regression.pdf`
- `_archive/2025-26_r_based_linear_regression/2_PROBLEM_SETS/Topic 5 - Linear Regression/Problem_set_5_linear_regression_R_2025-26.tex`
- `_archive/2025-26_r_based_linear_regression/2_PROBLEM_SETS/Topic 5 - Linear Regression/Problem_set_5_linear_regression_R_2025-26.pdf`

Change added:

- Renamed the no-R Topic 5 problem set to the primary active filename.
- Appended the R-based Progresa and Brazilian transfer exercises as a separate optional final section in the active problem set.
- Moved the old standalone R-based Topic 5 source/PDF into a 2025-26 R-based archive folder to avoid two competing active problem sets.
- Updated `MAP.md` and the linear-regression topic expert source list.

Please review by hand:

- Whether the optional R section should remain in the same PDF or be split back into a clearly optional appendix/handout.
- Whether the optional R exercises are too long relative to the required no-code Topic 5 exercises.
- Whether the old R solution code should be reintroduced inside the merged source under `\ifsolutions`, or whether the archived source is enough.
- Whether `Problem_set_prediction.tex` should also be merged, archived, or kept as a separate optional enrichment file.
