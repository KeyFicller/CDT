project "CDT"
    kind "StaticLib"
    language "C++"
    staticruntime "on"
    
    targetdir(envir_work_space_directory .. "/bin/" .. envir_output_directory .. "/%{prj.name}")
    objdir(envir_work_space_directory .. "/bin-int/" .. envir_output_directory .. "/%{prj.name}")

    defines {"_CRT_SECURE_NO_WARNINGS"}

	files
	{
        "CDT/include/**.h",
        "CDT/include/**.hpp",
        "CDT/src/**.cpp",
        "premake5.lua"
    }

    postbuildcommands
    {
        ("{COPY} %{cfg.buildtarget.relpath} \"../../bin/" .. envir_output_directory .. "/sandbox/\"")
    }
    
	filter "system:windows"
        systemversion "latest"

        links
        {
            "opengl32.lib"
        }

    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"