function RsLib:CreateFont(name,size,height)
    surface.CreateFont( "RsFont." .. name, {
        font = "Roboto",
        size = size or 16,
        weight = weight or 500
      })
end

RsLib:CreateFont("H1",20)