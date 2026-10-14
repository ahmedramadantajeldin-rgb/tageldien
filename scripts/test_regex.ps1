$files = Get-ChildItem -Path "C:\Users\ENG  AHMED TAG\Documents\tageldien" -Filter "*.html" -Recurse

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    Write-Host "--- $($file.Name) ---"
    
    $qMatches = [regex]::Matches($content, "(?is).{0,50}(question|exercise|practice).{0,50}")
    if ($qMatches.Count -gt 0) {
        $val = $qMatches[0].Value.Trim()
        Write-Host "Match 1: $val"
    } else {
        Write-Host "No word found"
    }
}
