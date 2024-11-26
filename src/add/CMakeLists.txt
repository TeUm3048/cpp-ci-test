# Создаём статическую библиотеку add
add_library(add INTERFACE add.h)

# Указываем директорию с заголовочными файлами
target_include_directories(add INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})
