# https://blog.csdn.net/fengbingchun/article/list/2
# cmake_parse_arguments解析function或者macro的参数
# cmake_parse_arguments(<prefix> <options> <one_value_keywords> <multi_value_keywords> <args>...)
# 	funciont macro都可以使用
# cmake_parse_arguments(PARSE_ARGV <N> <prefix> <options> <one_value_keywords> <multi_value_keywords>)
# 	只能function中使用

# --------------------------------------
# macro(<name> [<arg1> ...])
# 	<commands>
# endmacro()
# ARGC: 参数总数（命名参数+可选参数）
# ARGV: 包含命名参数和可选参数的变量列表
# ARGN: 仅包含可选参数的变量列表
message("")
message("使用一些预定义的变量访问可选参数")
macro(name_list name1 name2)
	message("argument count: ${ARGC}")
	message("all arguments: ${ARGV}")
	message("optional argument: ${ARGN}")
endmacro()

name_list(Jack Kate Jony Tom)
message("--------------------------------")
name_list(Jack Kate)


message("")
message("1.test macro: ARGN")
macro(test_macro)
	set(prefix MACRO1)
	set(options CSDN GITHUB)
	set(one_value_keywords DESTINATION)
	set(multi_value_keywords FILES RES)

	cmake_parse_arguments(${prefix} "${options}" "${one_value_keywords}" "${multi_value_keywords}" ${ARGN})

	message("MACRO1_CSDN: ${MACRO1_CSDN}")
	message("MACRO1_GITHUB: ${MACRO1_GITHUB}")
	message("MACRO1_DESTINATION: ${MACRO1_DESTINATION}")
	message("MACRO1_FILES: ${MACRO1_FILES}")
	message("MACRO1_RES: ${MACRO1_RES}")
	message("MACRO1_UNPARSED_ARGUMENTS: ${MACRO1_UNPARSED_ARGUMENTS}")

	if (NOT DEFINED MACRO1_RES)
		message("MACRO1_RES variable is not defined")
	endif()
endmacro()

test_macro(FILES test.cpp main.cpp DESTINATION /usr/lib CSDN config DEBUG)
message("--------------------------------")
test_macro(RES png txt model DESTINATION /usr/lib /opt GITHUB test)

# --------------------------------------
# PARSE_ARGV只能在function中使用

message("")
message("2.test function: PARSE_ARGV")
function(test_function addr_csdn addr_github)
	set(prefix FUNC2)
	set(options CSDN GITHUB)
	set(one_value_keywords DESTINATION)
	set(multi_value_keywords FILES RES)

	# 命名参数(names arguments) = 2
	cmake_parse_arguments(PARSE_ARGV 2 ${prefix} "${options}" "${one_value_keywords}" "${multi_value_keywords}")

	message("FUNC2_CSDN: ${FUNC2_CSDN}")
	message("FUNC2_GITHUB: ${FUNC2_GITHUB}")
	message("FUNC2_DESTINATION: ${FUNC2_DESTINATION}")
	message("FUNC2_FILES: ${FUNC2_FILES}")
	message("FUNC2_RES: ${FUNC2_RES}")
	message("FUNC2_UNPARSED_ARGUMENTS: ${FUNC2_UNPARSED_ARGUMENTS}")

	message("addr csdn: ${addr_csdn}")
	message("addr github: ${addr_github}")
endfunction()

test_function("https://csdn" "https://github" FILES test.cpp main.cpp DESTINATION /usr/lib CSDN config DEBUG)
message("--------------------------------")
test_function("https://csdn" "https://github" RES png txt model DESTINATION /usr/lib /opt GITHUB test)
