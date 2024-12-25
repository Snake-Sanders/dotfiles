## Installling CPP tools

## Clang 

Most probably Clang is already installed, but double check anyway:

```
clang --version

Apple clang version 15.0.0 (clang-1500.3.9.4)
Target: arm64-apple-darwin23.6.0
Thread model: posix
InstalledDir: /Library/Developer/CommandLineTools/usr/bin
```

otherwise install it with 

`brew install llvm`

## Neovim 

follow the installation in `https://clangd.llvm.org/installation`

add `clangd` to the `lspconfig`

** Attention**: 
Use only the installation of `clangd` from the system not the neovim pluging.
If we don't indicate where `clangd` is installed in the system, neovim
with automatically pull the `clangd` module from the repo. 
This will create a conflict with the local installation failing to locate the 
standar library. (e.g.: it will complain about the includes and `cout`, `cin`, 
`endl`, etc.

so instead of using the default configuration `cmd = { 'clangd', ...`
we specify the version from the system `cmd = { '/usr/bin/clangd',...` 
to see where is the system installation, just type `which clangd`

:!clangd --version
```lua
-- cpp
clangd = {
   cmd = { '/usr/bin/clangd', '--background-index', '--clang-tidy', '--log=verbose' },
   init_options = {
     fallback_flags = { '-std=c++17' },
   },
   capabilities = capabilities,
},
 ```

## install CMake

`brew install --cask cmake`

check with:

```
cmake --version                                                                           main [✘?]
cmake version 3.30.3
```

## Example of use

```
project/
│
├── CMakeLists.txt
└── main.cpp
```


add `CMakeLists.txt` to the root of the dir project

```cmake
# Minimum CMake version required
cmake_minimum_required(VERSION 3.10)

# Set project name
project(MyAppProject)

# Set C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add the executable, this takes the source file and output name
add_executable(app main.cpp)
```

Create a subdirecotry `build`

```
mkdir build
cd build
cmake ..
make
```

Then you can run it by calling `./app`

## Version

For Exercism it is needed Cpp+17, you can add `.clangd` 
file in your root dir:

```cpp
CompileFlags:
    Add: [-std=c++17]
```
