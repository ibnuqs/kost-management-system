#!/bin/bash
# Quick Commands for Kost Management System

case "$1" in
    "deploy")
        echo "🚀 Starting production deployment..."
        ./scripts/deployment/deploy-production.sh
        ;;
    "fast-deploy")
        echo "⚡ Starting fast deployment via Git..."
        ./scripts/deployment/fast-deploy.sh
        ;;
    "domain")
        if [ -z "$2" ]; then
            echo "Usage: ./quick-commands.sh domain yourdomain.com"
            exit 1
        fi
        echo "🌐 Migrating to domain: $2"
        ./scripts/migration/migrate-to-domain.sh "$2"
        ;;
    "health")
        echo "🔍 Checking system health..."
        ./scripts/maintenance/health-check.sh
        ;;
    "backup")
        echo "💾 Creating backup..."
        ./scripts/backup/backup-restore.sh backup
        ;;
    "monitor")
        echo "📊 Starting monitoring..."
        ./scripts/maintenance/monitoring.sh
        ;;
    *)
        echo "🎯 Available commands:"
        echo "  ./quick-commands.sh deploy          - Deploy to production"
        echo "  ./quick-commands.sh fast-deploy     - ⚡ Fast deploy via Git (RECOMMENDED)"
        echo "  ./quick-commands.sh domain <domain> - Migrate to domain"
        echo "  ./quick-commands.sh health          - Check system health"
        echo "  ./quick-commands.sh backup          - Create backup"
        echo "  ./quick-commands.sh monitor         - Start monitoring"
        ;;
esac
