# Указываем имя библиотеки
add_subdirectory(add)
add_subdirectory(mul)

# Создаем исполняемый файл main
add_executable(main main.cpp)

# Линкуем библиотеку add с исполняемым файлом
target_link_libraries(main PUBLIC add mul)
