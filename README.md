# Peter's Homebrew Tap

This is a custom [Homebrew Tap](https://docs.brew.sh/Taps) for distributing macOS and Linux CLI tools.

## 🚀 How to Use

### 1. Add this Tap
```bash
brew tap peterrichards-lr/tap https://github.com/peterrichards-lr/homebrew-tap
```

### 2. Install a Tool
```bash
# Replace 'tool-name' with one of the available tools below
brew install <tool-name>
```

Alternatively, install directly in one step:
```bash
brew install peterrichards-lr/tap/<tool-name>
```

---

## 📜 Available Tools

The following tools are available in this tap:

- **[lcp-db-reset](https://github.com/peterrichards-lr/lcp-db-reset)**: A Liferay Cloud utility to reset the database schema.
- **[lcp-sql-fetch](https://github.com/peterrichards-lr/lcp-sql-fetch)**: A tool that executes local SQL scripts on a Liferay Cloud database via lcp shell and downloads the results.
- **[lcp-svc-update](https://github.com/peterrichards-lr/lcp-svc-update)**: Liferay Services Updater - Automated CLI tool to update Liferay Cloud service images.
- **[lfr-local](https://github.com/peterrichards-lr/lfr-local)**: Liferay Local Instance Manager - CLI tool for managing local side-by-side Liferay environments.
- **[lfr-mock-gen](https://github.com/peterrichards-lr/lfr-mock-gen)**: Liferay Mock Content Generator - Blazing-fast CLI tool using Gemini AI to generate mock content.
- **[lwu (Liferay Workspace Updater)](https://github.com/peterrichards-lr/liferay-workspace-updater)**: A CLI tool to automatically update the Liferay Workspace Gradle plugin to its latest version.

---

## 🛠️ How it Works

Formulas in this tap are primarily updated automatically using GitHub Actions running in the individual tool repositories whenever a new release is created.