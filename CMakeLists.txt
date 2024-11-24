cmake_minimum_required(VERSION 3.28)
project(SimpleProject)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules")

# Установим стандарт языка C++
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

enable_testing()

# Включаем модуль для покрытия кода
include(CodeCoverage)

# Добавляем флаги компилятора для покрытия кода
append_coverage_compiler_flags()


# Добавляем подпроекты
add_subdirectory(src)
add_subdirectory(tests)

