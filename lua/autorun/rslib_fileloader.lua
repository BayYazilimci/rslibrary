RsLib = RsLib or {}
RsLib.Dir = "rslib"

function RsLib:IncludeClient(path)
  local str = self.Dir .. "/" .. path .. ".lua"
  print("Include RsLib file", str)

  if(CLIENT)then
    include(str)    
  end
end

function RsLib:IncludeShared(path)
  if (SERVER) then
		include("rslib/" .. path .. ".lua")
	end

  if(CLIENT)then
    include("rslib/" .. path .. ".lua")
  end
end

//Elements
RsLib:IncludeClient("element/buttons/button")
RsLib:IncludeClient("element/buttons/button2")
RsLib:IncludeClient("element/buttons/button3")
RsLib:IncludeClient("element/buttons/button4")
RsLib:IncludeClient("element/sliderbar")
RsLib:IncludeClient("element/slider")
//Library
RsLib:IncludeShared("lib/debug")
RsLib:IncludeClient("lib/numbersys")
RsLib:IncludeClient("lib/frame/base")
RsLib:IncludeClient("lib/frame/navbar")
RsLib:IncludeClient("lib/frame/sidebar")
//Theme
RsLib:IncludeClient("theme/theme")
//Font
RsLib:IncludeClient("misc/font")