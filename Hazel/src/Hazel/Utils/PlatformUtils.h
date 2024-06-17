#pragma once

#include <string>

namespace Hazel {

	class FileDialogs
	{
	public:
		// These return empty strings if cancelled
		//static std::optional<std::string> OpenFile(const char* filter);
		//static std::optional<std::string> SaveFile(const char* filter);
		static std::string OpenFile(const char* filter);
		static std::string SaveFile(const char* filter);
	};

}
