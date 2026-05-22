# Repo-Local Agents

This repository includes local Codex plugins and skills for maintaining the PPE Quantitative Methods for Humanities course. They live under `plugins/` and are advertised through the local marketplace file:

```text
.agents/plugins/marketplace.json
```

Use them from the repository root in Codex, Positron, or VS Code. In a prompt, name the skill with its `$skill-name` trigger, or choose the agent display name if your Codex UI exposes local agents.

## How To Use

1. Open the repository root, not an individual subfolder.
2. Make sure the local plugins listed in `.agents/plugins/marketplace.json` are enabled or installed if your Codex UI asks.
3. Start the request with the relevant trigger, for example:

```text
Use $probability-expert to draft a short quiz question on conditional probability with an answer key.
```

4. Give the agent the target folder, file, or year when that matters.
5. For grading or student-submission work, keep all private material inside `11_GRADES_AND_SUBMISSIONS/` and do not commit generated grades, feedback, or submissions.

## Available Agents

| Agent | Trigger | Location | Use For |
| --- | --- | --- | --- |
| Overleaf GitHub Workflow Agent | `$overleaf-github-workflow` | `plugins/overleaf-github-workflow-agent/skills/overleaf-github-workflow/` | Auditing and guiding the local Positron or VS Code, AI assistant, Overleaf, Git, GitHub, and LaTeX workflow. |
| Intro R Expert | `$intro-r-expert` | `plugins/qmh-topic-experts/skills/intro-r-expert/` | Creating or reviewing optional beginner R and R Markdown enrichment material. Do not treat R practice as required 2026-27 assessment unless explicitly asked. |
| Probability Expert | `$probability-expert` | `plugins/qmh-topic-experts/skills/probability-expert/` | Creating, reviewing, or grading probability questions, quizzes, problem sets, exams, answer keys, and feedback for Topic 2. |
| Causal Inference Expert | `$causal-inference-expert` | `plugins/qmh-topic-experts/skills/causal-inference-expert/` | Creating, reviewing, or grading causal inference and study-design material for Topics 3 and 4. |
| Linear Regression Expert | `$linear-regression-expert` | `plugins/qmh-topic-experts/skills/linear-regression-expert/` | Creating, reviewing, or grading linear regression exercises, exams, answer keys, and student feedback for Topic 5. |
| Project Submission Preprocessor | `$project-submission-preprocessor` | `plugins/qmh-project-grading/skills/project-submission-preprocessor/` | Turning raw Canvas group-project submissions into short `processed_20xx-xx/g###` folders for grading while leaving raw submissions untouched. For 2026-27, expect paper-exposition reports/slides rather than R code. |
| Project Grading Agent | `$project-grading-agent` | `plugins/qmh-project-grading/skills/project-grading-agent/` | Grading processed group-project submissions against the active project instructions and rubric, then writing feedback files and `grades_summary.csv`. Before 2026-27 grading, confirm the prompt/rubric matches the paper-exposition project rather than the old data-analysis project. |

## Plugin Families

- `overleaf-github-workflow-agent`: one workflow agent plus a read-only PowerShell audit script.
- `qmh-topic-experts`: four reusable course-topic experts for optional Intro R enrichment, probability, causal inference, and linear regression.
- `qmh-project-grading`: two private-workflow agents for preprocessing and grading group project submissions. For 2026-27, use them only after checking that grading expectations match the paper-exposition project.

## Common Prompts

```text
Use $overleaf-github-workflow to audit this repo. Do not edit files, commit, pull, or push without approval.
```

```text
Use $intro-r-expert to review this optional beginner R exercise for clarity and expected difficulty.
```

```text
Use $causal-inference-expert to check whether this project feedback uses the correct treatment/control and estimand language.
```

```text
Use $project-submission-preprocessor to organize the latest QMH project submissions folder.
```

```text
Use $project-grading-agent to grade the latest processed QMH project submissions.
```

## Safety Notes

- Read the relevant `SKILL.md` before changing files with an agent.
- The workflow agent should inspect first and ask before commits, pulls, pushes, remote changes, or credential-sensitive operations.
- The submission preprocessor should never modify raw `submissions_20xx-xx` folders.
- The grading agent should write grades and feedback only inside the selected processed project folder unless explicitly told otherwise.
- For 2026-27 project grading, verify that the grading agent is using the paper-exposition instructions and rubric.
- Intro R material is optional/enrichment in 2026-27; do not create required coding assessment unless the instructor explicitly requests it.
- Topic experts should use local course materials as the source of truth for notation, examples, and expected difficulty.
