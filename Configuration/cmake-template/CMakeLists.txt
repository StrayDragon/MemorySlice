# ! @see:https://www.zhihu.com/question/276415476/answer/537782595?utm_source=wechat_session&utm_medium=social&utm_oi=61706944380928

cmake_minimum_required(VERSION 3.3) # 设置项目构建最低CMake版本

project(demo) # [可选] ⽣成VS / Xcode⼯程时会⽤到

# 在本机查找依赖
find_package(spdlog REQUIRED) # 引入 spdlog::spdlog ⽬标

# 查找时可具体到某个版本,某个组件（ 需要库支持 ）
set(Boost_USE_MULTITHREADED OFF) # 库提供额外参数可设置依赖库的性
find_package(Boost 1.67 COMPONENTS program_options REQUIRED) # 引入 Boost::program_options 目标

# 添加可执行文件目标（库目标则是 add_library，后续设置一致） 
add_executable(demo demo.cpp utils.hpp utils.cpp) 

# 可以配置所需编译特性（也可以只设置具体特性比如 cxx_lambdas，让 CMake 自己选择版本） 
target_compile_features(demo PRIVATE cxx_std_14) 

# 可以配置警告（目前还是复杂了点，官方有计划抽象成类似 target_compile_feature 的接口） 
target_compile_options(demo PRIVATE 
		$<$<OR:$<CXX_COMPILER_ID:GNU>,
		$<CXX_COMPILER_ID:Clang>>:"-Wall"> 
		$<$<CXX_COMPILER_ID:MSVC>:"/W4">
) 

# 可以配置依赖，会继承依赖项的 INTERFACE 和 PUBLIC 属性，所以不必手动配置 include 和 lib 等 
target_link_libraries(demo PRIVATE Boost::program_options spdlog::spdlog)
