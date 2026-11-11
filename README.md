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

- **[Liferay Cloud Database Reset Tool (lcp-db-reset)](https://github.com/peterrichards-lr/lcp-db-reset)**: A high-performance Rust CLI utility to reset Liferay Cloud (LCP) database schemas.
  <br>*(Tags: automation, cli, cloud-native, database, devops, dxp, lcp, liferay, liferay-cloud, rust)*
- **[Liferay Cloud SQL Fetch Tool (lcp-sql-fetch)](https://github.com/peterrichards-lr/lcp-sql-fetch)**: Professional CLI tool to execute local SQL scripts on Liferay Cloud databases and fetch results securely.
  <br>*(Tags: cli, database-management, devops, lcp, liferay, liferay-cloud, mysql, postgresql, rust, sql)*
- **[Liferay Services Updater (lcp-svc-update)](https://github.com/peterrichards-lr/lcp-svc-update)**: Liferay Services Updater - Automated CLI tool to update Liferay Cloud service Docker image references (LCP.json) by scraping official Liferay Support releases.
  <br>*(Tags: automation, cli, devops, docker, dxp, json, lcp, liferay, liferay-cloud, liferay-experience-cloud, lxc, paas, rust, scraping)*
- **[lfr-local](https://github.com/peterrichards-lr/lfr-local)**: A CLI tool to configure and run side-by-side Liferay instances within a local workspace.
- **[lfr-mock-gen](https://github.com/peterrichards-lr/lfr-mock-gen)**: A blazing-fast Rust CLI tool that uses Gemini AI to generate realistic mock Web Content and pushes it directly to Liferay via Headless REST APIs.
- **[Liferay Tunnel (lfr-tunnel)](https://github.com/peterrichards-lr/lfr-tunnel)**: A secure, self-hosted tunneling solution for Liferay instances and client extensions, routing traffic from wildcard subdomains to local developer environments with automated SSL and offline support.
  <br>*(Tags: chisel, go, liferay, reverse-proxy, sales-engineering, tunnel)*
- **[Liferay Workspace Updater (lwu)](https://github.com/peterrichards-lr/liferay-workspace-updater)**: A CLI tool to automatically update the Liferay Workspace Gradle plugin to its latest version
  <br>*(Tags: cli, gradle, liferay, rust, workspace)*
<!-- TOOLS_LIST_END -->

---

## 🛠️ How it Works

Every 2 hours, the [Update Homebrew Formulas](.github/workflows/update-formulas.yml) workflow checks each tool's latest GitHub release. When it finds a new one, it updates the formula's `url` and `sha256` (`scripts/update-formula.sh`), regenerates the tool list above (`scripts/update-readme.sh`), and commits the result.

Releasing a new version of a tool is therefore enough to update its formula here. `lfr-tunnel` is the exception: its own release workflow publishes its formula.

### Adding a New Tool

1. Add `Formula/<tool-name>.rb` for the tool's first release (the Rust tools generate it from their `formula.rb.example`).
2. Add an `Update <tool-name>` step to `.github/workflows/update-formulas.yml` so later releases are picked up automatically.

The tool list uses the first heading of each tool's README and its GitHub repository description and topics.
