set shell := ["bash", "-cu"]

# Setup project
[group('.')]
setup:
    bun install --frozen-lockfile

# Check formatting and linting
[group('.')]
lint:
    bun run biome:check

# Apply formatting and linting
[group('.')]
fmt:
    bun run biome:fix

# Clean generated artifacts
[group('.')]
clean:
    rm -rf dist .astro .wrangler

# Run CI Workflow
[group('.')]
ci:
    bun run ci

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
