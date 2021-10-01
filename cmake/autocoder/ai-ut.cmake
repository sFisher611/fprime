
# Bail if not testing
if (NOT BUILD_TESTING)
    return()
endif()
set(HANDLES_INDIVIDUAL_SOURCES TRUE)

function(is_supported AC_INPUT_FILE)
    set(IS_SUPPORTED FALSE PARENT_SCOPE)
    if (AC_INPUT_FILE MATCHES ".*ComponentAi\\.xml")
        set(IS_SUPPORTED TRUE PARENT_SCOPE)
    endif()
endfunction (is_supported)

function(get_generated_files AC_INPUT_FILE)
    set(GENERATED_FILES ${CMAKE_CURRENT_BINARY_DIR}/GTestBase.cpp ${CMAKE_CURRENT_BINARY_DIR}/TesterBase.cpp
                        ${CMAKE_CURRENT_BINARY_DIR}/GTestBase.hpp ${CMAKE_CURRENT_BINARY_DIR}/TesterBase.hpp PARENT_SCOPE)
endfunction(get_generated_files)

function(get_dependencies AC_INPUT_FILE)
endfunction(get_dependencies)

function(setup_autocode AC_INPUT_FILE GENERATED_FILES MODULE_DEPENDENCIES FILE_DEPENDENCIES EXTRAS)
    set(EXTRA_COMMANDS ${CMAKE_COMMAND} -E remove ${CMAKE_CURRENT_BINARY_DIR}/Tester.hpp ${CMAKE_CURRENT_BINARY_DIR}/Tester.cpp ${CMAKE_CURRENT_BINARY_DIR}/TestMain.cpp)
    setup_ai_autocode_variant("-u" "${CMAKE_CURRENT_BINARY_DIR}" "${EXTRA_COMMANDS}" "${AC_INPUT_FILE}"
                              "${GENERATED_FILES}" "${MODULE_DEPENDENCIES}" "${FILE_DEPENDENCIES}")
endfunction()
