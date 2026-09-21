#!/bin/bash

# CodeCompanion Free Tier Setup Script
# This script helps you set up API keys for various free tier LLM providers

echo "🚀 Setting up CodeCompanion with Free Tier LLMs"
echo "=============================================="

# Create .env file in Neovim config directory
ENV_FILE="$HOME/.config/nvim/.env"
echo "Creating environment file at: $ENV_FILE"

# Function to add API key to .env file
add_api_key() {
    local provider=$1
    local env_var=$2
    local description=$3
    local signup_url=$4
    
    echo ""
    echo "📝 Setting up $provider"
    echo "   $description"
    echo "   Sign up at: $signup_url"
    echo ""
    read -p "Enter your $provider API key (or press Enter to skip): " api_key
    
    if [[ -n "$api_key" ]]; then
        echo "export $env_var=\"$api_key\"" >> "$ENV_FILE"
        echo "✅ $provider API key added"
    else
        echo "⏭️  Skipped $provider"
    fi
}

# Create/clear the .env file
cat > "$ENV_FILE" << 'EOF'
# CodeCompanion API Keys
# Add your free tier API keys below
EOF

echo ""
echo "🔑 We'll set up API keys for several free tier providers."
echo "   You can skip any you don't want to use."
echo ""

# Groq setup
add_api_key "Groq" "GROQ_API_KEY" \
    "Fast LLM inference with generous free tier (30 requests/minute)" \
    "https://console.groq.com/keys"

# OpenRouter setup  
add_api_key "OpenRouter" "OPENROUTER_API_KEY" \
    "Access to many free/open source models" \
    "https://openrouter.ai/keys"

# HuggingFace setup
add_api_key "HuggingFace" "HUGGINGFACE_API_KEY" \
    "Free inference for many open source models" \
    "https://huggingface.co/settings/tokens"

echo ""
echo "🔧 Setting up shell configuration..."

# Add to shell config
SHELL_CONFIG=""
if [[ -n "$ZSH_VERSION" ]]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [[ -n "$BASH_VERSION" ]]; then
    SHELL_CONFIG="$HOME/.bashrc"
fi

if [[ -n "$SHELL_CONFIG" && -f "$SHELL_CONFIG" ]]; then
    if ! grep -q "source.*$ENV_FILE" "$SHELL_CONFIG"; then
        echo "" >> "$SHELL_CONFIG"
        echo "# CodeCompanion API Keys" >> "$SHELL_CONFIG"
        echo "if [ -f \"$ENV_FILE\" ]; then" >> "$SHELL_CONFIG"
        echo "    source \"$ENV_FILE\"" >> "$SHELL_CONFIG"
        echo "fi" >> "$SHELL_CONFIG"
        echo "✅ Added to $SHELL_CONFIG"
    fi
fi

echo ""
echo "📋 Quick Start Guide:"
echo "===================="
echo "1. Restart your shell or run: source $SHELL_CONFIG"
echo "2. Restart Neovim"
echo "3. Open CodeCompanion chat: <LocalLeader>c"
echo "4. Switch adapters in chat: ga"
echo "5. Available adapters:"
echo "   • groq (default) - Fast, reliable"
echo "   • openrouter - Many free models"  
echo "   • huggingface - Open source models"
echo "   • ollama - Local models (requires Ollama installation)"
echo ""
echo "🎯 Keymaps:"
echo "   <LocalLeader>a - Action Palette"
echo "   <LocalLeader>c - Toggle Chat"
echo "   <LocalLeader>g (visual) - Add selection to chat"
echo "   ga (in chat) - Switch adapter"
echo "   <C-s> - Send message"
echo "   <C-c> - Close chat"
echo ""
echo "💡 Pro Tips:"
echo "   • Start with Groq for speed and reliability"
echo "   • Use OpenRouter for model variety"
echo "   • Switch adapters when hitting rate limits"
echo "   • Context is preserved when switching adapters"
echo ""
echo "✨ Setup complete! Enjoy coding with AI assistants."