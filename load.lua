function checkGame()
    if game.PlaceId == 6403373529 or game.PlaceId == 9015014224 or game.PlaceId == 11520107397 or game.PlaceId == 9431156611 then
       return "scriptmasterhub"
      else
       return "Universal"
    end
end

loadstring(game:HttpGet(('https://raw.githubusercontent.com/TheScriptMaster1/ScriptMaster-Hub/main/'..checkGame()..'.lua')))()
