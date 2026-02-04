Write-Host " DevOps Assessment: Full-Stack Hello World Deployment" -ForegroundColor Green
Write-Host "=" * 70 -ForegroundColor Cyan

# Step 1: Check prerequisites
Write-Host "`n Checking prerequisites..." -ForegroundColor Yellow
$dockerVersion = docker --version
$dockerComposeVersion = docker-compose --version
$nodeVersion = node --version

Write-Host " Docker: $dockerVersion" -ForegroundColor Green
Write-Host " Docker Compose: $dockerComposeVersion" -ForegroundColor Green
Write-Host " Node.js: $nodeVersion" -ForegroundColor Green

# Step 2: Clean up previous containers
Write-Host "`n Cleaning up previous deployments..." -ForegroundColor Yellow
docker-compose down --remove-orphans 2>&1 | Out-Null
Write-Host " Previous containers removed" -ForegroundColor Green

# Step 3: Build and start services
Write-Host "`n Building and starting services..." -ForegroundColor Yellow
docker-compose up --build -d

# Step 4: Check if containers are running
Write-Host "`n Checking service status..." -ForegroundColor Yellow
Start-Sleep -Seconds 5

Write-Host "`n Running Containers:" -ForegroundColor Cyan
docker-compose ps

Write-Host "`n Network Configuration:" -ForegroundColor Cyan
docker network inspect waybeyond-devops-project_app-network -f "{{json .Containers}}" | ConvertFrom-Json | ForEach-Object {
    $_.IPAddress = $_.IPv4Address.Split('/')[0]
    Write-Host "  - $($_.Name): $($_.IPAddress)"
}

# Step 5: Test endpoints
Write-Host "`n Testing application endpoints..." -ForegroundColor Yellow

# Test backend
Write-Host "`nTesting Backend (http://localhost:3000):" -ForegroundColor Cyan
try {
    $backendResponse = Invoke-WebRequest -Uri "http://localhost:3000" -UseBasicParsing -TimeoutSec 5
    Write-Host " Backend is responding: $($backendResponse.Content)" -ForegroundColor Green
} catch {
    Write-Host " Backend test failed: $_" -ForegroundColor Red
}

# Test frontend
Write-Host "`nTesting Frontend (http://localhost:3005):" -ForegroundColor Cyan
try {
    $frontendResponse = Invoke-WebRequest -Uri "http://localhost:3005" -UseBasicParsing -TimeoutSec 5
    Write-Host " Frontend is responding" -ForegroundColor Green
} catch {
    Write-Host " Frontend test failed: $_" -ForegroundColor Red
}

# Step 6: Display summary
Write-Host "`n" + "=" * 70 -ForegroundColor Cyan
Write-Host " DEPLOYMENT SUMMARY" -ForegroundColor Green
Write-Host "=" * 70 -ForegroundColor Cyan

Write-Host "`n Application URLs:" -ForegroundColor Yellow
Write-Host "  Frontend: http://localhost:3005" -ForegroundColor White
Write-Host "  Backend:  http://localhost:3000" -ForegroundColor White
Write-Host "  Backend API: http://localhost:3000/api/data" -ForegroundColor White

Write-Host "`n Useful Commands:" -ForegroundColor Yellow
Write-Host "  View logs: docker-compose logs" -ForegroundColor White
Write-Host "  View logs for specific service: docker-compose logs frontend" -ForegroundColor White
Write-Host "  Stop services: docker-compose down" -ForegroundColor White
Write-Host "  Restart services: docker-compose restart" -ForegroundColor White

Write-Host "`n Container Status:" -ForegroundColor Yellow
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

Write-Host "`n" + "=" * 70 -ForegroundColor Cyan
Write-Host " Deployment Complete! Open http://localhost:3005 in your browser" -ForegroundColor Green
