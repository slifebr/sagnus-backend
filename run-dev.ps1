# run-dev.ps1

Write-Host "Starting Sagnus ERP Development Environment..." -ForegroundColor Green

# 1. Check Dependencies
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Error "Docker not found. Please install Docker Desktop."
    exit 1
}
if (-not (Get-Command mvn -ErrorAction SilentlyContinue)) {
    Write-Error "Maven not found. Please install Maven."
    exit 1
}

# 2. Start Infrastructure (Docker Compose)
Write-Host "Starting Infrastructure (Postgres, RabbitMQ)..." -ForegroundColor Cyan
docker-compose -f infra/local/docker-compose.yml up -d

# 3. Start Backend Services (in parallel new windows)
$services = @(
    "sagnus-bc-auth"
    #"sagnus-api-gateway"
    #"sagnus-bc-corp",
    #"sagnus-bc-nfe"
)

foreach ($service in $services) {
    Write-Host "Starting $service..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "mvn -pl $service spring-boot:run"
}

Write-Host "All services startup initiated!" -ForegroundColor Green
Write-Host "Environment is ready!" -ForegroundColor Green
