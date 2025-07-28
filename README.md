# GitHub Actions - Simple System Commands

A simple GitHub Action that runs basic system commands like `date` and `hostname` on the GitHub Actions runner.

## Features

- **Simple Commands**: Runs basic system information commands
- **No Dependencies**: No external tools or packages required
- **Quick Execution**: Fast and lightweight
- **System Information**: Displays date, hostname, and system details

## Quick Start

### Run the Workflow

1. Go to your repository on GitHub
2. Click on "Actions" tab
3. Select "Run System Commands" workflow
4. Click "Run workflow"
5. The workflow will execute the commands and show the output

## Commands Executed

The workflow runs these commands:

```bash
# Date and time
date

# Hostname
hostname

# System information
uname -a

# Current directory
pwd

# Directory contents
ls -la
```

## Output Example

When you run the workflow, you'll see output like:

```
=== System Information ===
Date and Time:
Mon Dec 18 10:30:45 UTC 2023

Hostname:
fv-az1234-567

System Information:
Linux fv-az1234-567 5.15.0-1047-azure #52~20.04.1-Ubuntu SMP Thu Oct 12 18:48:47 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux

Current Directory:
/home/runner/work/your-repo/your-repo

Directory Contents:
total 12
drwxr-xr-x 3 runner docker 4096 Dec 18 10:30 .
drwxr-xr-x 3 runner docker 4096 Dec 18 10:30 ..
drwxr-xr-x 8 runner docker 4096 Dec 18 10:30 .git
-rw-r--r-- 1 runner docker  123 Dec 18 10:30 README.md
```

## Use Cases

- **Testing**: Verify GitHub Actions runner environment
- **Debugging**: Check system information during workflow execution
- **Learning**: Understand what commands are available on the runner
- **Documentation**: Generate system information for documentation

## Requirements

- No special requirements
- Runs on any GitHub Actions runner
- No secrets or configuration needed

## License

This project is open source and available under the MIT License.