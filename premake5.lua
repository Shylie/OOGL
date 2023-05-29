workspace "OOGL"
	configurations { "Debug", "Release" }

	location "build"

	filter "configurations:Debug"
		symbols "On"
		optimize "Off"
		defines "DEBUG"

	filter "configurations:Release"
		symbols "Off"
		optimize "Full"

	filter {}

project "OOGL"
	location "%{wks.location}/%{prj.name}"
	targetdir "%{wks.location}/bin/%{prj.name}/%{cfg.buildcfg}"

	language "C++"
	kind "StaticLib"

	vpaths
	{
		["libjpeg Header Files"] = { "src/GL/Util/libjpeg/*.h" },
		["libjpeg Source Files"] = { "src/GL/Util/libjpeg/*.c" },
		["libpng Header Files"] = { "src/GL/Util/libpng/*.h" },
		["libpng Source Files"] = { "src/GL/Util/libpng/*.c" },
		["zlib Header Files"] = { "src/GL/Util/zlib/*.h" },
		["zlib Source Files"] = { "src/GL/Util/zlib/*.c" },
		["OOGL Header Files"] = { "include/"}
	}
	files
	{
		"src/GL/Util/libpng/*.h", "src/GL/Util/libpng/*.c",
		"src/GL/Util/libjpeg/*.h", "src/GL/Util/libjpeg/*.c",
		"src/GL/Util/zlib/*.h", "src/GL/Util/zlib/*.c",
		"include/GL/**.hpp", "src/GL/**.cpp"
	}

	includedirs { "include", "src" }