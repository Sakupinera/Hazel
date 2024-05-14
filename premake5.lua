include "./vendor-ex/premake/premake_customization/solution_items.lua"

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

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "%{wks.location}/Hazel/vendor-ex/GLFW/include"
IncludeDir["Glad"] = "%{wks.location}/Hazel/vendor-ex/Glad/include"
IncludeDir["ImGui"] = "%{wks.location}/Hazel/vendor-ex/imgui"
IncludeDir["glm"] = "%{wks.location}/Hazel/vendor-ex/glm"
IncludeDir["stb_image"] = "%{wks.location}/Hazel/vendor-ex/stb_image"
IncludeDir["entt"] = "%{wks.location}/Hazel/vendor-ex/entt/include"
IncludeDir["yaml_cpp"] = "%{wks.location}/Hazel/vendor-ex/yaml-cpp/include"
IncludeDir["ImGuizmo"] = "%{wks.location}/Hazel/vendor-ex/ImGuizmo"

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
