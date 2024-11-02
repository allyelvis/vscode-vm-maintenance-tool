#!/bin/bash
# Variables
EXTENSION_NAME="vm-maintenance-tool"
AUTHOR_NAME="Ally Elvis Nzeyimana"
GITHUB_USERNAME="AllyElvis"
GITHUB_EMAIL="naelvis6569@gmail.com"
REPO_NAME="vscode-vm-maintenance-tool"
DESCRIPTION="VS Code extension to run VM maintenance tasks"
MAIN_BRANCH="main"
# Step 1: Generate VS Code Extension using Yeoman
echo "Generating VS Code extension project..."
npx yo code --no-insight --extensionName "$EXTENSION_NAME" --extensionDescription "$DESCRIPTION" --extensionDisplayName "$EXTENSION_NAME" --extensionType=typescript --publisher="$AUTHOR_NAME"
# Change directory into the extension project
cd "$EXTENSION_NAME" || { echo "Failed to enter extension directory"; exit 1; }
gcloud config set project aenzbi-ide
#!/bin/bash
# Variables
EXTENSION_NAME="vm-maintenance-tool"
AUTHOR_NAME="Ally Elvis Nzeyimana"
GITHUB_USERNAME="AllyElvis"
GITHUB_EMAIL="naelvis6569@gmail.com"
REPO_NAME="vscode-vm-maintenance-tool"
DESCRIPTION="VS Code extension to run VM maintenance tasks"
MAIN_BRANCH="main"
# Step 1: Generate VS Code Extension using Yeoman
echo "Generating VS Code extension project..."
npx yo code --no-insight --extensionName "$EXTENSION_NAME" --extensionDescription "$DESCRIPTION" --extensionDisplayName "$EXTENSION_NAME" --extensionType=typescript --publisher="$AUTHOR_NAME"
# Change directory into the extension project
cd "$EXTENSION_NAME" || { echo "Failed to enter extension directory"; exit 1; }
gcloud config set project aenzbi-ide
gh auth login
#!/bin/bash
# Variables
EXTENSION_NAME="vm-maintenance-tool"
AUTHOR_NAME="Ally Elvis Nzeyimana"
GITHUB_USERNAME="AllyElvis"
GITHUB_EMAIL="naelvis6569@gmail.com"
REPO_NAME="vscode-vm-maintenance-tool"
DESCRIPTION="VS Code extension to run VM maintenance tasks"
MAIN_BRANCH="main"
# Step 1: Generate VS Code Extension using Yeoman
echo "Generating VS Code extension project..."
npx yo code --no-insight --extensionName "$EXTENSION_NAME" --extensionDescription "$DESCRIPTION" --extensionDisplayName "$EXTENSION_NAME" --extensionType=typescript --publisher="$AUTHOR_NAME"
# Change directory into the extension project
cd "$EXTENSION_NAME" || { echo "Failed to enter extension directory"; exit 1; }
gcloud config set project aenzbi-ide
#!/bin/bash
# Variables
EXTENSION_NAME="vm-maintenance-tool"
AUTHOR_NAME="Ally Elvis Nzeyimana"
GITHUB_USERNAME="allyelvis"
GITHUB_EMAIL="allyelvis6569@gmail.com"
REPO_NAME="vscode-vm-maintenance-tool"
DESCRIPTION="VS Code extension to run VM maintenance tasks"
MAIN_BRANCH="main"
# Step 1: Generate VS Code Extension using Yeoman
echo "Generating VS Code extension project..."
npx yo code --no-insight --extensionName "$EXTENSION_NAME" --extensionDescription "$DESCRIPTION" --extensionDisplayName "$EXTENSION_NAME" --extensionType=typescript --publisher="$AUTHOR_NAME"
# Change directory into the extension project
cd vm_extension || { echo "Failed to enter extension directory"; }
# Step 2: Customize Extension Code
echo "Updating extension code to add VM maintenance command..."
# Overwrite or create the extension.ts with the command logic
cat << 'EOF' > src/extension.ts
import * as vscode from 'vscode';
import { exec } from 'child_process';

export function activate(context: vscode.ExtensionContext) {
    let disposable = vscode.commands.registerCommand('extension.runMaintenance', () => {
        vscode.window.showInformationMessage('Running VM Maintenance...');
        exec('./vm_maintainer.sh', (error, stdout, stderr) => {
            if (error) {
                vscode.window.showErrorMessage(`Error: ${error.message}`);
                return;
            }
            if (stderr) {
                vscode.window.showWarningMessage(`Warning: ${stderr}`);
                return;
            }
            vscode.window.showInformationMessage(`VM Maintenance Completed:\n${stdout}`);
        });
    });
    context.subscriptions.push(disposable);
}

export function deactivate() {}
EOF

# Step 3: Initialize Git Repository
echo "Initializing Git repository..."
git init
git branch -M "$MAIN_BRANCH"
git config user.name "$GITHUB_USERNAME"
git config user.email "$GITHUB_EMAIL"
# Step 4: Create GitHub Repository via GitHub CLI
echo "Creating GitHub repository..."
gh repo create "$REPO_NAME" --public --source=. --remote=origin --description "$DESCRIPTION"
# Step 5: Commit and Push Initial Code
echo "Committing and pushing code to GitHub..."
