# 2026-27 Repository Update Plan

This plan maps the structural migration from the 2025-26 version of **Quantitative Methods for Humanities** to the 2026-27 version. It is meant to be used as the control document for a sequence of small AI-assisted tasks, each with a narrow write scope.

## Target Course Shape

The 2026-27 course should make these structural changes consistently across the repo:

- Treat R as optional/enrichment rather than a graded core requirement.
- Remove the graded R practice from continuous evaluation.
- Replace the old assessment structure with quizzes, midterm 1, a causal-inference paper-analysis project, midterm 2, and the final exam.
- Add a technically light but conceptually precise introduction to hypothesis testing, centered on the comparison of means and the Central Limit Theorem.
- Change the group project from an R/data-analysis project to a paper-exposition project about published causal-inference research.
- Preserve the 2025-26 version in an explicitly named archive location before making destructive or large structural changes.

Use the language "students with uneven quantitative and coding preparation" in future materials. Avoid framing the change as lowering standards; frame it as focusing student effort on probability, causal inference, statistical reasoning, and linear-model interpretation.

## Progress Log

- 2026-05-22: Phase 0 completed. The 2025-26 active course was preserved in `_archive/2025-26_active_course_snapshot/` and tagged as `course-2025-26-final-active`.
- 2026-05-22: Phase 1 source-of-truth work completed for the syllabus and group project. The active project is now the 2026-27 paper-exposition project, with the old data-analysis project preserved in `_archive/2025-26_data_analysis_project/`.
- 2026-05-22: Phase 2 course-structure documentation completed. The optional R practice folder is now `3_OPTIONAL_R_PRACTICE/`; `README.md`, `MAP.md`, `AGENTS.md`, and affected local agent skills were updated; and `9_EXAMS/2026-27/README.md` was created as the exam skeleton.
- 2026-05-22: Phase 3 initial cleanup completed for the intro deck and optional R materials. `0.Intro.tex` now reflects the 2026-27 assessment/R policy, and Intro R/R-practice materials have been relabeled or renamed as optional enrichment with obsolete R-practice assessment rubrics archived.
- 2026-05-22: Phase 3 Topic 2 inference draft completed. `2.Probability.tex` now includes a concise introduction to hypothesis testing after CLT, and `2026-27_MANUAL_REVIEW_NOTES.md` tracks instructor review points.
- 2026-05-22: Phase 3 Topic 2 problem-set inference draft completed. `Problem_set_2_probability.tex` now includes hypothesis-testing exercises and corrected tail-probability/CLT solution values, with review points recorded in `2026-27_MANUAL_REVIEW_NOTES.md`.
- 2026-05-22: Phase 3 Topic 3/4 no-code pass completed. Topic 3 problem set had no active required R execution. Topic 4 studies problem set now uses printed summary tables for STAR, anchoring, and injury exercises, with R kept only as optional replication/enrichment.
- 2026-05-22: Phase 3 Topic 5 primary problem-set pass completed. The active linear-regression sheet is now `Problem_set_5_linear_regression.tex/pdf`, with no-code exercises first and optional R-based regression exercises appended in a separate final section. The old standalone R sheet was moved to `_archive/2025-26_r_based_linear_regression/`.
- 2026-05-23: Phase 3 hypothesis-testing question-bank draft completed. `8_QUESTION_BANKS/Hypothesis_Testing_2026-27.tex` now provides a small bank of Topic 2 inference questions with answers, and the probability expert skill now treats introductory hypothesis testing as part of the 2026-27 probability scope.
- 2026-05-23: Phase 3 Midterm 1 draft completed. `9_EXAMS/2026-27/Midterm1.tex/pdf` now covers probability, CLT intuition, introductory hypothesis testing, comparison of means, and early causal-inference concepts without requiring R.
- 2026-05-23: Phase 3 Midterm 2 draft completed. `9_EXAMS/2026-27/Midterm2.tex/pdf` now covers randomized studies, difference-in-differences, subclassification, and linear-regression interpretation without requiring R.
- 2026-05-23: Phase 3 plugin update completed. Local topic and project-grading plugin metadata now reflects introductory hypothesis testing, optional R, and the 2026-27 paper-exposition project workflow instead of the old R/Rmd data-analysis project.
- 2026-05-23: Phase 3 final QA audit completed. Active 2026-facing TeX materials passed a two-pass draft compile audit; unresolved references and remaining stale-reference findings are recorded in `2026-27_MANUAL_REVIEW_NOTES.md`.

## Initial Audit Findings

Important findings from the repo state before the migration work began:

- `0_SYLLABUS/Syllabus_G351_QuantitativeMethodsForHumanities_2025-26.docx` contains many of the new ideas, but still needs cleanup: "Module 0" is followed by "Module 2", the PDF beside it is stale and still says 2025-26, and the DOCX contains stray Spanish/template fragments after the final exam description.
- `1_SLIDES/Topic 0 - Intro Course/0.Intro.tex` still presents the old evaluation: 5% quizzes, 5% practice about statistical software, 15% midterm, 15% R-based group project, plus a date typo `20254/2026`.
- All active slide decks still use `\date{2025/2026}` or equivalent.
- `5_GROUP_PROJECT/Project_Instructions_2026-27_paper_exposition_draft.tex` is the new project direction. `5_GROUP_PROJECT/Project_Instructions.tex` is still the old R/data project and remains the source expected by the project-grading plugin.
- `10_RUBRICS/G351-QMH-Rubric-Project.docx` still grades code quality and a statistical-software project worth 15%. `G351-QMH-Rubric-R_practice.docx` is obsolete if R practice is removed from continuous evaluation.
- `plugins/qmh-project-grading/skills/project-grading-agent/SKILL.md` assumes `.Rmd` submissions, `gay.csv`, `leaders.csv`, and the old project rubric.
- `plugins/qmh-topic-experts/skills/probability-expert/SKILL.md` currently says not to introduce hypothesis testing unless explicitly asked; this should change because hypothesis testing is now part of Topic 2.
- `README.md` and `MAP.md` still describe R practice and the 2025-26 active folder layout.
- `2_PROBLEM_SETS/Topic 1 - Intro R/` and `3_R_PRACTICE/` are still active-looking graded materials.
- `2_PROBLEM_SETS/Topic 4 - Studies/Problem_set_4_studies.tex` and some case studies rely on loading datasets/RData and R calculations; these need either optional-labeling or non-coding student-facing alternatives.
- `2_PROBLEM_SETS/Topic 5 - Linear Regression/` already has both R and no-R variants. The no-R version should become the primary version.
- `2_PROBLEM_SETS/Topic 2 - Probability/Problem_set_2_probability.tex` already includes LLN/CLT material, but it does not yet include a clear, minimal hypothesis-testing unit. It also deserves a correctness pass around the CLT tail-probability solutions.
- `9_EXAMS/2025-26/` already has 2025-26 exams. A new `9_EXAMS/2026-27/` folder should be created rather than overwriting the old year.

## Preserve The 2025-26 Version

Do this before editing active folders.

Recommended preservation strategy:

1. Create a Git tag such as `course-2025-26-final-active` after confirming the current working tree is clean or intentionally committed.
2. Create an archive folder such as `_archive/2025-26_active_course_snapshot/`.
3. Copy only public/course-material folders into that archive:
   - `0_SYLLABUS/`
   - `1_SLIDES/`
   - `2_PROBLEM_SETS/`
   - `3_R_PRACTICE/`
   - `4_CASE_STUDIES/`
   - `5_GROUP_PROJECT/`
   - `6_DATA_SETS/`
   - `8_QUESTION_BANKS/`
   - `9_EXAMS/2025-26/`
   - `10_RUBRICS/`
   - `README.md`, `MAP.md`, `AGENTS.md`
4. Do not copy private material from `11_GRADES_AND_SUBMISSIONS/` except its README placeholder.
5. Update `README.md` and `MAP.md` to say that `_archive/2025-26_active_course_snapshot/` preserves the old active course version.

Alternative if repo size becomes annoying: rely on the Git tag plus only archive the 2025-26 public PDFs and final source files. The full folder snapshot is clearer for teaching reuse, but it duplicates more material.

## File And Folder Change Map

### Root Documentation

Files:

- `README.md`
- `MAP.md`
- `AGENTS.md`
- `LOCAL_AI_OVERLEAF_GITHUB_WORKFLOW.md`

Required changes:

- Rename the active course description from 2025-26 to 2026-27.
- Replace "R practice" as an active core folder with optional/enrichment R material.
- Keep examples that mention Intro R clearly tied to `Topic 0.5 (optional) - Intro R`.
- Update the folder map after the final structure is chosen.
- Update local-agent descriptions if project grading and probability scope change.

Short fix idea:

- Keep the root docs as workflow docs, not a second syllabus. Describe folder status: active, optional/enrichment, archived, private.

### Syllabus

Files:

- `0_SYLLABUS/Syllabus_G351_QuantitativeMethodsForHumanities_2025-26.docx`
- `0_SYLLABUS/Syllabus_G351_QuantitativeMethodsForHumanities_2025-26.pdf`
- `0_SYLLABUS/weekly_schedule_quant-meths-hum_2024_2025.xlsx`

Required changes:

- Create 2026-27 filenames for DOCX/PDF.
- Fix module numbering after optional R.
- Remove stale Spanish/template fragments.
- Align assessment weights with the intended 40% continuous evaluation and 60% final.
- Clarify whether midterm 2 is a written applied exam, a practical software exam, or a hybrid with precomputed outputs.
- Update software language so R/RStudio are optional/enrichment or used in instructor-led case studies, not mandatory for graded student work unless explicitly intended.
- Update weekly schedule spreadsheet or replace with a 2026-27 schedule document.

Short fix idea:

- Make the DOCX the source of truth, regenerate the PDF, and keep both filenames in 2026-27 form.

### Slides

Folders:

- `1_SLIDES/Topic 0 - Intro Course/`
- `1_SLIDES/Topic 0.5 (optional) - Intro R/`
- `1_SLIDES/Topic 2 - Probability/`
- `1_SLIDES/Topic 3 - Causality/`
- `1_SLIDES/Topic 4 - Studies/`
- `1_SLIDES/Topic 5 - Linear Regression/`

Required changes:

- Update all deck dates from 2025/2026 to 2026/2027.
- Update Topic 0 organizational/evaluation slides.
- Keep Topic 0.5 Intro R clearly marked as optional/enrichment.
- Update Topic 2 to include a short inference block after LLN/CLT:
  - sampling variability and the sampling distribution of a mean;
  - standard error as the standard deviation of an estimator;
  - null and alternative hypotheses;
  - test statistic for a mean or difference in means;
  - p-value as evidence under the null, not the probability the null is true;
  - confidence interval as a range of plausible values;
  - interpretation of statistically significant and not significant results.
- Remove or rephrase old incentives for posting R code in Topic 2 unless clearly optional.
- Review Topic 3 and Topic 4 for examples that assume students will conduct R analysis themselves; keep case-study logic but make R optional/demo.
- Review Topic 5 for whether inference for regression parameters remains too ambitious after adding basic hypothesis testing. Keep regression inference interpretive and minimal.

Short fix idea:

- Make Topic 2 the bridge from probability to inference. Then Topic 5 can use "we already learned what a p-value/standard error is" without giving a full econometrics-inference course.

### Problem Sets

Folders:

- `2_PROBLEM_SETS/Topic 0.5 (optional) - Intro R/`
- `2_PROBLEM_SETS/Topic 2 - Probability/`
- `2_PROBLEM_SETS/Topic 3 - Causality/`
- `2_PROBLEM_SETS/Topic 4 - Studies/`
- `2_PROBLEM_SETS/Topic 5 - Linear Regression/`
- `2_PROBLEM_SETS/solution.tex`

Required changes:

- Keep Topic 0.5 Intro R practice as optional/enrichment.
- Add a short hypothesis-testing problem set or subsection to Topic 2.
- Correct Topic 2 probability/CLT solution details during the update pass.
- Decide whether Topic 4 problems should remain R-based or become table-based/no-code tasks.
- Make `Problem_set_5_linear_regression.tex` the primary Topic 5 problem set, with optional R-based exercises appended at the end.
- Archive, relabel, or demote standalone R-heavy Topic 5 files; `Problem_set_prediction.tex` remains optional/enrichment unless explicitly assigned.
- Decide whether `solution.tex` should be retired, archived, or updated. It is currently a legacy combined solution source and is easy to forget.

Short fix idea:

- For required sheets, prefer short tables, regression output, and plain-language interpretation over R execution.
- For optional sheets, keep R/Rmd files self-contained and explicitly mark them optional.

### R Practice

Folder:

- `3_OPTIONAL_R_PRACTICE/`

Required changes:

- Keep this out of active graded assessment.
- Preserve the 2025-26 graded version in the archive.
- Keep the active folder named `3_OPTIONAL_R_PRACTICE/`.
- Keep student-facing source/template language optional and free of grading penalties unless explicitly assigned.
- Keep old R-practice rubrics archived outside active `10_RUBRICS/`.

Short fix idea:

- Keep one clean optional R practice and one instructor solution. Avoid maintaining multiple active variants.

### Case Studies

Folder:

- `4_CASE_STUDIES/`

Required changes:

- Keep case studies as instructor-led applied examples and optional deeper dives.
- Add a README or update existing docs to classify case studies by topic and whether they require R.
- Review case studies that already include formal tests:
  - `Anchoring/anchoring.Rmd`
  - `STAR/STAR.Rmd`
  - `Injury/injury.Rmd`
  - `PressureTurnout/pressure_turnout.Rmd`
- Rephrase "beyond the scope of this course" where hypothesis testing is now introduced.
- Do not turn all case studies into required R labs.

Short fix idea:

- The case studies are useful as demos. The key change is signaling: "shown in class / optional reproduction" rather than "students must code this."

### Group Project

Folder:

- `5_GROUP_PROJECT/`

Required changes:

- Make the paper-exposition instructions the active project instructions.
- Archive or rename the old data-analysis project instructions.
- Decide whether `Project_Instructions.tex` should become the new active source so existing workflows and links keep working.
- Remove or demote `gay.csv` and `leaders.csv` from the project folder if they are no longer part of the project; they can remain in `6_DATA_SETS/3_CAUSALITY/` or case-study folders.
- Add an active project rubric matching the paper-exposition task.
- Decide whether to uncomment/adapt the rubric, grade caps, oral questions, and AI-use sections currently commented out in the 2026-27 draft.
- Ensure project weight is consistently 10%, not 15%.

Short fix idea:

- Use `Project_Instructions.tex` and `Project_Instructions.pdf` as the active names, with the old version archived as `Project_Instructions_2025-26_data_analysis.*`.

### Datasets

Folder:

- `6_DATA_SETS/`

Required changes:

- Keep datasets for case studies and optional R work.
- Update README language so datasets are not presented as mandatory project inputs.
- Preserve QSS chapter code as reference/enrichment.

Short fix idea:

- Do not delete datasets. The migration is about required workload, not removing teaching resources.

### Bibliography

Folder:

- `7_BIBLIOGRAPHY/`

Required changes:

- Add or link the paper list used in the new project, if desired.
- Avoid committing copyrighted paper PDFs unless redistribution is permitted.
- Consider a `project_papers_2026-27.md` file with citation, DOI, method, country/context, and difficulty tag.

Short fix idea:

- Keep the paper list in TeX for students and optionally maintain a machine-readable `.md` or `.csv` for instructor planning.

### Question Banks

Folder:

- `8_QUESTION_BANKS/`

Required changes:

- Add hypothesis-testing items.
- Consider splitting banks by assessment:
  - probability quizzes;
  - midterm 1 bank;
  - midterm 2 bank;
  - final review bank.
- Review current probability quiz items for CLT/LLN fit after the new inference material.

Short fix idea:

- Build a small bank of conceptual questions first: interpretation of p-values, standard errors, and difference-in-means tests.

### Exams

Folder:

- `9_EXAMS/`

Required changes:

- Keep `9_EXAMS/2025-26/` untouched.
- Create `9_EXAMS/2026-27/`.
- Add `Midterm1.tex`, `Midterm2.tex`, mock exams, and final exam templates.
- Decide content coverage:
  - Midterm 1 likely covers probability, CLT, hypothesis testing, and early causal inference.
  - Midterm 2 likely covers causal designs, studies, and/or linear regression.
  - Final covers everything.
- Update exam dates and year macros.

Short fix idea:

- Reuse the 2025-26 exam template and structure, but write new scenarios aligned with the revised course.

### Rubrics

Folder:

- `10_RUBRICS/`

Required changes:

- Create or update rubrics for:
  - quizzes, if needed;
  - Midterm 1;
  - Midterm 2;
  - final exam;
  - paper-analysis project.
- Retire or archive the R practice rubric.
- Update project rubric categories away from code quality. Suggested 10-point split:
  - problem/research question and motivation: 1.5;
  - causal framework: 2.0;
  - data and descriptive evidence: 1.5;
  - method, assumptions, and threats: 2.0;
  - results, uncertainty, and interpretation: 1.5;
  - presentation, questions, and source/AI transparency: 1.5.
- Update dates, weights, and descriptions.

Short fix idea:

- First update the project rubric, because it has the strongest dependency on the new project instructions and grading agent.

### Grades And Submissions

Folder:

- `11_GRADES_AND_SUBMISSIONS/`

Required changes:

- Do not inspect, reorganize, or commit private material as part of the structural migration.
- Future processed folders should use `2026-27` naming when real submissions arrive.
- Update project preprocessing/grading expectations before using the grading agents on 2026-27 projects.

Short fix idea:

- Keep this out of the migration except for documentation and plugin expectations.

### Shared LaTeX

Folder:

- `LaTex/`

Required changes:

- Existing images already include `LLN.png`, `CLT.png`, and normal-distribution assets.
- Add a simple hypothesis-testing or sampling-distribution figure only if it genuinely improves the slides.
- Avoid moving shared assets until after TeX compile checks.

Short fix idea:

- First try to teach the inference unit using formulas, simple tables, and existing normal/CLT images.

### Local Plugins And Skills

Folders:

- `.agents/`
- `plugins/qmh-topic-experts/`
- `plugins/qmh-project-grading/`
- `plugins/overleaf-github-workflow-agent/`

Required changes:

- Update `probability-expert` scope to include introductory hypothesis testing, comparison of means, p-values, standard errors, and confidence intervals.
- Update `intro-r-expert` to describe Intro R as optional/enrichment, not Topic 1 required assessment.
- Update `causal-inference-expert` only if project paper-exposition support should be explicit.
- Update `linear-regression-expert` if regression inference is now expected to reference the new Topic 2 hypothesis-testing language.
- Update `project-submission-preprocessor` to handle PDF reports/slides rather than preferring `.Rmd`.
- Update `project-grading-agent` to read the new project instructions and rubric, grade paper exposition, and stop requiring code execution checks.
- Update `AGENTS.md` after skill behavior changes.

Short fix idea:

- Treat plugin updates as part of the course migration. Otherwise future AI grading will pull the repo back toward the old R/data project.

## Recommended Workflow

### Phase 0: Freeze And Archive 2025-26

Goal: preserve the current active version before structural edits.

Tasks:

1. Check `git status --short`.
2. Commit any intentional current changes.
3. Create a 2025-26 tag.
4. Create `_archive/2025-26_active_course_snapshot/`.
5. Copy public active materials into the archive.
6. Verify private grading files are not copied or staged.

Suggested AI task size: one session.

### Phase 1: Establish 2026-27 Source Of Truth

Goal: make the syllabus/project/assessment architecture unambiguous.

Tasks:

1. Clean the 2026-27 syllabus DOCX and regenerate PDF.
2. Decide final assessment labels and weights.
3. Rename syllabus files to 2026-27.
4. Make new project instructions active.
5. Update project rubric in principle, even before polishing DOCX/PDF.

Suggested AI task size: two sessions, one for syllabus and one for project/rubric.

### Phase 2: Course Structure And Docs

Goal: make the repo navigable as 2026-27 before content rewrites.

Tasks:

1. Update `README.md`.
2. Update `MAP.md`.
3. Decide optional R folder naming.
4. Update `AGENTS.md` descriptions if needed.
5. Create `9_EXAMS/2026-27/` skeleton.

Suggested AI task size: one session.

### Phase 3: Slide Decks

Goal: align teaching narrative with the new syllabus.

Tasks:

1. Update Topic 0 organization and assessment.
2. Demote Intro R to optional/enrichment.
3. Add inference block to Topic 2.
4. Lightly scan Topics 3-5 for R/project references and date updates.
5. Compile changed decks.

Suggested AI task size: three sessions:

- Topic 0 and optional R.
- Topic 2 probability/inference.
- Topics 3-5 consistency pass.

### Phase 4: Problem Sets And Question Banks

Goal: ensure practice matches required student workload.

Tasks:

1. Convert or label Intro R material as optional.
2. Add a hypothesis-testing practice sheet or section.
3. Update Topic 4 to avoid required R execution if that is the chosen direction.
4. Make no-R linear regression primary.
5. Add/refresh question-bank items.
6. Compile changed TeX.

Suggested AI task size: four sessions:

- Topic 2 inference problems.
- Topic 3-4 causal/studies problem-set update.
- Topic 5 no-R primary cleanup.
- Question-bank additions.

### Phase 5: Exams

Goal: create assessment materials aligned with the new structure.

Tasks:

1. Create Midterm 1 template and scope.
2. Create Midterm 2 template and scope.
3. Update final exam/mocks for 2026-27.
4. Create rubrics matching the new exams.
5. Compile all exam PDFs.

Suggested AI task size: one assessment per session.

### Phase 6: Plugins And Maintenance Tools

Goal: make local AI helpers obey the 2026-27 course design.

Tasks:

1. Update topic-expert skills.
2. Update project preprocessing/grading skills.
3. Update local marketplace docs only if display descriptions change.
4. Test the workflow with dry-run prompts.

Suggested AI task size: one or two sessions.

### Phase 7: Full Consistency QA

Goal: catch stale references and broken build paths.

Tasks:

1. Search active repo for stale strings: `2025-26`, `2025/26`, `2025/2026`, `R practice`, `statistical software`, `15%`, `Project_Instructions_2026-27_paper_exposition_draft`, `gay.csv`, `leaders.csv`.
2. Compile changed TeX sources.
3. Check generated PDFs are beside sources.
4. Review `git diff`.
5. Update this plan with completed tasks or convert it into a checklist.

Suggested AI task size: one final audit session.

## Small AI Task Prompts

Use prompts like these to keep each session bounded.

1. **Archive task**
   - "Create the 2025-26 public archive snapshot under `_archive/2025-26_active_course_snapshot/`. Do not copy private material from `11_GRADES_AND_SUBMISSIONS/`. Do not edit active course files."

2. **Syllabus cleanup**
   - "Clean the syllabus DOCX for 2026-27: fix module numbering, remove stale fragments, align assessment weights, and regenerate the PDF. Do not touch slides or problem sets."

3. **Project activation**
   - "Make the 2026-27 paper-exposition project the active project instructions. Archive the 2025-26 data-analysis project source/PDF. Update only `5_GROUP_PROJECT/` and the project rubric files."

4. **Intro deck update**
   - "Update `1_SLIDES/Topic 0 - Intro Course/0.Intro.tex` for the 2026-27 assessment structure and optional R policy. Compile the PDF."

5. **Optional R demotion**
   - "Reorganize or relabel Intro R and R practice materials as optional/enrichment. Update only R-related folders and repo docs necessary to prevent confusion."

6. **Topic 2 inference slides**
   - "Add a minimal, PPE-friendly hypothesis-testing block to `1_SLIDES/Topic 2 - Probability/2.Probability.tex` after CLT. Keep formulas light and interpretation strong. Compile the PDF."

7. **Topic 2 problem set**
   - "Add hypothesis-testing exercises to `2_PROBLEM_SETS/Topic 2 - Probability/Problem_set_2_probability.tex`, and correct any CLT/tail-probability solution errors in that file only."

8. **Causality/studies no-code pass**
   - "Review Topic 3 and Topic 4 problem sets for required R execution. Convert required questions to table-based/no-code where feasible and mark any remaining R work optional."

9. **Linear regression primary no-R pass**
   - "Make the no-R linear regression problem set the primary 2026-27 version. Keep R-based regression exercises as optional enrichment."

10. **Question bank update**
    - "Add a small 2026-27 hypothesis-testing question bank with answers. Keep it aligned with the new Topic 2 inference slides."

11. **Midterm 1**
    - "Create `9_EXAMS/2026-27/Midterm1.tex` and PDF. Scope: probability, CLT, basic hypothesis testing, and early causal inference."

12. **Midterm 2**
    - "Create `9_EXAMS/2026-27/Midterm2.tex` and PDF. Scope: causal designs/studies and linear-regression interpretation. Avoid requiring students to write R code unless explicitly approved."

13. **Plugin update**
    - "Update local skills/plugins so probability includes hypothesis testing and project grading expects paper reports/slides, not `.Rmd` data-analysis projects."

14. **Final QA**
    - "Run a stale-reference and compile audit for the 2026-27 migration. Report unresolved references and broken builds without making broad content changes."

## Open Decisions

Resolve these before large edits:

1. Should optional R remain as `Topic 0`, or should the folder be renamed to something visibly optional such as `Optional Intro R`?
2. Should midterm 2 be a written applied exam with precomputed tables/output, or a practical exam using statistical software?
3. Should qualitative methods remain as a taught module with slides/materials, or is it only a syllabus-level learning outcome?
4. Should the active project instructions include the currently commented AI-use policy, oral-question list, rubric, and grade caps?
5. Should project papers be kept only as citations/DOIs, or should the repo include any instructor-only PDF copies outside the public materials?
6. Is the desired archive a full public folder snapshot, a Git tag, or both?

## Completion Criteria

The migration is complete when:

- Active files and PDFs use 2026-27 naming and dates.
- The 2025-26 version is preserved and discoverable.
- The syllabus, intro slides, README, MAP, rubrics, exams, project instructions, and local skills describe the same assessment structure.
- R is clearly optional/enrichment except where used by the instructor for case studies.
- The project is clearly a paper-analysis task and no active grading tool expects `.Rmd` code submissions.
- Topic 2 includes a clear basic-inference bridge from CLT to comparison-of-means tests.
- Problem sets and exams are aligned with the revised workload.
- A final stale-reference scan does not find active misleading references to the old structure.
