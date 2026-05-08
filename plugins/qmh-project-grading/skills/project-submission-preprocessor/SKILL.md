---
name: project-submission-preprocessor
description: Use when Codex needs to preprocess PPE Quantitative Methods for Humanities group project submissions downloaded from Canvas. This includes finding the latest 11_GRADES_AND_SUBMISSIONS/Project/submissions_20xx-xx folder, asking the user to confirm the year/folder, creating a short processed_20xx-xx folder, parsing Canvas filenames, normalizing student-name filenames, grouping duplicate group submissions, keeping one representative submission bundle, removing duplicates from the processed copy only, and writing report.txt.
---

# Project Submission Preprocessor

Prepare raw Canvas project submissions for grading. Keep the raw folder untouched.

## Required Sources And Paths

- Work under `11_GRADES_AND_SUBMISSIONS/Project/`.
- Default to the latest folder matching `submissions_20xx-xx`.
- Before starting any copy, move, delete, or processed-folder creation, tell the user which year/folder was detected and ask for confirmation.
- Create the processed copy as `processed_20xx-xx` in the same `Project` folder.
- Write the preprocessing audit as `processed_20xx-xx/report.txt`.

## Raw File Pattern

Canvas files usually look like:

`1stsurname2ndsurnamegivenname_student-id_canvas-id_filenamegivenbystudent.ext`

Parse:

- student slug: first field before `_`
- student id: second field
- canvas id: third field
- student-given filename: everything after the third `_`
- extension: preserve original extension

Normalize processed filenames with the student slug only, plus extension:

`alvarezvazquezmanuela.Rmd`

Use ASCII-safe lowercase names by default: remove accents/diacritics, convert spaces/punctuation to nothing or short hyphens only when needed, and avoid long filenames. Preserve original filenames in `report.txt`.

If a single representative has multiple files with the same extension, append a short suffix: `alvarezvazquezmanuela_2.pdf`.

If a Canvas filename has a malformed extension with spaces or extra text, infer a safe extension when obvious from the original name or file content. For example, a text file whose name contains `.R` but ends as `.R INES` should become `.r`, with the original filename preserved in `report.txt`.

## Processed Folder Shape

Use short group folders:

```text
11_GRADES_AND_SUBMISSIONS/Project/processed_2025-26/
  report.txt
  g001/
    alvarezvazquezmanuela.Rmd
    alvarezvazquezmanuela.pdf
  g002/
    perezlopezmaria.Rmd
```

Do not include student names in group folder names.

Do not create `grade_this.txt` when each group folder contains one representative bundle. The grading agent should grade the `.Rmd` in each group folder.

## Group And Duplicate Logic

Group submissions conservatively.

Automatic same-group evidence:

- exact duplicate `.Rmd`, `.html`, `.pdf`, or other submission content by file hash;
- same `.Rmd` content after ignoring harmless whitespace differences;
- same clearly stated author/group list inside the `.Rmd` or compiled text.

Potential same-group evidence to flag, not silently merge:

- very similar `.Rmd` content without exact match;
- same project title and near-identical analysis;
- same student-given filename across different submitters.

For each detected group with multiple student submitters, keep only one representative bundle in the processed copy. Leave all originals in `submissions_20xx-xx`.

Representative selection:

1. Prefer the submitter with the largest number of associated files.
2. If tied, prefer the submitter whose normalized student slug is alphabetically first.
3. If still tied, prefer the bundle containing `.Rmd`.
4. Record every omitted duplicate submitter and original filename in `report.txt`.

If a duplicate decision is ambiguous, keep separate `g###` folders and flag the issue in `report.txt` instead of merging.

## Report Requirements

`report.txt` must be concise but audit-ready. Include:

- detected raw folder and processed folder;
- number of raw files and parsed submitters;
- group folders created;
- representative chosen for each group and why;
- original filenames copied into each group;
- exact duplicates omitted from the processed copy;
- ambiguous or possible duplicate cases requiring human review;
- parse failures or files not copied.

Never print sensitive grades here. This report is about file handling only.

## Safety

- Do not modify, rename, or delete anything inside the raw `submissions_20xx-xx` folder.
- Do not permanently delete ambiguous submissions.
- Keep paths short: use `processed_20xx-xx`, `g001`, short ASCII student filenames, and no nested duplicate folders.
- If `processed_20xx-xx` already exists, ask before overwriting or create a clearly versioned alternative such as `processed_20xx-xx_v2`.
