# CodeCoverage.cmake
# Модуль для интеграции покрытия кода в CMake

function(append_coverage_compiler_flags)
  if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
    message(STATUS "Добавляем флаги покрытия кода для ${CMAKE_CXX_COMPILER_ID}")
    add_compile_options(--coverage -O0 -g -fprofile-arcs -ftest-coverage)
    add_link_options(--coverage)
  else()
    message(WARNING "Покрытие кода не поддерживается для компилятора ${CMAKE_CXX_COMPILER_ID}")
  endif()
endfunction()

function(setup_target_for_coverage NAME EXECUTABLE)
  add_custom_target(${NAME}
    COMMAND ${CMAKE_COMMAND} --build . --target ${EXECUTABLE}
    COMMAND lcov --capture --initial --directory . --output-file coverage.base --ignore-errors=unused,empty,inconsistent,mismatch --rc branch_coverage=1
    COMMAND ${EXECUTABLE}
    COMMAND lcov --capture --directory . --output-file coverage.info --ignore-errors=unused,empty,inconsistent,mismatch --rc branch_coverage=1
    COMMAND lcov --add-tracefile coverage.base --add-tracefile coverage.info --output-file coverage.total --ignore-errors=unused,empty,inconsistent,mismatch --rc branch_coverage=1
    COMMAND lcov --output-file coverage_filtered.info --remove coverage.total "/usr/*" "include/*" "src/gtest*" "src/gmock*" "*/tests/*" --ignore-errors=unused,empty,inconsistent,mismatch --rc branch_coverage=1 
    COMMAND genhtml coverage_filtered.info --output-directory coverage_report --ignore-errors=unused,empty,inconsistent,mismatch --rc branch_coverage=1 
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    COMMENT "Генерация отчёта покрытия кода"
    VERBATIM
  )
endfunction()

