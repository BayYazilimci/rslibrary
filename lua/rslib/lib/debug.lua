function RsLibdebug(message)
    if not message then
      message = "nil"
    end
    
    print("[DEBUG] " .. tostring(message))
end

// RsLibdebug("Help")
