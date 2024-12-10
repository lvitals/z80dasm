cmake_minimum_required(VERSION 3.10)
project(z80dasm)

# Habilita suporte a testes, se necessário
enable_testing()

# Define as flags de compilação
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")

# Define os arquivos fonte
set(SOURCES
    src/dz80.c
    src/dz80.h
    src/dz80dat.c
    src/dz180dat.c
    src/table.c
    src/cmdline.c
    src/symtab.c
    src/symload.c
    src/symtab.h
    src/blocks.c
    src/blocks.h
    src/utils.c
    src/utils.h
    src/col.c
    src/col.h
)

# Define o executável
add_executable(z80dasm ${SOURCES})

# Instalar as páginas de manual
install(FILES ${CMAKE_SOURCE_DIR}/docs/z80dasm.1 DESTINATION share/man/man1)

# Adicionar a instalação do binário
install(TARGETS z80dasm DESTINATION bin)

set(TEST_CASES
    labelsdd
    jrwrap
    basicblocks
    overlapblocks
    unlabeledblocks
    firstlastblocks
    blockstartredefined
    blockstartdifferent
    ed_at_end_1
    ed_at_end_2
    symbol_order_default
    symbol_order_frequency
    symbol_order_frequency_empty
    symbol_comment_default
    undoc_cb_30
    undoc_cb_31
    undoc_cb_32
    undoc_cb_33
    undoc_cb_34
    undoc_cb_35
    undoc_cb_36
    undoc_cb_37
    undoc_dd_24
    undoc_dd_25
    undoc_dd_26_00
    undoc_dd_2c
    undoc_dd_2d
    undoc_dd_2e_00
    undoc_dd_44
    undoc_dd_45
    undoc_dd_4c
    undoc_dd_4d
    undoc_dd_54
    undoc_dd_55
    undoc_dd_5c
    undoc_dd_5d
    undoc_dd_60
    undoc_dd_61
    undoc_dd_62
    undoc_dd_63
    undoc_dd_64
    undoc_dd_65
    undoc_dd_67
    undoc_dd_68
    undoc_dd_69
    undoc_dd_6a
    undoc_dd_6b
    undoc_dd_6c
    undoc_dd_6d
    undoc_dd_6f
    undoc_dd_7c
    undoc_dd_7d
    undoc_dd_84
    undoc_dd_85
    undoc_dd_8c
    undoc_dd_8d
    undoc_dd_94
    undoc_dd_95
    undoc_dd_9c
    undoc_dd_9d
    undoc_dd_a4
    undoc_dd_a5
    undoc_dd_ac
    undoc_dd_ad
    undoc_dd_b4
    undoc_dd_b5
    undoc_dd_bc
    undoc_dd_bd
    undoc_dd_cb_00_00
    undoc_dd_cb_00_01
    undoc_dd_cb_00_02
    undoc_dd_cb_00_03
    undoc_dd_cb_00_04
    undoc_dd_cb_00_05
    undoc_dd_cb_00_06
    undoc_dd_cb_00_07
    undoc_dd_cb_00_08
    undoc_dd_cb_00_10
    undoc_dd_cb_00_18
    undoc_dd_cb_00_20
    undoc_dd_cb_00_28
    undoc_dd_cb_00_30
    undoc_dd_cb_00_38
    undoc_dd_cb_00_80
    undoc_dd_cb_00_88
    undoc_dd_cb_00_90
    undoc_dd_cb_00_98
    undoc_dd_cb_00_a0
    undoc_dd_cb_00_a8
    undoc_dd_cb_00_b0
    undoc_dd_cb_00_b8
    undoc_dd_cb_00_c0
    undoc_dd_cb_00_c8
    undoc_dd_cb_00_d0
    undoc_dd_cb_00_d8
    undoc_dd_cb_00_e0
    undoc_dd_cb_00_e8
    undoc_dd_cb_00_f0
    undoc_dd_cb_00_f8
    undoc_fd_cb_00_00
    undoc_fd_cb_00_01
    undoc_fd_cb_00_02
    undoc_fd_cb_00_03
    undoc_fd_cb_00_04
    undoc_fd_cb_00_05
    undoc_fd_cb_00_06
    undoc_fd_cb_00_07
    undoc_fd_cb_00_08
    undoc_fd_cb_00_10
    undoc_fd_cb_00_18
    undoc_fd_cb_00_20
    undoc_fd_cb_00_28
    undoc_fd_cb_00_30
    undoc_fd_cb_00_38
    undoc_fd_cb_00_80
    undoc_fd_cb_00_88
    undoc_fd_cb_00_90
    undoc_fd_cb_00_98
    undoc_fd_cb_00_a0
    undoc_fd_cb_00_a8
    undoc_fd_cb_00_b0
    undoc_fd_cb_00_b8
    undoc_fd_cb_00_c0
    undoc_fd_cb_00_c8
    undoc_fd_cb_00_d0
    undoc_fd_cb_00_d8
    undoc_fd_cb_00_e0
    undoc_fd_cb_00_e8
    undoc_fd_cb_00_f0
    undoc_fd_cb_00_f8
)

foreach(test_case ${TEST_CASES})

    set(test_bin ${CMAKE_SOURCE_DIR}/test/test_cases/${test_case}.bin)



    if(test_case STREQUAL "labelsdd" 
        OR test_case STREQUAL "ed_at_end_1"
        OR test_case STREQUAL "ed_at_end_2"
        OR test_case STREQUAL "symbol_order_default"
        OR test_case STREQUAL "symbol_order_frequency")
        add_test(
            NAME z80dasm_test_${test_case}
            COMMAND ${CMAKE_BINARY_DIR}/z80dasm -g0 -l -o ${CMAKE_SOURCE_DIR}/test/test_cases/${test_case}.asm ${test_bin}
        )

    elseif(test_case STREQUAL "basicblocks" 
            OR test_case STREQUAL "overlapblocks"
            OR test_case STREQUAL "unlabeledblocks"
            OR test_case STREQUAL "firstlastblocks"
            OR test_case STREQUAL "blockstartredefined"
            OR test_case STREQUAL "blockstartdifferent")
        add_test(
            NAME z80dasm_test_${test_case}
            COMMAND ${CMAKE_BINARY_DIR}/z80dasm -g0 -l -at -o ${CMAKE_SOURCE_DIR}/test/test_cases/${test_case}.generated.asm -b ${CMAKE_SOURCE_DIR}/test/test_cases/${test_case}.blocks ${test_bin}
        )

    elseif(test_case STREQUAL "symbol_order_frequency_empty"
            OR test_case STREQUAL "symbol_comment_default")
        add_test(
            NAME z80dasm_test_${test_case}
            COMMAND ${CMAKE_BINARY_DIR}/z80dasm -g0 -l -r frequency -s ${test_case}.generated.sym -o ${test_case}.generated.asm ${test_bin}
        )
    else()
        add_test(
            NAME z80dasm_test_${test_case}
            COMMAND ${CMAKE_BINARY_DIR}/z80dasm -vvv -g0 -l -o ${CMAKE_SOURCE_DIR}/test/test_cases/${test_case}.asm ${test_bin}
        )

    endif()

endforeach()


# Para testes adicionais, como o uso de um gerador de stress, adicione algo como:
add_custom_target(stress_test
    COMMAND ${CMAKE_SOURCE_DIR}/test/stress.sh ${CMAKE_BINARY_DIR}/z80dasm 20
)

