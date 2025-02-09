# ConcatVideos.ps1
# Execute no PowerShell: .\ConcatVideos.ps1

# Verifica se o ffmpeg está instalado
if (-not (Get-Command ffmpeg -ErrorAction SilentlyContinue)) {
    Write-Host "Erro: FFmpeg não encontrado. Instale o FFmpeg e adicione ao PATH." -ForegroundColor Red
    exit 1
}

# Configurações
$tempDir = Join-Path $PWD "temp_videos"
$outputFile = "final_output.mp4"

# Cria diretório temporário
New-Item -Path $tempDir -ItemType Directory -Force | Out-Null

try {
    # Etapa 1: Re-encode MP4 files to standard format
    Get-ChildItem *.mp4 | Sort-Object Name | ForEach-Object {
        $outputVideo = Join-Path $tempDir ($_.BaseName + "_reencoded.mp4")

        ffmpeg -i $_.FullName -vf "scale=1280:720" -r 30 -pix_fmt yuv420p -c:v libx264 -preset medium -crf 23 -c:a aac -b:a 128k -ar 48000 -ac 2 $outputVideo -y
        if ($LASTEXITCODE -ne 0) { throw "Falha na re-codificação de $($_.Name)" }
    }

    # Etapa 2: Criar lista de arquivos para concatenação
    $inputList = Join-Path $tempDir "inputs.txt"
    Get-ChildItem $tempDir *_reencoded.mp4 | Sort-Object Name | ForEach-Object {
        "file '$(Resolve-Path $_.FullName)'" | Out-File -FilePath $inputList -Append -Encoding utf8
    }

    # Etapa 3: Concatenar arquivos re-encodificados
    ffmpeg -f concat -safe 0 -i $inputList -c copy $outputFile
    if ($LASTEXITCODE -ne 0) { throw "Falha na concatenação dos arquivos" }

    Write-Host "Concatenação concluída! Arquivo final: $outputFile" -ForegroundColor Green
}
catch {
    Write-Host "Erro: $($_.Exception.Message)" -ForegroundColor Red
}
finally {
    # Limpeza
    Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue
}