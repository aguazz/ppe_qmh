# Local AI + Overleaf + GitHub Workflow

This guide explains a practical workflow for writing and maintaining course LaTeX repositories with:

```text
local Positron or VS Code + AI coding assistant + Overleaf + Git + GitHub
```

The recommended pattern is:

```text
Overleaf project <-> local Git repo <-> GitHub repo
```

In this setup, the local repository is the bridge. You pull from Overleaf, edit locally with Positron or VS Code and an AI assistant, then push back to both Overleaf and GitHub.

## 0. Requirements

You need the following before starting.

### Overleaf account

Create or use an existing Overleaf account. Overleaf Git integration and Overleaf GitHub synchronization are premium features on Overleaf Cloud. Access may also be available through Overleaf Commons, an institutional subscription, or a group subscription.

For a course repository, make sure the Overleaf project owner has the needed access. If the project owner has premium access, collaborators may also be able to use Git access for that project, depending on the project and account setup.

### Positron or VS Code

Install one local editor:

- Positron, especially useful for R, Python, Quarto, and data-science-oriented course material.
- Visual Studio Code, a general-purpose editor with a large extension ecosystem.

Positron is built on Code OSS and supports many VS Code extensions, but it uses Open VSX rather than the Visual Studio Marketplace. Some extensions available in VS Code may not appear in Positron, or may lag behind the VS Code Marketplace version.

### Git

Install Git and confirm that it works:

```powershell
git --version
```

Git is required because it is the tool that clones, pulls, commits, and pushes between:

- Overleaf and your local machine.
- Your local machine and GitHub.

The editor is not the source of truth. The Git repository is.

### GitHub account

Create or use an existing GitHub account. You will use GitHub as the durable remote backup, collaboration space, and optional place for pull requests, issues, and release snapshots.

### Local LaTeX distribution

Install one local LaTeX distribution and make sure `latexmk` works:

```powershell
latexmk -v
```

Common options:

- **TeX Live**: robust, cross-platform, and very complete. The full install is large, but it avoids many missing-package surprises. Good default when disk space is not a problem.
- **MiKTeX**: common on Windows and can auto-install missing packages. Good for Windows users who want a smaller initial install, but the first setup and package database sometimes need maintenance.
- **TinyTeX**: lightweight TeX Live-based distribution, popular in R/RMarkdown/Quarto workflows. Excellent when you want a small install, but non-R users may need to install missing packages manually with `tlmgr`.

LaTeX Workshop and many editor workflows expect `latexmk` because it automatically runs LaTeX, BibTeX or Biber, and extra LaTeX passes as needed.

### Optional GitHub CLI

GitHub CLI, `gh`, is optional. It is useful for creating repositories, opening pull requests, and checking GitHub state from the terminal.

Check whether it is installed:

```powershell
gh --version
```

Authenticate if you plan to use it:

```powershell
gh auth login
```

### AI coding assistant

Choose one or more AI coding assistants:

- OpenAI Codex.
- Claude Code.
- Gemini Code Assist.

These tools can read and edit files in the local repository. Treat them as powerful collaborators: ask for plans, review changes, and use Git to verify exactly what changed.

### Safe local folder

Choose a safe local parent folder for the repo. A backed-up folder such as OneDrive, Dropbox, iCloud Drive, or Google Drive is often convenient.

Example:

```powershell
cd "C:\Users\YOUR-NAME\OneDrive - YOUR-INSTITUTION\Teaching\2025-26"
```

For this repository, the working pattern is similar to:

```powershell
cd "C:\Users\aguaz\OneDrive - CUNEF\Teaching\2025-26"
```

Cloud-sync folders are useful, but they can temporarily lock files while syncing. If Git or LaTeX reports a file-locking error, wait a few seconds, pause sync briefly, or close the PDF viewer/editor that is holding the file.

## 1. Recommended Architecture

Use this architecture:

```text
Overleaf project <-> local Git repo <-> GitHub repo
```

The local repo has two remotes:

```text
overleaf  -> Overleaf Git remote
github    -> GitHub remote
```

The local machine is the bridge:

1. Pull Overleaf changes into the local repo.
2. Edit locally in Positron or VS Code.
3. Use an AI coding assistant locally.
4. Compile locally if possible.
5. Commit the changes.
6. Push to Overleaf.
7. Push to GitHub.

This avoids mixing too many synchronization systems at once.

Overleaf also has its own GitHub synchronization feature. That is separate from local Git remotes. It can directly link an Overleaf project to a GitHub repository, but it has limitations: synchronization is not automatic, existing Overleaf projects cannot be linked to existing GitHub repositories, Overleaf does not support Git LFS or nested submodules inside projects, and merge conflicts may create extra branches that must be resolved.

For course repositories, the cleaner mental model is usually:

```text
Overleaf is one remote.
GitHub is another remote.
The local repo coordinates both.
```

## 2. Creating And Linking Repositories

### 2.1 Create or initialize the Overleaf project

In Overleaf:

1. Create a new project, or open an existing project.
2. Add initial files or import existing files.
3. Make sure the project compiles successfully in Overleaf.
4. Keep the project structure simple before connecting Git.

For this kind of course repository, typical folders might include:

```text
1_SLIDES/
2_PROBLEM_SETS/
3_R_PRACTICE/
7_BIBLIOGRAPHY/
11_GRADES_AND_SUBMISSIONS/
```

Private contents inside folders such as `11_GRADES_AND_SUBMISSIONS/` should be ignored by Git before pushing to shared remotes. If you want the folder itself to appear on Overleaf and GitHub, track a harmless placeholder such as `11_GRADES_AND_SUBMISSIONS/README.md` while ignoring everything else inside the folder.

### 2.2 Enable Overleaf Git integration

In Overleaf:

1. Open the project.
2. Open **Integrations** or **Menu -> Git**, depending on the Overleaf interface.
3. Copy the `git clone` command shown by Overleaf.

Overleaf uses token authentication for Git:

- If Git asks for a username, use `git`.
- If Git asks for a password, paste the Overleaf Git authentication token.
- Create the token in **Overleaf Account Settings -> Git integration**.
- Store the token safely. You may not be able to view the full token again later.
- Do not share the token with collaborators. Each collaborator should use their own token.

The Overleaf clone command will look similar to:

```powershell
git clone https://git@git.overleaf.com/PROJECT_ID
```

or:

```powershell
git clone https://git.overleaf.com/PROJECT_ID
```

Use the exact command Overleaf gives you.

### 2.3 Clone Overleaf locally

Open Positron or VS Code.

Then open a terminal in the parent folder where the local repo should live:

```powershell
cd "C:\Users\YOUR-NAME\OneDrive - YOUR-INSTITUTION\Teaching\2025-26"
```

Paste the Overleaf `git clone` command:

```powershell
git clone https://git@git.overleaf.com/PROJECT_ID
```

Authenticate with:

- Username: `git`
- Password: your Overleaf Git authentication token

Then open the cloned folder as the editor workspace root.

Example:

```powershell
cd .\ppe_qmh
git status --short
```

### 2.4 Rename the Overleaf remote

After cloning, the Overleaf remote is usually called `origin`. Rename it to `overleaf` so that `origin` does not become ambiguous later.

```powershell
git remote -v
git remote rename origin overleaf
git remote -v
```

Expected result:

```text
overleaf  https://git@git.overleaf.com/PROJECT_ID (fetch)
overleaf  https://git@git.overleaf.com/PROJECT_ID (push)
```

### 2.5 Create and connect a GitHub repository

On GitHub:

1. Create a new repository.
2. Choose the owner, such as your user account or organization.
3. Choose visibility, usually private for teaching material.
4. If the local repo already has commits, do **not** initialize the GitHub repo with a README, `.gitignore`, or license.

Then add GitHub as a second remote:

```powershell
git remote add github https://github.com/OWNER/REPO.git
git remote -v
git branch --show-current
git push -u github main
```

Replace:

- `OWNER` with your GitHub user or organization.
- `REPO` with the GitHub repository name.
- `main` with the actual branch name if needed.

If your branch is `master`, use:

```powershell
git push -u github master
```

You can check remote branches with:

```powershell
git ls-remote --heads overleaf
git ls-remote --heads github
```

Optional GitHub CLI alternative:

```powershell
gh repo create OWNER/REPO --private --source . --remote github --push
```

### 2.6 Daily sync commands

Use this workflow when `main` is the active branch.

Start by checking the state:

```powershell
git status --short
```

If the working tree is clean, pull from Overleaf before editing:

```powershell
git pull overleaf main
```

After editing locally:

```powershell
git status --short
git diff
git add .
git commit -m "Describe changes"
git push overleaf main
git push github main
```

Replace `main` with the actual branch name if needed.

Pull from GitHub when changes were made on GitHub, by another collaborator, by GitHub's web editor, by a pull request, or by a cloud AI coding tool connected to GitHub:

```powershell
git pull github main
```

A slightly safer daily rhythm is:

```powershell
git status --short
git pull overleaf main
git pull github main
git status --short
```

Then edit, compile, commit, and push.

## 3. Integrating Positron Or VS Code With AI Coding Assistants

AI assistants work best when the local repo is the workspace root. Open the folder that contains `.git`, not just a subfolder.

### 3.1 Codex

OpenAI Codex can be used from an IDE extension or from the Codex CLI, depending on your setup.

Typical setup:

1. Install the Codex extension in VS Code, Cursor, or another supported VS Code-like editor, if available.
2. Or install/use Codex CLI if you prefer a terminal workflow.
3. Sign in with your OpenAI or ChatGPT account.
4. Open the repository root in the editor.
5. Ask Codex to inspect, explain, or edit files.

In VS Code-like editors, Codex may appear as an icon, side panel, chat panel, or command-palette action. In Positron, extension availability may differ because Positron uses Open VSX rather than the VS Code Marketplace.

For CLI use, run Codex from the repository root:

```powershell
cd "C:\path\to\repo"
codex
```

Good first prompt:

```text
Explain this repository structure and identify private folders that should not be committed.
```

### 3.2 Claude Code

Claude Code can be used from the terminal and, where available, from a VS Code extension.

Typical CLI setup:

```powershell
npm install -g @anthropic-ai/claude-code
cd "C:\path\to\repo"
claude
```

Sign in with an Anthropic account, Claude account, or supported enterprise provider.

Claude Code supports terminal workflows, where you ask it to inspect or edit the repo. In supported IDE workflows, it can also provide side-panel interactions, plan review, file references, and diff review.

Good first prompt:

```text
Review the LaTeX project structure and propose a safe .gitignore for auxiliary files and private instructor material.
```

### 3.3 Gemini Code Assist

Gemini Code Assist is another optional AI coding assistant.

Typical VS Code setup:

1. Open the Extensions view.
2. Search for `Gemini Code Assist`.
3. Install the extension.
4. Sign in with a Google account.
5. Select or connect the required Google Cloud project if prompted.

Gemini Code Assist can provide code completions, chat, explanations, tests, and multi-file assistance in supported IDEs.

In Positron, availability depends on whether the extension is available through Open VSX.

### 3.4 AI safety practices

Use AI assistants, but keep Git as the audit trail.

Before large edits:

```text
Before editing files, give me your plan and wait for approval.
```

Before accepting changes:

```powershell
git status --short
git diff
```

Before committing:

```powershell
git diff --cached
```

Practical cautions:

- Ask for a plan before large edits.
- Review diffs before accepting AI changes.
- Do not let AI commit or push private data.
- Do not paste Overleaf tokens, API keys, passwords, student grades, or private feedback into AI prompts.
- Keep private contents inside `11_GRADES_AND_SUBMISSIONS/` and other private folders ignored.
- Prefer small commits with descriptive messages.
- Compile locally before pushing when possible.

If you accidentally stage private files:

```powershell
git status --short
git restore --staged path\to\private-file
```

If the private file is already committed but not pushed:

```powershell
git reset --soft HEAD~1
git restore --staged path\to\private-file
```

If private data has already been pushed, stop and treat it as an incident: rotate any exposed tokens, remove the data from current files, and follow GitHub's sensitive-data removal guidance.

### 3.5 Local Codex workflow agent for this repository

This repository includes a repo-local Codex plugin/agent to help check and guide this workflow:

```text
.agents/plugins/marketplace.json
plugins/overleaf-github-workflow-agent/
```

The plugin contributes the `overleaf-github-workflow` skill. It is designed as a conservative setup assistant: it audits first, explains the current state, and proposes exact commands. It should not collect tokens, commit, push, pull with uncommitted changes, rewrite history, or change remotes without explicit approval.

Good Codex prompt:

```text
Use the overleaf-github-workflow skill to audit this repo. Do not edit files, commit, pull, or push without approval.
```

You can also run its read-only audit script from the repository root:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\plugins\overleaf-github-workflow-agent\scripts\Test-OverleafGithubWorkflow.ps1
```

The script checks:

- Git availability.
- Optional GitHub CLI availability.
- `latexmk` and `pdflatex` availability.
- Current Git branch.
- Configured remotes.
- Whether `origin` should be renamed to `overleaf`.
- Whether a `github` remote exists.
- Whether private contents inside paths such as `11_GRADES_AND_SUBMISSIONS/` are ignored while a public placeholder can remain tracked.
- Whether common LaTeX auxiliary files are ignored.
- Whether `.vscode/settings.json` contains the recommended LaTeX Workshop settings.

Optional remote checks may contact Overleaf or GitHub and may prompt for credentials:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\plugins\overleaf-github-workflow-agent\scripts\Test-OverleafGithubWorkflow.ps1 -CheckRemoteAccess
```

Only run remote checks when you are ready to authenticate. Do not paste Overleaf Git tokens into AI chat.

## 4. LaTeX In Positron Or VS Code

### 4.1 Install LaTeX Workshop

Install the **LaTeX Workshop** extension.

In VS Code:

1. Open Extensions.
2. Search for `LaTeX Workshop`.
3. Install it.

In Positron:

1. Open Extensions.
2. Search for `LaTeX Workshop`.
3. Install it if available through Open VSX.

If it does not appear in Positron, either use VS Code for LaTeX editing or install manually from a trusted `.vsix` source if your institution allows that.

### 4.2 Install local LaTeX distribution

Choose one distribution:

- **TeX Live**: best for complete local reproducibility. Large install, fewer missing packages.
- **MiKTeX**: especially common on Windows. Can auto-install missing packages, but may need first-run setup, package updates, and console maintenance.
- **TinyTeX**: small and easy to maintain, especially for R/RMarkdown/Quarto users. Missing packages may need manual `tlmgr install PACKAGE` outside R workflows.

After installation, restart Positron or VS Code so the editor sees the updated `PATH`.

Check:

```powershell
pdflatex --version
latexmk -v
```

If `latexmk` is not found, install it through your LaTeX distribution's package manager or switch to a distribution bundle that includes it.

### 4.3 Recommended LaTeX Workshop settings

Use this safer default.

Important: do **not** set `latex-workshop.latex.outDir` to a root-level `aux_files/` folder if you want PDFs produced beside the `.tex` file.

```json
{
  "latex-workshop.view.pdf.viewer": "tab",
  "latex-workshop.latex.outDir": "%DIR%",
  "latex-workshop.latex.autoBuild.run": "onSave",
  "latex-workshop.latex.autoClean.run": "onBuilt",
  "latex-workshop.latex.clean.fileTypes": [
    "*.aux",
    "*.bbl",
    "*.blg",
    "*.idx",
    "*.ind",
    "*.lof",
    "*.lot",
    "*.out",
    "*.toc",
    "*.acn",
    "*.acr",
    "*.alg",
    "*.glg",
    "*.glo",
    "*.gls",
    "*.ist",
    "*.fls",
    "*.log",
    "*.fdb_latexmk",
    "*.snm",
    "*.nav",
    "*.vrb"
  ]
}
```

What this does:

- PDFs stay next to the `.tex` file.
- Most auxiliary files are cleaned after the build.
- `*.synctex.gz` is intentionally not deleted by default because it helps source-PDF synchronization.
- `*.synctex.gz` should still be ignored by Git.

Example: if you build:

```text
1_SLIDES/Topic 0 - Intro Course/0.Intro.tex
```

the PDF should appear beside it:

```text
1_SLIDES/Topic 0 - Intro Course/0.Intro.pdf
```

### 4.4 Where to save settings

You have two choices.

User settings apply globally to all projects:

```text
VS Code user settings
Positron user settings
```

Workspace settings apply only to this repository:

```text
.vscode/settings.json
```

Use workspace settings when the configuration is repo-specific. For a course repository, workspace settings are usually better because they travel with the repo and give collaborators the same LaTeX Workshop behavior.

If you commit `.vscode/settings.json`, keep it limited to project settings. Do not commit personal paths, private tokens, or machine-specific configuration.

## 5. Git Ignore

Add or modify `.gitignore` at the repository root.

Recommended block:

```gitignore
# Private instructor material: keep the folder shell, ignore its contents.
/11_GRADES_AND_SUBMISSIONS/*
!/11_GRADES_AND_SUBMISSIONS/README.md

# LaTeX auxiliary files
aux_files/
*.aux
*.log
*.out
*.toc
*.bbl
*.blg
*.fls
*.fdb_latexmk
*.synctex.gz
*.nav
*.snm
*.vrb
```

This is a safety net even if LaTeX Workshop cleans auxiliary files automatically.

Git cannot track a truly empty folder. The exception for `11_GRADES_AND_SUBMISSIONS/README.md` keeps the grades/submissions folder visible on Overleaf and GitHub without tracking private files, student submissions, feedback, exports, or subfolders inside it.

Check ignored files:

```powershell
git status --short --ignored
```

If a private file is already tracked, adding it to `.gitignore` is not enough. You must untrack it:

```powershell
git rm --cached path\to\private-file
git commit -m "Stop tracking private file"
```

For a private folder whose shell should be visible in Git but whose contents should remain local-only, use a tracked placeholder and ignore everything else:

```gitignore
/11_GRADES_AND_SUBMISSIONS/*
!/11_GRADES_AND_SUBMISSIONS/README.md
```

If private files were already tracked, remove only those private files from Git tracking with `git rm --cached path\to\private-file`, then commit the ignore-rule change. Be careful: `git rm --cached` removes files from Git tracking, not from your disk. Do not omit `--cached` unless you intentionally want to delete the files from the working folder too.

## 6. Troubleshooting

### Git is not recognized

Symptom:

```text
git : The term 'git' is not recognized
```

Fix:

1. Install Git.
2. Restart Positron or VS Code.
3. Restart the terminal.
4. Check:

```powershell
git --version
```

### Overleaf token authentication fails

Check:

- Username is `git`.
- Password is the Overleaf Git authentication token, not your Overleaf account password.
- The token has not expired or been deleted.
- You copied the full token.
- You are using the Git URL from the project menu.

If needed, create a new token in Overleaf Account Settings and update your saved credentials.

### Remote `origin` already exists

If you cloned from Overleaf, `origin` probably points to Overleaf. Rename it:

```powershell
git remote -v
git remote rename origin overleaf
git remote -v
```

If `github` already exists and points to the wrong repository:

```powershell
git remote -v
git remote set-url github https://github.com/OWNER/REPO.git
git remote -v
```

### Wrong branch name: `main` vs `master`

Check your branch:

```powershell
git branch --show-current
```

Check remote branches:

```powershell
git ls-remote --heads overleaf
git ls-remote --heads github
```

Use the branch name that actually exists:

```powershell
git pull overleaf master
git push github master
```

or:

```powershell
git pull overleaf main
git push github main
```

### MiKTeX says first setup is unfinished

Open **MiKTeX Console** and:

1. Finish setup tasks.
2. Check for updates.
3. Update the package database.
4. Enable or confirm missing-package installation behavior.

Then restart the editor and try again.

### LaTeX Workshop creates PDFs in the wrong folder

Check `.vscode/settings.json` or user settings.

Recommended:

```json
{
  "latex-workshop.latex.outDir": "%DIR%"
}
```

Avoid setting `outDir` to a root-level `aux_files/` folder if you want each PDF beside its `.tex` source.

### AI assistant extension does not appear in Positron

Positron uses Open VSX rather than the Visual Studio Marketplace. If an extension does not appear:

- Search Open VSX.
- Check the assistant's official installation docs.
- Use the assistant CLI from Positron's terminal.
- Use VS Code for that assistant if the extension is only available there.

### OneDrive, Dropbox, iCloud, or Google Drive locks files

Symptoms:

- Git cannot rename or update a file.
- LaTeX cannot overwrite a PDF.
- The editor reports a file is busy.

Fix:

1. Wait a few seconds and retry.
2. Close the PDF preview tab.
3. Pause cloud sync temporarily.
4. Avoid compiling the same PDF from two tools at once.

### Accidentally staged private files

Check:

```powershell
git status --short
```

Unstage:

```powershell
git restore --staged path\to\private-file
```

Add a `.gitignore` rule, then verify:

```powershell
git status --short --ignored
```

If the file was already committed, do not push until you have removed it from the commit or rewritten the local commit safely.

## 7. Final Checklist

Before using this workflow regularly, confirm:

- [ ] Overleaf project exists.
- [ ] Overleaf project compiles.
- [ ] Local repo is cloned.
- [ ] `overleaf` remote works.
- [ ] GitHub repo exists.
- [ ] `github` remote works.
- [ ] `.gitignore` protects private and auxiliary files.
- [ ] `11_GRADES_AND_SUBMISSIONS/README.md` is tracked, but private `11_GRADES_AND_SUBMISSIONS/` contents are ignored.
- [ ] LaTeX compiles locally.
- [ ] `latexmk -v` works.
- [ ] PDF is produced beside the `.tex` file.
- [ ] Local Codex workflow agent audit has been reviewed.
- [ ] AI assistant can read/edit the repo.
- [ ] Diffs are reviewed before commits.
- [ ] `git status --short --ignored` confirms private folder contents are ignored.

Useful final checks:

```powershell
git remote -v
git branch --show-current
git status --short --ignored
latexmk -v
```

## Sources

- [Overleaf: Git integration and GitHub synchronization](https://docs.overleaf.com/integrations-and-add-ons/git-integration-and-github-synchronization)
- [Overleaf: Git integration](https://docs.overleaf.com/integrations-and-add-ons/git-integration-and-github-synchronization/git)
- [Overleaf: Git integration authentication tokens](https://docs.overleaf.com/integrations-and-add-ons/git-integration-and-github-synchronization/git/git-integration-authentication-tokens)
- [Overleaf: GitHub synchronization](https://docs.overleaf.com/integrations-and-add-ons/git-integration-and-github-synchronization/github-synchronization)
- [Git: git-remote documentation](https://git-scm.com/docs/git-remote)
- [Git: git-pull documentation](https://git-scm.com/docs/git-pull)
- [Git: git-status documentation](https://git-scm.com/docs/git-status)
- [GitHub Docs: Adding locally hosted code to GitHub](https://docs.github.com/en/github/importing-your-projects-to-github/adding-an-existing-project-to-github-using-the-command-line)
- [GitHub Docs: Managing remote repositories](https://docs.github.com/github/using-git/adding-a-remote)
- [GitHub Docs: Ignoring files](https://docs.github.com/en/get-started/getting-started-with-git/ignoring-files)
- [GitHub Docs: Removing sensitive data from a repository](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository)
- [GitHub CLI manual](https://cli.github.com/manual/)
- [VS Code: User and workspace settings](https://code.visualstudio.com/docs/getstarted/settings)
- [VS Code: Use extensions](https://code.visualstudio.com/docs/getstarted/extensions)
- [Positron: Extensions](https://positron.posit.co/extensions)
- [Positron: Git Version Control](https://positron.posit.co/git.html)
- [LaTeX Workshop: Compile documentation](https://github.com/James-Yu/LaTeX-Workshop/wiki/Compile)
- [LaTeX Workshop: View documentation](https://github.com/James-Yu/LaTeX-Workshop/wiki/View)
- [TeX Live](https://tug.org/texlive/)
- [TeX Live quick install](https://www.tug.org/texlive/quickinstall.html)
- [MiKTeX install on Windows](https://miktex.org/howto/install-miktex)
- [MiKTeX automatic package installation](https://docs.miktex.org/manual/autoinstall.html)
- [TinyTeX documentation](https://yihui.org/tinytex/)
- [CTAN: latexmk](https://ctan.org/pkg/latexmk/)
- [OpenAI Help: Using Codex with your ChatGPT plan](https://help.openai.com/en/articles/11369540-using-codex-with-your-chatgpt-plan)
- [OpenAI Help: Codex CLI and Sign in with ChatGPT](https://help.openai.com/en/articles/11381614-api-codex-cli-and-sign-in-with-chatgpt)
- [OpenAI Platform: Codex](https://platform.openai.com/docs/codex)
- [Anthropic: Claude Code overview](https://docs.anthropic.com/en/docs/claude-code/overview)
- [Anthropic: Set up Claude Code](https://docs.anthropic.com/en/docs/claude-code/getting-started)
- [Claude Code: VS Code integration](https://code.claude.com/docs/en/ide-integrations)
- [Google Developers: Gemini Code Assist overview](https://developers.google.com/gemini-code-assist/docs/overview)
- [Google Cloud: Set up Gemini Code Assist](https://cloud.google.com/gemini/docs/codeassist/set-up-gemini)
