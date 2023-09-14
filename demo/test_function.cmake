# https://blog.csdn.net/fengbingchun/article/list/2
# --------------------------------------
# function(<name> [<arg1> ...])
# 	<commands>
# endfunction()
# name是function的名字，参数为arg1,arg2等。function名称不区分大小写，通常function使用全小写名称。

message("")
message("1.function名称不区分大小写，但是始终建议使用function定义相同的名称")
function(csdn_addr)
	message("csdn")
endfunction()

csdn_addr()
csdn_ADDR()

# --------------------------------------
message("")
message("2.名称参数是必须的，如果未提供将触发error.参数名称之间不需要逗号")
function(addr csdn github)
	message("csdn add: ${csdn}")
	message("github addr: $github")
	
endfunction()

addr("https://csdn" "https://github")

# --------------------------------------
# 可以使用一些与定义的变量访问可选参数
# ARGC: 参数总数（命名参数+可选参数）
# ARGV: 包含命名参数和可选参数的变量列表
# ARGN: 仅包含可选参数的变量列表
message("")
message("3.可以使用一些与定义的变量访问可选参数:ARGC, ARGV, ARGN")
function(name_list name1 name2)
	message("argument count: ${ARGC}")
	message("all arguments: ${ARGV}")
	message("optional arguments: ${ARGN}")
endfunction()

name_list(Jack Kate Jony Tom)
# only named arguments
name_list(Jack Kate)

# --------------------------------------
# cmake还提供了ARGV0 ARGV1 ARGV2 ...... 这将具有传入参数的实际值
# 这些在function中起作用，在macro中直接使用无效
message("")
message("4.cmake还提供了ARGV0 ARGV1 ARGV2...")
function(programing_language name1 name2)
	if(${ARGV0})	# 不起作用
		message("ARGV0: ${ARGV0}")
	else()
		message("ARGV0 not defined")
	endif()
	message("ARGV0: ${ARGV0}")

	math(EXPR last_index "${ARGC} -1")
	foreach(index RANGE 0 ${last_index})
		message("argument at index ${index}: ${ARGV${index}}")
	endforeach()
	
endfunction()

programing_language(C++ Python Go Matlab)

# --------------------------------------
message("")
message("5.使用DEFINED关键字，你可以检查是否定义了给定的变量、变量缓存或环境变量")
macro(foo_macro name)
	if(DEFINED name)
		message("macro argument name is defined")
	else()
		message("macro argument name is not defined")
	endif()
endmacro()

function(foo_func name)
	if(DEFINED name)
		message("function argument name is defined")
	else()
		message("function argument name is not defined")
	endif()
endfunction()

foo_macro(csdn)
foo_func(csdn)

# --------------------------------------
message("")
message("6.与function不同，macro不会引入新的作用域，在macro中声明的变量(参数除外)将在调用后可用")
set(development_language "C++")

macro(set_development_language name)
	message("macro parma: ${name}")
	message("macro name: ${development_language}")
	set(new_language "Pyhton")
	set(development_language "Matlab")
	message("macro new language: ${new_language}")
endmacro()

set_development_language("Go")
message("development_language: ${development_language}")
message("new_language: ${new_language}")

# --------------------------------------
message("")
message("7.由于macro不会创建任何新作用域，因此调用return()将退出当前作用域")
macro(early_return)
	message("csdn")
	return()
	message("github")
endmacro()

early_return() # 退出当前cmake
message("will never be executed")
