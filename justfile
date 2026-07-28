set shell := ["bash", "-cu"]

# Setup project
[group('.')]
setup:
    bun install

# Biome lint and format
[group('.')]
biome:
    bun run biome:check

# Clean generated artifacts
[group('.')]
clean:
    rm -rf dist .astro .wrangler

# Validation before commit/deploy
[group('.')]
ci: biome check build

# Development
[group('astro')]
dev:
    bun run dev --host

# Build production
[group('astro')]
build:
    bun run build

# Check Astro files
[group('astro')]
check:
    bun run check

# Preview Cloudflare Pages locally
[group('cloudflare')]
preview:
    bun run cf:preview

# Deploy to Cloudflare Pages
[group('cloudflare')]
deploy:
    bun run cf:deploy
