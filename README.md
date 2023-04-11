# PowerBash-Make
PowerBash-Make is a simple command-line build tool for compiling C/C++ programs using either PowerShell or Bash. It was created by ChatGPT and is distributed under the MIT License.

## PowerShell version
The PowerShell version of PowerBash-Make is fully functional and tested. It provides a simple way to compile C/C++ programs using the **clang** or **clang++** compiler.

To use the PowerShell version, navigate to the directory containing your C/C++ program in PowerShell and run the following command:

```PowerShell
.\make.ps1 file [-o output_file_name] [-m compiler_options]
```
Here, file is the name of your C/C++ source file, -o is an optional flag for specifying the output file name, and -m is an optional flag for specifying compiler options.

Note: If you enter a filename without its extension, it will look for that file with '.c' extension and if it finds, it will compile that file instead and if it doesn't it will look for that file with '.cpp' extension and will compile it and if it doesn't find the filename with any of those extension then it will print error message.

If no arguments are passed, the tool will print a usage message. If the specified file does not exist or is not a valid C/C++ file, the tool will print an error message and exit. If the compilation is successful, the tool will print a success message; otherwise, it will print a failure message.

Note: You can also use **and run** to run the outputfile if compilation was successful. Eg,
```powershell
make.ps1 main.c -o main -m "-Wall" and run
```

You can also set enviroment variable to that specific folder where you have make.ps1 and allow scripts in your powershell by using following command in adimin mode:

```powershell
Set-ExecutionPolicy RemoteSigned
```
Then you can just call make from wherever you like and it will run.

### Variables
You can customize the behavior of the PowerShell version of PowerBash-Make by modifying the following variables at the beginning of the make.ps1 file:

* compiler: The default compiler to use (clang or clang++).
* outputExt: The default file extension for the output file (.exe for Windows, empty for Unix-like systems).

Examples
Compile a C file named _hello.c_ with the default settings:

```powershell
make.ps1 hello.c
```
Compile a C++ file named _hello.cpp_ with custom compiler options and output file name:

```powershell
make.ps1 hello.cpp -o hello -m "-Wall -O3"
```
## Bash version
The Bash version of PowerBash-Make has not been fully tested as I don't have linux machine right now. It provides the same functionality as the PowerShell version, but with a Bash-compatible syntax.

To use the Bash version, navigate to the directory containing your C/C++ program in Bash and run the following command:

```bash
chmod +x make.sh
make.sh file [-o output_file_name] [-m compiler_options]
```
Here, **file** is the name of your C/C++ source file, **-o** is an optional flag for specifying the output file name, and **-m** is an optional flag for specifying compiler options.

If no arguments are passed, the tool will print a usage message. If the specified file does not exist or is not a valid C/C++ file, the tool will print an error message and exit. If the compilation is successful, the tool will print a success message; otherwise, it will print a failure message.

Note: If you enter a file without its extension, it will look for that file with '.c' extension and if it finds, it will compile that instead else if it doesn't it will look for that file with '.cpp' extension and will compile it and if it doesn't find any of those then it will print an error.

Just like in powershell version you can remove .sh from the name of the file and you can set the folder in which make.sh is located to the path and then you can run **make** from wherever you like.


Note: You can also use **and run** to run the outputfile if compilation was successful. Eg,
```powershell
make.sh main.c -o main -m "-Wall" and run
```

### Variables
You can customize the behavior of the Bash version of PowerBash-Make by modifying the following variables at the beginning of the **make.sh** file:

* compiler: The default compiler to use (**clang** or **clang++**).
* outputExt: The default file extension for the output file (**.out** by default).
