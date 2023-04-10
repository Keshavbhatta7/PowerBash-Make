# PowerBash-Make
PowerBash-Make is a simple command-line build tool for compiling C/C++ programs using either PowerShell or Bash. It was created by ChatGPT and is distributed under the MIT License.

## PowerShell version
The PowerShell version of PowerBash-Make is fully functional and tested. It provides a simple way to compile C/C++ programs using the __clang__ or __clang++__ compiler.

To use the PowerShell version, navigate to the directory containing your C/C++ program in PowerShell and run the following command:

```PowerShell
.\make.ps1 file [-o output_file_name] [-m compiler_options]
```

You can also set enviroment variable to that specific folder where you have make.ps1 and allow scripts in your powershell by using following command in adimin mode:

```powershell
Set-ExecutionPolicy RemoteSigned
```
Then you can just call make from wherever you like and it will run.
