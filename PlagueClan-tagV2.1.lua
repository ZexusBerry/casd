menu.add_int("clantag", 0)
menu.combo(GLOBAL_SCRIPTID, "Clantag", "clantag", {"Off", "fatality", "neopredelenu", "Onetap", "Plaguecheat.cc", "gamesense", "Neverlose.cc"})

local clantag_enabled = true
local old_clantag_string = ""

local function clantags()
    if i_engine_client.IsConnected() and i_engine_client.IsInGame() then
        local clantag_option = menu.get_int("clantag")
        
        if clantag_option == 0 and clantag_enabled then
            cheat.set_clantag("ZexusFuckAll")
            clantag_enabled = false
            return
        end

        local clantag_variants = {
            [1] = {
                " ", "f|", "fa|", "fat|", "fata|", "fatal|", "fatali|", "fatalit|",
                "fatality", "fatality", "fatality", "fatality", "fatalit|", "fatali|",
                "fatal|", "fata|", "fat|", "fa|", "f|", " "
            },
            [2] = {
                " INTERIUM? ", " SKEET.cc? ", " OSIRIS? ", " RAWETRIP? ", " EVOLVE.XUZ? ", 
                " FATALITY? ", " GAMESENSE? ", " W1NNER.PW? ", " MIDNIGHT? ", " XONE? ", 
                " NEVERLOSE? ", " NIXWARE? ", " WEAVE.SU? ", " OTCV3? ", " AURORA? ", 
                " ExtrimHack? ", " FluidAim? ", " OTCV4? ", " Qo0? ", " SpirtHack? "
            },
            [3] = {
                "", "O", "On", "One", "Onet", "Oneta", "Onetap", "Onetap.",
                "Onetap.s", "Onetap.su", "Onetap.s", "Onetap.", "Onetap", 
                "Oneta", "Onet", "One", "On", "O", ""
            },
            [4] = {
                "P", "Pl", "Pla", "Plag", "Plagu", "Plague", "Plaguec", "Plaguech", 
                "Plagueche", "Plaguechea", "Plaguecheat", "Plaguecheat.", "Plaguecheat.c", 
                "Plaguecheat.cc", "Plaguecheat.c", "Plaguecheat.", "Plaguecheat", 
                "Plaguechea", "Plaguech", "Plaguec", "Plague", "Plagu", "Plag", 
                "Pla", "Pl", "P"
            },
            [5] = {
                "G", "Ga", "Gam", "Game", "Games", "Gamesen", "Gamesens", "Gamesense",
                "Gamesense", "Gamesense", "Gamesens", "Gamesen", "Games", "Game", 
                "Gam", "Ga", "G"
            },
            [6] = {
                "N", "Ne", "Nev", "Neve", "Never", "Neverl", "Neverlo", "Neverlos",
                "Neverlose", "Neverlose.", "Neverlose.c", "Neverlose.cc", "Neverlose.c", 
                "Neverlose.", "Neverlose", "Neverlos", "Neverlo", "Neverl", "Never",
                "Neve", "Nev", "Ne", "N"
            }
        }
        
        local tags = clantag_variants[clantag_option]
        if tags then
            local curtime = math.floor(i_global_vars.GetCurTime() * 3)
            local clantag_string = tags[curtime % #tags + 1]
            
            if clantag_string ~= old_clantag_string then
                cheat.set_clantag(clantag_string)
                old_clantag_string = clantag_string
            end
        end
    end
end

cheat.add_hook_callback(GLOBAL_SCRIPTID, "draw", clantags)
