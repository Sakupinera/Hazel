include "./vendor-ex/premake/premake_customization/solution_items.lua"
include "Dependencies.lua"

workspace "Hazel"
	architecture "x86_64"
	startproject "Hazel-Editor"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

	solution_items
	{
		".editorconfig"
	}

	flags
	{
		"MultiProcessorCompile"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Show in Solution
group "Dependencies"
	include "vendor-ex/premake"
	include "Hazel/vendor-ex/GLFW"
	include "Hazel/vendor-ex/Glad"
	include "Hazel/vendor-ex/imgui"
	include "Hazel/vendor-ex/yaml-cpp"
group ""

include "Hazel"
include "Sandbox"
include "Hazel-Editor"
