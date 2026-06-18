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

<!-- TOOLS_LIST_START -->
The following tools are available in this tap:

- **[lcp-db-reset](https://github.com/peterrichards-lr/lcp-db-reset)**: A high-performance Rust CLI utility to reset Liferay Cloud (LCP) database schemas.
  <br>*(Tags: automation, cli, cloud-native, database, devops, dxp, lcp, liferay, liferay-cloud, rust)*
- **[lcp-sql-fetch](https://github.com/peterrichards-lr/lcp-sql-fetch)**: Professional CLI tool to execute local SQL scripts on Liferay Cloud databases and fetch results securely.
  <br>*(Tags: cli, database-management, devops, lcp, liferay, liferay-cloud, mysql, postgresql, rust, sql)*
- **[lcp-svc-update](https://github.com/peterrichards-lr/lcp-svc-update)**: Liferay Services Updater - Automated CLI tool to update Liferay Cloud service Docker image references (LCP.json) by scraping official Liferay Support releases.
  <br>*(Tags: automation, cli, devops, docker, dxp, json, lcp, liferay, liferay-cloud, liferay-experience-cloud, lxc, paas, rust, scraping)*
- **[lfr-local](https://github.com/peterrichards-lr/lfr-local)**: A CLI tool to configure and run side-by-side Liferay instances within a local workspace.
- **[lfr-mock-gen](https://github.com/peterrichards-lr/lfr-mock-gen)**: A blazing-fast Rust CLI tool that uses Gemini AI to generate realistic mock Web Content and pushes it directly to Liferay via Headless REST APIs.
- **[lfr-tunnel](https://github.com/peterrichards-lr/lfr-tunnel)**: A secure, self-hosted tunneling solution for Liferay instances and client extensions, routing traffic from wildcard subdomains to local developer environments with automated SSL and offline support.
  <br>*(Tags: chisel, go, liferay, reverse-proxy, sales-engineering, tunnel)*
- **[lwu](https://github.com/peterrichards-lr/liferay-workspace-updater)**: A CLI tool to automatically update the Liferay Workspace Gradle plugin to its latest version
  <br>*(Tags: cli, gradle, liferay, rust, workspace)*
<!-- TOOLS_LIST_END -->

---

## 🛠️ How it Works

Formulas in this tap are primarily updated automatically using GitHub Actions running in the individual tool repositories whenever a new release is created.
