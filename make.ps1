if ($args.Count -eq 0) {
    # If no arguments are passed, print usage message
    Write-Host "Usage: make.ps1 file [-o output_file_name] [-m compiler_options]"
} else {
    $filename = $args[0]
    if (-not (Test-Path $filename)) {
        # If file does not exist, print error message and usage message
        Write-Host "Error: File '$filename' does not exist."
        Write-Host "Usage: make.ps1 file [-o output_file_name] [-m compiler_options]"
    } else {
        $extension = [System.IO.Path]::GetExtension($filename)
        if ($extension -eq ".c") {
            $compiler = "clang"
        } elseif ($extension -eq ".cpp") {
            $compiler = "clang++"
        } else {
            # If invalid file type, print error message and return
            Write-Host "Error: Invalid file type. Only .c and .cpp files are supported."
            return
        }

        $outputfile = [System.IO.Path]::GetFileNameWithoutExtension($filename)
        $outputfile = if ($args.Contains("-o")) {
            $outputidx = [array]::IndexOf($args, "-o") + 1
            if ($outputidx -lt $args.Count -and $args[$outputidx] -match "\.exe$") {
                $args[$outputidx]
            } elseif ($outputidx -lt $args.Count) {
                $args[$outputidx] + ".exe"
            } else {
                # If output file name missing, print error message and usage message
                Write-Host "Error: Output file name missing after -o option"
                Write-Host "Usage: make.ps1 file [-o output_file_name] [-m compiler_options]"
                exit 1
            }
        } else {
            "$outputfile.exe"
        }

        $compilerArgs = ""
        if ($args.Contains("-m")) {
            $midx = [array]::IndexOf($args, "-m") + 1
            if ($midx -lt $args.Count) {
                $compilerArgs = $args[$midx]
            } else {
                # If compiler options missing, print error message and usage message
                Write-Host "Error: Compiler options missing after -m option"
                Write-Host "Usage: make.ps1 file [-o output_file_name] [-m compiler_options]"
                exit 1
            }
        }

        $compileCmd = "$compiler $filename -o $outputfile $compilerArgs"
        Write-Host "Command: $compileCmd"
        Invoke-Expression $compileCmd

        if (Test-Path $outputfile) {
            Write-Host "Compilation successful."
        } else {
            Write-Host "Compilation failed."
        }
    }
}
